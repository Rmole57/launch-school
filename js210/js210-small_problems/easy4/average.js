"use strict";

function average(numbers) {
  const sum = numbers.reduce((acc, num) => acc + num);
  return Math.floor(sum / numbers.length);
}

console.log(average([1, 5, 87, 45, 8, 8]));       // 25
console.log(average([9, 47, 23, 95, 16, 52]));    // 40


// ALTERNATIVE SOLUTION:

// function average(numbers) {
//   let sum = 0;

//   for (let i = 0; i < numbers.length; i += 1) {
//     sum += numbers[i];
//   }

//   return Math.floor(sum / numbers.length);
// }
