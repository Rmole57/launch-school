"use strict";

// The below solution could be refactored but left as is to practice
// some lesser-used, but still useful, built-in functions:
function negative(number) {
  if (Math.sign(number) === 1 || Object.is(number, 0)) {
    return number * -1;
  }

  return number;
}

console.log(negative(5));     // -5
console.log(negative(-3));    // -3
console.log(negative(0));     // -0
console.log(negative(-0));     // -0


// ALTERNATIVE SOLUTION:

// function negative(number) {
//   return Math.abs(number) * -1;
// }


// FURTHER EXPLORATION:

// function negative(number) {
//   return number < 0 ? number : Math.abs(number) * -1;
// }
