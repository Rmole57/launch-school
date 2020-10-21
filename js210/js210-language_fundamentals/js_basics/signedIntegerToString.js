function signedIntegerToString(number) {
  let numberString = integerToString(Math.abs(number));

  if (number > 0) return '+' + numberString;
  if (number < 0) return '-' + numberString;
  return numberString;
}

function integerToString(number) {
  const DIGITS = '0123456789';

  let result = [];
  do {
    result.unshift(DIGITS[number % 10]);
    number = Math.floor(number / 10);
  } while (number > 0);

  return result.join('');
}

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"


// ALTERNATIVE SOLUTIONS:

// 1 - LS Solution:
// function signedIntegerToString(number) {
//   if (number < 0) {
//     return ('-' + integerToString(-number));
//   } else if (number > 0) {
//     return ('+' + integerToString(number));
//   } else {
//     return integerToString(number);
//   }
// }

// 2 - Extra implementation for exploration purposes:
// function signedIntegerToString(number) {
//   let numberString = integerToString(Math.abs(number));

//   switch (Math.sign(number)) {
//     case -1: return '-' + numberString;
//     case 1:  return '+' + numberString;
//     default: return numberString;
//   }
// }
