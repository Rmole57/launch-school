function substr(string, start, length) {
  if (start < 0) {
    start = string.length + start;
  }

  let newString = '';
  for (let index = start; index < start + length; index += 1) {
    if (!string[index]) break;
    newString += string[index];
  }

  return newString;
}

let string = 'hello world';

console.log(substr(string, 2, 4));      // "llo "
console.log(substr(string, -3, 2));     // "rl"
console.log(substr(string, 8, 20));     // "rld"
console.log(substr(string, 0, -20));    // ""
console.log(substr(string, 0, 0));      // ""

// ALTERNATIVE SOLUTION:

// function substr(string, start, length) {
//   if (start < 0) {
//     start = string.length + start;
//   }

//   let newString = '';
//   for (let counter = 0; counter < length; counter += 1) {
//     let index = start + counter;

//     if (string[index] === undefined) {
//       break;
//     }

//     newString += string[index];
//   }

//   return newString;
// }
