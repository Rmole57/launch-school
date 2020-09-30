function logMultiples(number) {
  for (let currentNumber = 99; currentNumber >= 1; currentNumber -= 2) {
    if (currentNumber % number === 0) {
      console.log(currentNumber);
    }
  }
}

logMultiples(17);
logMultiples(21);

// ALTERNATIVE SOLUTION:

// function logMultiples(number) {
//   for (let candidate = 100; candidate >= number; candidate -= 1) {
//     if (candidate % 2 === 1 && candidate % number === 0) {
//       console.log(candidate);
//     }
//   }
// }

// FURTHER EXPLORATION:

// My solution:
// function logMultiples(number) {
//   let maxMultiple = Math.floor(100 / number) * number;

//   for (let multiple = maxMultiple; multiple >= number; multiple -= number) {
//     if (multiple % 2 === 1) {
//       console.log(multiple);
//     }
//   }
// }

// LS Solution #1:
// function logMultiples(number) {
//   let multiple = Math.floor(100 / number) * number;

//   while (multiple > 0) {
//     if (multiple % 2 === 1) {
//       console.log(multiple);
//     }

//     multiple -= number;
//   }
// }

// LS Solution #2:
// function logMultiples(number) {
//   for (let multiple = Math.floor(100 / number) * number; multiple > 0; multiple -= number) {
//     if (multiple % 2 === 1) {
//       console.log(multiple);
//     }
//   }
// }
