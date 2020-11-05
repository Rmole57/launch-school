"use strict";

function showMultiplicativeAverage(numbers) {
  const product = numbers.reduce((acc, currNum) => acc * currNum);
  return (product / numbers.length).toFixed(3);
}

console.log(showMultiplicativeAverage([3, 5]));                   // "7.500"
console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));    // "28361.667"


// ALTERNATIVE SOLUTION:

// function showMultiplicativeAverage(numbers) {
//   let product = 1;

//   for (let i = 0; i < numbers.length; i += 1) {
//     product *= numbers[i];
//   }

//   return (product / numbers.length).toFixed(3);
// }
