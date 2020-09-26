for (let currentNumber = 1; currentNumber <= 99; currentNumber++) {
  if (currentNumber % 2 === 1) console.log(currentNumber);
}

// ALTERNATIVE SOLUTION:

// for (let i = 1; i < 100; i += 2) {
//   console.log(i);
// }

// FURTHER EXPLORATION:

// const rlSync = require('readline-sync');

// let number = 1;
// let limit = parseInt(rlSync.question('Please enter a number limit: '), 10);

// while (number <= limit) {
//   console.log(number);
//   number += 2;
// }
