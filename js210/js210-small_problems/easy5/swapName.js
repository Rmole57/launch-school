"use strict";

function swapName(name) {
  return name.split(' ').reverse().join(', ');
}

console.log(swapName('Joe Roberts'));    // "Roberts, Joe"


// FURTHER EXPLORATION:

// function swapName(name) {
//   const names = name.split(' ');
//   const lastName = names.pop();
//   const firstNames = names.join(' ');

//   return `${lastName}, ${firstNames}`;
// }

// console.log(swapName('Ricky Bobby Roberts'));
