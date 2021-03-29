document.addEventListener('DOMContentLoaded', event => {
  const templates = (() => {
    const result = {};

    document.querySelectorAll("script[type='text/x-handlebars']").forEach(tmpl => {
      result[tmpl.id] = Handlebars.compile(tmpl.innerHTML);

      if (tmpl.getAttribute('data-type') === 'partial') {
        Handlebars.registerPartial(tmpl.id, tmpl.innerHTML);
      }
    });

    return result;
  })();

  function formDataToJson(formData) {
    const json = {};
    json.tags = [];

    [...formData].forEach(([name, value]) => {
      if (name.startsWith('tag_')) {
        let tagValue = document.querySelector(`[for="${name}"]`).textContent;
        json.tags.push(tagValue);
      } else {
        json[name] = value;
      }
    });

    json.tags = json.tags.join(',');

    return json;
  }

  function parents(startNode, selector) {
    let parent = startNode;

    while (!parent.hasAttribute(selector)) {
      parent = parent.parentElement;
    }

    return parent;
  }

  class ContactManager {
    constructor() {
      this.uiManager = new UI(this);
      this.tagManager = new TagManager(this);
      this.uiManager.showMenuById('contact-menu');
      this.bind();
    }

    getContacts() {
      fetch('/api/contacts')
        .then(response => response.json())
        .then(contactJson => {
          this.contacts = contactJson;

          this.contacts.forEach(contact => {
            contact.tags = contact.tags ? contact.tags.split(',') : [];
          });

          this.tags = this.tagManager.getAllTags();
          this.uiManager.renderContacts(this.contacts);
      });
    }

    submitForm(e) {
      e.preventDefault();

      const form = document.querySelector('#form-menu form');

      const json = formDataToJson(new FormData(form));
      const methodType = form.dataset.formCrud === 'add' ? 'POST' : 'PUT';

      this.requestAddEdit(form, json, methodType);
    }

    requestAddEdit(form, json, method) {
      const init = {
        method,
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(json)
      };

      fetch(form.action, init)
        .then(response => {
        if (response.status === 201) {
          alert(`Contact successfully ${method === 'POST' ? 'created' : 'edited'}!`);
          this.uiManager.showMenuById('contact-menu');
        } else {
          alert(response.statusText);
          form.reset();
        }
      });
    }

    deleteContact(e) {
      const contactId = parents(e.target, 'data-contact-id').dataset.contactId;

      if (confirm('Are you sure you want to delete this contact?')) {
        fetch(`/api/contacts/${contactId}`, { method: 'DELETE' })
          .then(response => {
            if (response.status === 204) {
              alert('Contact successfully deleted!');
              this.uiManager.showMenuById('contact-menu');
            } else {
              alert(response.statusText);
            }
        });
      }
    }

    bind() { 
      const formMenu = document.querySelector('#form-menu');
      formMenu.addEventListener('submit', e => this.submitForm(e));
    }
  }

  class UI {
    constructor(contactManager) {
      this.contactManager = contactManager;
      this.searchManager = new SearchManager(this);
      this.bind();
    }

    renderContacts(contacts) {
      document.querySelector('#contact-content').innerHTML = templates.contacts({ contacts });
    }

    showMenuById(menuId) {
      [...document.querySelector('main').children].forEach(child => {
        child.classList.remove('show');
      });

      if (menuId === 'contact-menu') {
        document.querySelector('#search-bar').value = null;
        this.contactManager.getContacts();
      }

      document.querySelector(`#${menuId}`).classList.add('show');
    }

    renderForm(e, crudType) {
      const formMenu = document.querySelector('#form-menu');
      const path = '/api/contacts';
      let formInfo;
      let contact;

      if (crudType === 'add') {
        formInfo = {
          title_action: 'Add',
          data_action: 'add',
          path,
          tags: this.contactManager.tags
        };
      } else {
        const contactId = parents(e.target, 'data-contact-id').dataset.contactId;
        contact = this.contactManager.contacts.find(contact => contact.id === Number(contactId));

        formInfo = {
          title_action: 'Edit',
          data_action: 'edit',
          path: path + `/${contactId}`,
          tags: this.contactManager.tags,
          contact
        };
      }

      formMenu.innerHTML = templates.add_edit_form(formInfo);

      if (contact) {
        formMenu.querySelectorAll('input[type="checkbox"]').forEach(tag => {
          if (contact.tags.includes(tag.nextElementSibling.textContent)) {
            tag.checked = true;
          }
        });
      }

      this.formManager = new FormManager(formMenu);
      this.contactManager.tagManager.bind();
      this.showMenuById('form-menu');
    }

    crudClicks(e) {
      const crudType = e.target.dataset.btnCrud;

      switch (crudType) {
        case 'add':
        case 'edit':
          this.renderForm(e, crudType);
          break;
        case 'delete':
          this.contactManager.deleteContact(e);
          break;
        case 'cancel':
          this.showMenuById('contact-menu');
      }
    }

    headerNav(e) {
      this.showMenuById('contact-menu');
    }

    bind() {
      const main = document.querySelector('main');
      main.addEventListener('click', e => this.crudClicks(e));

      const headerH1 = document.querySelector('header h1');
      headerH1.addEventListener('click', e => this.headerNav(e));
    }
  }

  class FormManager {
    constructor(form) {
      this.form = form;
      this.bind();
    }

    invalidateInput(e) {
      e.preventDefault();

      const input = e.target;
      const inputLabel = input.parentElement.previousElementSibling;
      const errorMessage = input.nextElementSibling;

      const elementsToValidate = [input, inputLabel, errorMessage];
      input.oninput = e => this.validateInput(e, elementsToValidate);

      this.addInvalidClass(elementsToValidate);
    }

    validateInput(e, elementsToValidate) {
      this.removeInvalidClass(elementsToValidate);
    }

    addInvalidClass(elements) {
      elements.forEach(element => {
        element.classList.add('invalid');
      });
    }

    removeInvalidClass(elements) {
      elements.forEach(element => {
        element.classList.remove('invalid');
      });
    }

    bind() {
      const inputs = this.form.querySelectorAll('#contact-entries input');

      inputs.forEach(input => {
        input.addEventListener('invalid', e => this.invalidateInput(e));
      });
    }
  }

  class TagManager {
    constructor(contactManager) {
      this.contactManager = contactManager;
    }

    getAllTags() {
      const allTags = [];

      this.contactManager.contacts.forEach(({tags}) => {
        tags.forEach(tag => {
          if (!allTags.includes(tag)) {
            allTags.push(tag);
          }
        });
      });

      return allTags;
    }

    addTag(e) {
      const tagInput = document.querySelector('#new-tag');
      const tagName = tagInput.value;
      const formType = document.querySelector('#form-menu > form').dataset.dataAction;

      if (this.isValidTag(tagName)) {
        const tagsContainer = document.querySelector('#available-tags');
        const noTagsMessage = tagsContainer.querySelector('p');

        if (noTagsMessage) {
          tagsContainer.removeChild(noTagsMessage);
        }

        const newTag = document.createElement('input');
        newTag.type = "checkbox";
        newTag.name = `tag_${tagName}`;
        newTag.checked = true;

        const newLabel = document.createElement('label');
        newLabel.htmlFor = `tag_${tagName}`;
        newLabel.textContent = tagName;

        [newTag, newLabel].forEach(element => tagsContainer.appendChild(element));

        tagInput.value = null;
      } else {
        if (this.isDuplicateTag(tagName)) {
          alert('Sorry, that tag already exists!');
        } else {
          alert('Invalid Tag Name! Please enter a single-word tag name.');
        }
      }
    }

    isDuplicateTag(tagName) {
      return this.contactManager.tags.some(tag => {
        const tagRegex = new RegExp(tag, 'i');
        return tagRegex.test(tagName);
      });
    }

    isValidTag(tagName) {
      return /^[a-z]+$/i.test(tagName) && !this.isDuplicateTag(tagName);
    }

    bind() {
      const addTagBtn = document.querySelector('#add-tag button');
      addTagBtn.addEventListener('click', (e) => this.addTag(e));
    }
  }

  class SearchManager {
    constructor(uiManager) {
      this.uiManager = uiManager;
      this.bind();
    }

    searchRender(e) {
      const searchValue = e.target.value;
      const searchParams = searchValue.split(', ');
      let contacts = this.uiManager.contactManager.contacts;

      if (searchValue.length > 0) {
        contacts = this.filterBySearchParams(searchParams, contacts);

        if (contacts.length > 0) {
          this.uiManager.renderContacts(contacts);
        } else {
          document.querySelector('#contact-content').innerHTML = templates.no_search_results({search_value: searchValue});
        }
      } else {
        this.uiManager.renderContacts(contacts);
      }
    }

    filterBySearchParams(params, contacts) {
      return contacts.filter(contact =>  this.paramsMatch(params, contact));
    }

    paramsMatch(params, contact) {
      return params.every(param => {
        const paramRegex = new RegExp(`(?<=\\s|^)${param}`, 'gi');

        return this.nameMatch(paramRegex, contact.full_name) ||
               this.tagMatch(paramRegex, contact.tags);
      });
    }

    nameMatch(paramRegex, contactName) {
      return paramRegex.test(contactName);
    }

    tagMatch(paramRegex, contactTags) {
      return contactTags.some(tag => paramRegex.test(tag));
    }

    bind() {
      const searchBar = document.querySelector('#search-bar');
      searchBar.oninput = e => this.searchRender(e);
    }
  }

  new ContactManager();
});
