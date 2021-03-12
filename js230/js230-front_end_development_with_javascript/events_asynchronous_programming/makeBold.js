function makeBold(element, callback) {
  element.style.fontWeight = 'bold';

  if (callback && typeof callback === 'function') {
    callback(element);
  }
}

let sectionElement = document.querySelector('section');
makeBold(sectionElement, function(elem) {
  elem.classList.add('highlight');
});

console.log(sectionElement.classList.contains('highlight'));
console.log(sectionElement.style.fontWeight);


// FURTHER EXPLORATION:

// function makeBold(element) {
//   element.style.fontWeight = 'bold';
//   const event = new CustomEvent('bolded');

//   element.dispatchEvent(event);
// }

// let sectionElement = document.querySelector('section');
// sectionElement.addEventListener('bolded', event => {
//   alert(event.target.tagName);
//   event.target.classList.add('highlight');
// });

// makeBold(sectionElement);

// console.log(sectionElement.classList.contains('highlight'));
// console.log(sectionElement.style.fontWeight);
