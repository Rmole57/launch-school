function isPrime(number) {
  if (number <= 1) {
    return false;
  }

  for (let currentNumber = 2; currentNumber < Math.sqrt(number); currentNumber += 1) {
    if (number % currentNumber === 0) {
      return false;
    }
  }

  return true;
}

console.log(isPrime(1));   // false
console.log(isPrime(2));   // true
console.log(isPrime(3));   // true
console.log(isPrime(43));  // true
console.log(isPrime(55));  // false
console.log(isPrime(0));   // false

// FURTHER EXPLORATION:

// My solution:
// function isPrime(number) {
//   if (number <= 1 || (number > 2 && number % 2 === 0)) {
//     return false;
//   }

//   for (let currentNumber = 3; currentNumber < number; currentNumber += 2) {
//     if (number % currentNumber === 0) {
//       return false;
//     }
//   }

//   return true;
// }

// LS solution:
// function isPrime(number) {
//   if (number <= 1 || (number > 2 && number % 2 === 0)) {
//     return false;
//   }

//   let divisor = 3;

//   while (divisor < number) {
//     if (number % divisor === 0) {
//       return false;
//     }

//     divisor += 2;
//   }

//   return true;
// }
