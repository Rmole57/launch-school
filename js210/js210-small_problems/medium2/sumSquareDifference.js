"use strict";

function sumSquareDifference(n) {
  let positiveIntegers = arrayOfIntegers(n);
  let squareOfSum = (positiveIntegers.reduce((sum, integer) => sum + integer))**2;
  let sumOfSquares = positiveIntegers.reduce((sum, integer) => sum + integer**2, 0);
  return squareOfSum - sumOfSquares;
}

function arrayOfIntegers(limit) {
  return new Array(limit).fill(null).map((_ele, idx) => idx + 1);
}

console.log(sumSquareDifference(3));      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));     // 2640
console.log(sumSquareDifference(1));      // 0
console.log(sumSquareDifference(100));    // 25164150


// ALTERNATIVE SOLUTION:

// function sumSquareDifference(n) {
//   let sum = 0;
//   let sumOfSquares = 0;

//   for (let i = 1; i <= n; i += 1) {
//     sum += i;
//     sumOfSquares += i ** 2;
//   }

//   return sum ** 2 - sumOfSquares;
// }
