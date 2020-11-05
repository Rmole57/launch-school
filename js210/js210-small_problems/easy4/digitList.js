"use strict";

function digitList(number) {
  const digits = [];
  while (number > 0) {
    digits.push(number % 10);
    number = Math.floor(number / 10);
  }

  return digits.reverse();
}

console.log(digitList(12345));       // [1, 2, 3, 4, 5]
console.log(digitList(7));           // [7]
console.log(digitList(375290));      // [3, 7, 5, 2, 9, 0]
console.log(digitList(444));         // [4, 4, 4]


// ALTERNATIVE SOLUTION:

// function digitList(number) {
//   const numberStringArray = String(number).split('');
//   const numberArray = [];

//   for (let i = 0; i < numberStringArray.length; i += 1) {
//     numberArray.push(parseInt(numberStringArray[i], 10));
//   }

//   return numberArray;
// }


// FURTHER EXPLORATION:

// Solution 1:
// function digitList(number) {
//   return String(number).split('').map(digit => parseInt(digit, 10));
// }

// Solution 2:
// function digitList(num) {
//   return [...String(num)].map(Number);
// }

// Solution 3:
// function digitList(number) {
//   return String(number).split('').map(Number);
// }
