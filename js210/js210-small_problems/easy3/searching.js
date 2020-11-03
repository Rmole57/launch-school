"use strict";

const rlSync = require('readline-sync');

const numbers = [];

numbers.push(rlSync.question('Enter the 1st number: '));
numbers.push(rlSync.question('Enter the 2nd number: '));
numbers.push(rlSync.question('Enter the 3rd number: '));
numbers.push(rlSync.question('Enter the 4th number: '));
numbers.push(rlSync.question('Enter the 5th number: '));

let lastNumber = rlSync.question('Enter the last number: ');

if (numbers.includes(lastNumber)) {
  console.log(`The number ${lastNumber} appears in [${numbers.join(', ')}].`);
} else {
  console.log(`The number ${lastNumber} does not appear in [${numbers.join(', ')}].`);
}


// FURTHER EXPLORATION:

// Given LS code:
// function isIncluded(arr, val) {
//   for (let i = 0; i < arr.length; i += 1) {
//     if (arr[i] > val) {
//       return true;
//     }
//   }

//   return false;
// }

// console.log(isIncluded(numbers, 25));

// Refactored code using Array.prototype.some():
// function isIncluded(arr, val) {
//   return arr.some( num => num > val);
// }

// console.log(isIncluded(numbers, 25));
