function stringToSignedInteger(string) {
  if (/^[+-]\d/.test(string)) {
    let sign = string[0];
    let digitString = string.slice(1);

    if (sign === '-') return -(stringToInteger(digitString));

    return stringToInteger(digitString);
  }

  return stringToInteger(string);
}

function stringToInteger(string) {
  const DIGITS = '0123456789';

  let reversedDigits = string.split('').reverse();

  let result = 0;
  for (let index = 0; index < reversedDigits.length; index += 1) {
    result += DIGITS.indexOf(reversedDigits[index]) * Math.pow(10, index);
  }

  return result;
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100


// ALTERNATIVE SOLUTION:

// function stringToSignedInteger(string) {
//   switch (string[0]) {
//     case '-': return -stringToInteger(string.slice(1));
//     case '+': return stringToInteger(string.slice(1));
//     default:  return stringToInteger(string);
//   }
// }
