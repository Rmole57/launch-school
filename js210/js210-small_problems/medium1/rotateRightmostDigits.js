"use strict";

function rotateRightmostDigits(number, n) {
  let digits = String(number);
  let rotateIndex = digits.length - n;
  let rotatedDigits = rotate(digits.slice(rotateIndex));
  let resultString = digits.slice(0, rotateIndex) + rotatedDigits;

  return Number(resultString);
}

function rotate(string) {
  return string.slice(1) + string[0];
}

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917


// ALTERNATIVE SOLUTION:

// function rotateRightmostDigits(number, n) {
//   const numberString = String(number);
//   const firstPart = numberString.slice(0, numberString.length - n);
//   const secondPart = numberString.slice(numberString.length - n);
//   const resultString = firstPart + rotateString(secondPart);

//   return Number(resultString);
// }

// function rotateString(string) {
//   return string.slice(1) + string[0];
// }
