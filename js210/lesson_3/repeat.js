function repeat(string, times) {
  if (typeof(times) !== 'number' || times < 0) return undefined;

  let repeatedString = '';
  for (let count = 0; count < times; count += 1) {
    repeatedString += string;
  }

  return repeatedString;
}

console.log(repeat('abc', 1));       // "abc"
console.log(repeat('abc', 2));       // "abcabc"
console.log(repeat('abc', -1));      // undefined
console.log(repeat('abc', 0));       // ""
console.log(repeat('abc', 'a'));     // undefined
console.log(repeat('abc', false));   // undefined
console.log(repeat('abc', null));    // undefined
console.log(repeat('abc', '  '));    // undefined

// ALTERNATIVE SOLUTION:

// const isCount = value => Number.isInteger(value) && value >= 0;

// function repeat(string, times) {
//   if (!isCount(times)) {
//     return undefined;
//   }

//   let repeated = '';
//   for (let counter = 0; counter < times; counter += 1) {
//     repeated += string;
//   }

//   return repeated;
// }
