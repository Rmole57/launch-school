function multiplesOfThreeAndFive() {
  for (let number = 1; number <= 100; number++) {
    if (number % 3 === 0 && number % 5 === 0) {
      console.log(String(number) + '!');
    } else if (number % 3 === 0 || number % 5 === 0) {
      console.log(String(number));
    }
  }
}

multiplesOfThreeAndFive();

// ALTERNATIVE SOLUTION:

// const multiplesOfThreeAndFive = function() {
//   for (let number = 1; number <= 100; number += 1) {
//     if (number % 3 === 0 && number % 5 === 0) {
//       console.log(String(number) + '!');
//     } else if (number % 3 === 0 || number % 5 === 0) {
//       console.log(String(number));
//     }
//   }
// }

// FURTHER EXPLORATION:

// function multiplesOfThreeAndFive(min, max) {
//   for (let number = min; number <= max; number++) {
//     if (number % 3 === 0 && number % 5 === 0) {
//       console.log(String(number) + '!');
//     } else if (number % 3 === 0 || number % 5 === 0) {
//       console.log(String(number));
//     }
//   }
// }

// multiplesOfThreeAndFive(1, 30);
