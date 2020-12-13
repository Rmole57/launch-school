"use strict";

function fibonacci(nth) {
  let fibNumbers = [1, 1];
  
  for (let index = 2; index < nth; index += 1) {
    fibNumbers.push(fibNumbers[index - 1] + fibNumbers[index - 2]);
  }

  return fibNumbers[fibNumbers.length - 1];
}

console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765
console.log(fibonacci(50));      // 12586269025
console.log(fibonacci(75));      // 2111485077978050


// ALTERNATIVE SOLUTION:

// function fibonacci(nth) {
//   let previousTwo = [1, 1];

//   for (let counter = 3; counter <= nth; counter += 1) {
//     previousTwo = [previousTwo[1], previousTwo[0] + previousTwo[1]];
//   }

//   return previousTwo[1];
// }
