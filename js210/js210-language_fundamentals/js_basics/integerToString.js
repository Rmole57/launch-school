function integerToString(number) {
  const DIGITS = '0123456789';

  let result = [];
  do {
    result.unshift(DIGITS[number % 10]);
    number = Math.floor(number / 10);
  } while (number > 0);

  return result.join('');
}

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"


// ALTERNATIVE SOLUTIONS:

// 1 - LS Solution:
// const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

// function integerToString(number) {
//   let result = '';

//   do {
//     let remainder = number % 10;
//     number = Math.floor(number / 10);

//     result = DIGITS[remainder] + result;
//   } while (number > 0);

//   return result;
// }

// 2 - Original Solution (before refactoring):
// function integerToString(number) {
//   const DIGITS = '0123456789';

//   let result = [];
//   while (number % 10 !== number) {
//     result.unshift(DIGITS[number % 10]);
//     number = Math.floor(number / 10);
//   }

//   result.unshift(DIGITS[number % 10]);

//   return result.join('');
// }
