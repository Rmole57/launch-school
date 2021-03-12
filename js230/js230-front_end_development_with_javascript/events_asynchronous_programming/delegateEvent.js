function delegateEvent(parentElement, selector, eventType, callback) {
  if (parentElement && parentElement instanceof Element) {
    parentElement.addEventListener(eventType, event => {
      const descendants = Array.from(parentElement.querySelectorAll(selector));

      if (descendants.includes(event.target)) {
        callback(event);
      }
    });

    return true;
  }
}

// Possible elements for use with the scenarios
const element1 = document.querySelector('table');
const element2 = document.querySelector('main h1');
const element3 = document.querySelector('main');

// Possible callback for use with the scenarios
const callback = ({target, currentTarget}) => {
  alert(`Target: ${target.tagName}\nCurrent Target: ${currentTarget.tagName}`);
};

// Scenario 1:
// delegateEvent(element1, 'p', 'click', callback);        // undefined

// Scenario 2:
// delegateEvent(element2, 'p', 'click', callback);        // true

// Scenario 3:
// delegateEvent(element2, 'h1', 'click', callback);       // true

// Scenario 4:
// delegateEvent(element3, 'h1', 'click', callback);       // true

// Scenario 5:
// delegateEvent(element3, 'aside p', 'click', callback);  // true

// Scenario 6:
// delegateEvent(element2, 'p', 'click', callback);        // true

// const newP = document.createElement('P');
// const newContent = document.createTextNode('New Paragraph');
// newP.appendChild(newContent);

// element2.appendChild(newP);
