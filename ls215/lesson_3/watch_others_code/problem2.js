"use strict";

function luhnCheck(numString) {
  let cleanedString = numString.replace(/\D/g, '');
  let digits = cleanedString.split('').reverse().map(Number);

  let checksum = digits.reduce((sum, digit, idx) => {
    if (idx % 2 === 0) return sum + digit;

    let product = digit * 2 >= 10 ? (digit * 2) - 9 : digit * 2;
    return sum + product;
  });

  return checksum % 10 === 0;
}

// valid numbers:
console.log(luhnCheck('2323200577663554'));    // true
console.log(luhnCheck('8763'));                // true
console.log(luhnCheck('20058764'));            // true

// invalid numbers:
console.log(luhnCheck('1111'));                // false
console.log(luhnCheck('2005'));                // false
console.log(luhnCheck('2323200577663555'));    // false

// valid, but includes non-number chars:
console.log(luhnCheck('2323-2005.7766-3554')); // true
console.log(luhnCheck('2323 2005 7766 3554')); // true

//invalid, but includes non-number chars:
console.log(luhnCheck('2323-2005.7766-3555')); // false
console.log(luhnCheck('2323 2005 7766 3555')); // false


// FURTHER EXPLORATION:

// 1)
// function formatValidNumber(numString) {
//   if (luhnCheck(numString)) return numString;

//   for (let checkDigit = 0; checkDigit <= 9; checkDigit += 1) {
//     let newString = numString + String(checkDigit);
//     if (luhnCheck(newString)) return newString;
//   }
// }

// console.log(formatValidNumber('2323 2005 7766 355'));  // '2323 2005 7766 3554'
// console.log(formatValidNumber('2323 2005 7766 3554')); // '2323 2005 7766 3554'
// console.log(formatValidNumber('1111'));                // '11114'
// console.log(formatValidNumber('2324'));                // '23242'

// 2)
// function checksum(numString) {
//   let cleanedString = numString.replace(/\D/g, '');
//   let digits = cleanedString.split('').reverse().map(Number);

//   let sum = digits.reduce((acc, digit, idx) => {
//     if (idx % 2 === 0) return acc + digit;

//     let product = digit * 2 >= 10 ? (digit * 2) - 9 : digit * 2;
//     return acc + product;
//   });

//   return sum % 10;
// }

// function formatValidNumber(numString) {
//   if (checksum(numString) === 0) return numString;
//   let checkDigit = 10 - checksum(numString + '0');
//   return numString + String(checkDigit);
// }

// console.log(formatValidNumber('2323 2005 7766 355'));  // '2323 2005 7766 3554'
// console.log(formatValidNumber('2323 2005 7766 3554')); // '2323 2005 7766 3554'
// console.log(formatValidNumber('1111'));                // '11114'
// console.log(formatValidNumber('2324'));                // '23242'
