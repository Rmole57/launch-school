const rlSync = require('readline-sync');

let firstNumber = Number(rlSync.question('==> Enter the first number:\n'));
let secondNumber = Number(rlSync.question('==> Enter the second number:\n'));

let sum = firstNumber + secondNumber;
let difference = firstNumber - secondNumber;
let product = firstNumber * secondNumber;
let quotient = Math.floor(firstNumber / secondNumber);
let remainder = firstNumber % secondNumber;
let exponent = firstNumber ** secondNumber; // Can also be Math.pow(firstNumber, secondNumber);

console.log(`${firstNumber} + ${secondNumber} = ${sum}`);
console.log(`${firstNumber} - ${secondNumber} = ${difference}`);
console.log(`${firstNumber} * ${secondNumber} = ${product}`);
console.log(`${firstNumber} / ${secondNumber} = ${quotient}`);
console.log(`${firstNumber} % ${secondNumber} = ${remainder}`);
console.log(`${firstNumber} ** ${secondNumber} = ${exponent}`);
