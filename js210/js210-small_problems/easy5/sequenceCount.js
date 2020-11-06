"use strict";

function sequence(count, startNum) {
  const numbers = [];
  for (let multiplier = 1; multiplier <= count; multiplier += 1) {
    numbers.push(startNum * multiplier);
  }

  return numbers;
}

console.log(sequence(5, 1));          // [1, 2, 3, 4, 5]
console.log(sequence(4, -7));         // [-7, -14, -21, -28]
console.log(sequence(3, 0));          // [0, 0, 0]
console.log(sequence(0, 1000000));    // []


// ALTERNATIVE SOLUTION:

// function sequence(count, startNum) {
//   const result = [];
//   let sum = 0;

//   for (let i = 0; i < count; i += 1) {
//     result.push(sum += startNum);
//   }

//   return result;
// }
