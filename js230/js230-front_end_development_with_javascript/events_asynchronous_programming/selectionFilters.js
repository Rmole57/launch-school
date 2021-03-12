function filterOptions(list, ...options) {
  let optionElements = Array.from(list.children);

  optionElements.forEach(option => {
    if (!options.includes(option.value)) {
      option.style.display = 'none';
    }
  });

  optionElements.filter(option => option.style.display !== 'none')[0]
                .selected = true;
}

function revealListOptions(list) {
  Array.from(list.children).forEach(child => {
    child.style.display = null;
  });
}

function resetAllOptions() {
  revealListOptions(classifications);
  revealListOptions(animals);

  const defaults = ['Classifications', 'Animals'];
  defaults.forEach(defaultValue => {
    let defaultOption = document.querySelector(`[value="${defaultValue}"]`);
    defaultOption.style.display = null;
    defaultOption.selected = true;
  });
}

const classifications = document.querySelector('#animal-classifications');
const animals = document.querySelector('#animals');
const clear = document.querySelector('#clear');

classifications.addEventListener('change', event => {
  revealListOptions(animals);

  switch (event.target.value) {
    case 'Vertebrate':
      filterOptions(animals, 'Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich');
      break;
    case 'Warm-blooded':
      filterOptions(animals, 'Bear', 'Whale', 'Ostrich');
      break;
    case 'Cold-blooded':
      filterOptions(animals, 'Salmon', 'Turtle');
      break;
    case 'Mammal':
      filterOptions(animals, 'Bear', 'Whale');
      break;
    case 'Bird':
      filterOptions(animals, 'Ostrich');
  }
});

animals.addEventListener('change', event => {
  revealListOptions(classifications);

  switch (event.target.value) {
    case 'Bear':
    case 'Whale':
      filterOptions(classifications, 'Vertebrate', 'Warm-blooded', 'Mammal');
      break;
    case 'Turtle':
    case 'Salmon':
      filterOptions(classifications, 'Vertebrate', 'Cold-blooded');
      break;
    case 'Ostrich':
      filterOptions(classifications, 'Vertebrate', 'Warm-blooded', 'Bird');
  }
});

clear.addEventListener('click', event => {
  event.preventDefault();
  resetAllOptions();
});


// ALTERNATIVE SOLUTION:

// const linkedOptions = {
//   classifications: {
//     Vertebrate: ['Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
//     'Warm-blooded': ['Bear', 'Whale', 'Ostrich'],
//     'Cold-blooded': ['Salmon', 'Turtle'],
//     Mammal: ['Bear', 'Whale'],
//     Bird: ['Ostrich'],
//     Classifications: ['Animals', 'Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
//   },
//   animals: {
//     Bear: ['Vertebrate', 'Warm-blooded', 'Mammal'],
//     Turtle: ['Vertebrate', 'Cold-blooded'],
//     Whale: ['Vertebrate', 'Warm-blooded', 'Mammal'],
//     Salmon: ['Vertebrate', 'Cold-blooded'],
//     Ostrich: ['Vertebrate', 'Warm-blooded', 'Bird'],
//     Animals: ['Classifications', 'Vertebrate', 'Warm-blooded', 'Cold-blooded', 'Mammal', 'Bird'],
//   },
// };

// const animalClassifications = document.querySelector('#animal-classifications');
// const animals = document.querySelector('#animals');
// const clearFiltersBtn = document.querySelector('#clear');
// let animalClassificationsValue;
// let animalsValue;

// function setOptions({options}, filters) {
//   options.length = 0;
//   filters.forEach((value, index) => {
//     options[index] = new Option(value)
//   });
// }

// function setDefault(event) {
//   event.preventDefault();
//   setOptions(animalClassifications, ['Classifications', 'Vertebrate', 'Warm-blooded', 'Cold-blooded', 'Mammal', 'Bird']);
//   setOptions(animals,  ['Animals', 'Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich']);  
// }

// animalClassifications.addEventListener('change', event => {
//   animalClassificationsValue = animalClassifications.options[animalClassifications.selectedIndex].value
//   setOptions(animals, linkedOptions['classifications'][animalClassificationsValue])
// });

// animals.addEventListener('change', event => {
//   animalsValue = animals.options[animals.selectedIndex].value
//   setOptions(animalClassifications, linkedOptions['animals'][animalsValue])
// });

// clearFiltersBtn.addEventListener('click', setDefault);
