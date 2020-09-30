function findFibonacciIndexByLength(digitLength) {
  let index = 2;
  let currentFibonacci = 1;
  let lastFibonacci = 1;

  while (String(currentFibonacci).length !== digitLength) {
    let temp = currentFibonacci;
    currentFibonacci += lastFibonacci;
    lastFibonacci = temp;
    index += 1;
  }

  return index;
}

console.log(findFibonacciIndexByLength(2));       // 7
console.log(findFibonacciIndexByLength(10));      // 45
console.log(findFibonacciIndexByLength(16));      // 74

// ALTERNATIVE SOLUTION:

// function findFibonacciIndexByLength(length) {
//   let first = 1;
//   let second = 1;
//   let index = 2;
//   let fibonacci;

//   do {
//     fibonacci = first + second;
//     index += 1;
//     first = second;
//     second = fibonacci;
//   } while (String(fibonacci).length < length);

//   return index;
// }
