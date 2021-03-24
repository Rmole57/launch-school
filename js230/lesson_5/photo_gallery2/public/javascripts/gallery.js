document.addEventListener('DOMContentLoaded', event => {
  const templates = {};
  let photos;
  let slideshow;

  document.querySelectorAll("script[type='text/x-handlebars']").forEach(tmpl => {
    templates[tmpl.id] = Handlebars.compile(tmpl.innerHTML);

    if (tmpl.getAttribute('data-type') === 'partial') {
      Handlebars.registerPartial(tmpl.id, tmpl.innerHTML);
    }
  });

  function renderPhotos() {
    const slides = document.querySelector('#slides');
    slides.insertAdjacentHTML('beforeend', templates.photos({ photos }));
  }

  function renderPhotoInformation(idx) {
    let photo = photos.filter(({id}) => idx === id)[0];
    const header = document.querySelector('section > header');
    header.innerHTML = null;
    header.insertAdjacentHTML('beforeend', templates.photo_information(photo));
  }

  function getCommentsFor(idx) {
    fetch(`/comments?photo_id=${idx}`)
      .then(response => response.json())
      .then(commentJson => {
        const commentList = document.querySelector('#comments ul');
        commentList.innerHTML = null;
        commentList.insertAdjacentHTML('beforeend', templates.photo_comments({ comments: commentJson }));
    });
  }

  class Slideshow {
    constructor() {
      this.slideshow = document.querySelector("#slideshow");
      let slides = this.slideshow.querySelectorAll('figure');
      this.firstSlide = slides[0];
      this.lastSlide = slides[slides.length -1];
      this.currentSlide = this.firstSlide;
      this.bind();
    }

    prevSlide(e) {
      e.preventDefault();
      let prev = this.currentSlide.previousElementSibling;

      if (!prev) prev = this.lastSlide;

      this.fadeOut(this.currentSlide);
      this.fadeIn(prev);
      this.renderPhotoContent(prev.getAttribute('data-id'));
      this.currentSlide = prev;
    }

    nextSlide(e) {
      e.preventDefault();
      let next = this.currentSlide.nextElementSibling;

      if (!next) next = this.firstSlide;

      this.fadeOut(this.currentSlide);
      this.fadeIn(next);
      this.renderPhotoContent(next.getAttribute('data-id'));
      this.currentSlide = next;
    }

    fadeOut(slide) {
      slide.classList.add('hide');
      slide.classList.remove('show');
    }

    fadeIn(slide) {
      slide.classList.add('show');
      slide.classList.remove('hide');
    }

    renderPhotoContent(idx) {
      renderPhotoInformation(Number(idx));
      getCommentsFor(idx);
    }

    bind() {
      let prevButton = this.slideshow.querySelector('a.prev');
      let nextButton = this.slideshow.querySelector('a.next');
      
      prevButton.addEventListener('click', (e) => this.prevSlide(e));
      nextButton.addEventListener('click', (e) => this.nextSlide(e));
    }
  }

  fetch('/photos')
    .then(response => response.json())
    .then(json => {
      photos = json;
      renderPhotos();
      renderPhotoInformation(photos[0].id);
      getCommentsFor(photos[0].id);
      slideshow = new Slideshow();
  });

  document.querySelector('section > header').addEventListener('click', e => {
    e.preventDefault();
    const button = e.target;

    if (button.hasAttribute('data-property')) {
      const path = button.href;
      const photo_id = button.getAttribute('data-id');
      const text = button.textContent;

      const init = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `photo_id=${photo_id}`
      }

      fetch(path, init)
        .then(response => response.json())
        .then(({total}) => {
          button.textContent = text.replace(/\d+/, total);
      });
    }
  });

  document.querySelector('form').addEventListener('submit', (e) => {
    e.preventDefault();

    const form = e.target;

    const formData = new FormData(form);
    formData.set('photo_id', slideshow.currentSlide.getAttribute('data-id'));

    const init = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: new URLSearchParams([...formData])
    }

    fetch(form.action, init)
      .then(response => response.json())
      .then(commentJson => {
        const commentList = document.querySelector('#comments ul');
        commentList.insertAdjacentHTML('beforeend', templates.photo_comment(commentJson));
    });

    form.reset();
  });
});
