function objectHasProperty(obj, propertyName) {
  for (let name in obj) {
    if (name === propertyName) return true;
  }

  return false;
}

let pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

console.log(objectHasProperty(pets, 'dog'));       // true
console.log(objectHasProperty(pets, 'lizard'));    // false
console.log(objectHasProperty(pets, 'mice'));      // true


// ALTERNATIVE SOLUTION:

// function objectHasProperty(object, propertyName) {
//   let keys = Object.keys(object);
//   return keys.indexOf(propertyName) !== -1;
// }
