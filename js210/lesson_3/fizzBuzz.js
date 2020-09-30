function fizzBuzz() {
  for (let number = 1; number <= 100; number++) {
    let message = number;

    if (number % 3 === 0 && number % 5 === 0) {
      message = 'FizzBuzz';
    } else if (number % 3 === 0) {
      message = 'Fizz';
    } else if (number % 5 === 0) {
      message = 'Buzz';
    }
    
    console.log(message);
  }
}

fizzBuzz();

// ALTERNATIVE SOLUTION:

// let fizzbuzz = () => {
//   for (let index = 1; index <= 100; index += 1) {
//     let message = index;

//     if (index % 3 === 0 && index % 5 === 0) {
//       message = 'FizzBuzz';
//     } else if (index % 3 === 0) {
//       message = 'Fizz';
//     } else if (index % 5 === 0) {
//       message = 'Buzz';
//     }

//     console.log(message);
//   }
// };

// FURTHER EXPLORATION:

// let fizzbuzz = () => {
//   for (let index = 1; index <= 100; index += 1) {
//     let message = '';

//     if (index % 3 === 0) {
//       message += 'Fizz';
//     }

//     if (index % 5 === 0) {
//       message += 'Buzz';
//     }

//     console.log(message || index);
//   }
// };
