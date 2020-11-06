"use strict";

function reverseNumber(number) {
  return Number([...String(number)].reverse().join(''));
}

console.log(reverseNumber(12345));    // 54321
console.log(reverseNumber(12213));    // 31221
console.log(reverseNumber(456));      // 654
console.log(reverseNumber(12000));    // 21 -- Note that zeros get dropped!
console.log(reverseNumber(1));        // 1


// ALTERNATIVE SOLUTION:

// function reverseNumber(number) {
//   const numberStringArray = String(number).split('');
//   return parseInt(numberStringArray.reverse().join(''), 10);
// }
