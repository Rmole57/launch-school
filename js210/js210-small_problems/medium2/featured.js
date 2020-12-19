"use strict";

function featured(number) {
  const MAX_FEATURED = 9876543201;

  number = toOddMultipleOf7(number);

  for (let featuredNum = number; featuredNum <= MAX_FEATURED; featuredNum += 14) {
    if (allUnique(featuredNum)) return featuredNum;
  }

  return 'Sorry! There is no next featured number!';
}

function toOddMultipleOf7(number) {
  number += 7 - (number % 7);
  if (number % 2 === 0) number += 7;
  return number;
}

function allUnique(number) {
  let digitStrings = String(number).split('');
  return digitStrings.every((digit, index) => !digitStrings.slice(index + 1).includes(digit));
}

console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // 'Sorry! There is no next featured number!'


// ALTERNATIVE SOLUTION:

// function featured(number) {
//   const MAX_FEATURED = 9876543201;
//   let featuredNum = toOddMultipleOf7(number);

//   do {
//     if (allUnique(featuredNum) && featuredNum > number) {
//       return featuredNum;
//     }

//     featuredNum += 14;
//   } while (featuredNum < MAX_FEATURED);

//   return 'There is no possible number that fulfills those requirements.';
// }

// function toOddMultipleOf7(number) {
//   while (number % 2 === 0 || number % 7 !== 0) {
//     number += 1;
//   }

//   return number;
// }

// function allUnique(number) {
//   const digits = String(number).split('');
//   const seen = {};

//   for (let i = 0; i < digits.length; i += 1) {
//     if (seen[digits[i]]) {
//       return false;
//     } else {
//       seen[digits[i]] = true;
//     }
//   }

//   return true;
// }
