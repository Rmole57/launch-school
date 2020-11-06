"use strict";

function centerOf(string) {
  const center = Math.floor(string.length / 2);

  if (string.length % 2 === 0) {
    return string[center - 1] + string[center];
  }

  return string[center];
}

console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"


// ALTERNATIVE SOLUTION:

// function centerOf(string) {
//   if (string.length % 2 === 1) {
//     let centerIndex = (string.length - 1) / 2;
//     return string[centerIndex];
//   } else {
//     let leftIndex = string.length / 2 - 1;
//     return string.substring(leftIndex, leftIndex + 2);
//   }
// }
