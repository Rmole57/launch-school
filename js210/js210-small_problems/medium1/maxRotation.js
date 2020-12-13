"use strict";

function maxRotation(number) {
  for (let count = String(number).length; count > 1; count -= 1) {
    number = rotateRightmostDigits(number, count);
  }

  return number;
}

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

console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845
