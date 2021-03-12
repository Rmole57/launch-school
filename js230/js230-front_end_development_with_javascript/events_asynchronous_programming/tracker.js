function track(callback) {
  function isTrackedEvent(events, event) {
    return events.includes(event);
  }

  return function (event) {
    if (!isTrackedEvent(tracker.list(), event)) {
      tracker.add(event);
    }

    callback(event);
  };
}

const tracker = (() => {
  const events = [];

  return {
    list() {
      return [...events];
    },

    elements() {
      return this.list().map(({target}) => target);
    },

    add(event) {
      events.push(event);
    },

    clear() {
      events.length = 0;
      return events.length;
    },
  };
})();

const divRed = document.querySelector('#red');
const divBlue = document.querySelector('#blue');
const divOrange = document.querySelector('#orange');
const divGreen = document.querySelector('#green');

divRed.addEventListener('click', track(event => {
  document.body.style.background = 'red';
}));

divBlue.addEventListener('click', track(event => {
  event.stopPropagation();
  document.body.style.background = 'blue';
}));

divOrange.addEventListener('click', track(event => {
  document.body.style.background = 'orange';
}));

divGreen.addEventListener('click', track(event => {
  document.body.style.background = 'green';
}));
