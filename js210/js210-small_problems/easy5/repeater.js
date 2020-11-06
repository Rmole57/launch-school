"use strict";

function repeater(string) {
  let doubleString = '';
  for (let index = 0; index < string.length; index += 1) {
    doubleString += string[index].repeat(2);
  }

  return doubleString;
}

console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""


// ALTERNATIVE SOLUTION:

// function repeater(string) {
//   const stringArray = [];

//   for (let i = 0; i < string.length; i += 1) {
//     stringArray.push(string[i], string[i]);
//   }

//   return stringArray.join('');
// }
