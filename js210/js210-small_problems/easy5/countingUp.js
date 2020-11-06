"use strict";

function sequence(limit) {
  const numbers = [];
  for (let count = 1; count <= limit; count += 1) {
    numbers.push(count);
  }

  return numbers;
}

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]
