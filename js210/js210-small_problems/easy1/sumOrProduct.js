function computeSum(number) {
  let total = 0;

  for (let currentNumber = 1; currentNumber <= number; currentNumber += 1) {
    total += currentNumber;
  }

  return total;
}

function computeProduct(number) {
  let total = 1;

  for (let currentNumber = 1; currentNumber <= number; currentNumber += 1) {
    total *= currentNumber;
  }

  return total;
}

const rlSync = require('readline-sync');

let number = parseInt(rlSync.question('Please enter an integer greater than 0: ', {
  limit: [/^[\d]+$/],
  limitMessage: 'Oops! Invalid number!'
}), 10);

let operation = rlSync.question('Enter "s" to compute the sum, or "p" to compute the product: ', {
  limit: ['p', 's'],
  limitMessage: 'Oops! Unknown operation! Please enter "s" or "p"!'
}).toLowerCase();

if (operation === 's') {
  let sum = computeSum(number);
  console.log(`The sum of the integers between 1 and ${String(number)} is ${sum}.`);
} else {
  let product = computeProduct(number);
  console.log(`The product of the integers between 1 and ${String(number)} is ${product}.`);
}

// FURTHER EXPLORATION:

// function computeSum(numbers) {
//   return numbers.reduce((acc, num) => acc + num);
// }

// function computeProduct(numbers) {
//   return numbers.reduce((acc, num) => acc * num);
// }

// console.log(computeSum([1, 2, 3, 4, 5]));        // 15
// console.log(computeProduct([1, 2, 3, 4, 5, 6])); // 720
