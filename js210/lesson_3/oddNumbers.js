function logOddNumbers(number) {
  for (let currentNumber = 1; currentNumber <= number; currentNumber++) {
    if (currentNumber % 2 === 1) {
      console.log(currentNumber);
    }
  }
}

logOddNumbers(19);

// FURTHER EXPLORATION:

// 1)
// function logOddNumbers(number) {
//   for (let currentNumber = 1; currentNumber <= number; currentNumber += 2) {
//     console.log(currentNumber);
//   }
// }

// 2)
// function logOddNumbers(number) {
//   for (let currentNumber = 1; currentNumber <= number; currentNumber += 1) {
//     if (currentNumber % 2 === 0) {
//       continue;
//     }

//     console.log(currentNumber);
//   }
// }
