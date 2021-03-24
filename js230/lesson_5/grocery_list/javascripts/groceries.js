(function groceryListManager() {
  class GroceryList {
    constructor(listContainerElement) {
      this.list = document.querySelector(listContainerElement);
    }

    addItem(name, quantity) {
      const listItem = document.createElement('li');
      listItem.append(`${quantity} ${name}`);

      this.list.append(listItem);
    }
  }

  document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('main form');
    const myGroceryList = new GroceryList('#grocery-list');
    const getValueOf = (selector) => form.querySelector(selector).value;

    form.addEventListener('submit', event => {
      event.preventDefault();

      const name = getValueOf('input#name');
      const quantity = getValueOf('input#quantity') || '1';

      myGroceryList.addItem(name, quantity);

      form.reset();
    });
  });
})();
