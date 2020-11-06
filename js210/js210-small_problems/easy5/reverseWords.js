"use strict";

function reverseWords(string) {
  return string.split(' ').map(word => {
    return word.length >= 5 ? [...word].reverse().join('') : word;
  }).join(' ');
}

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"


// ALTERNATIVE SOLUTION:

// 1 - LS Solution:
// function reverseWords(string) {
//   const words = string.split(' ');
//   const reversedWords = [];

//   for (let i = 0; i < words.length; i += 1) {
//     let currentWord = words[i];
//     if (currentWord.length >= 5) {
//       reversedWords.push(currentWord.split('').reverse().join(''));
//     } else {
//       reversedWords.push(currentWord);
//     }
//   }

//   return reversedWords.join(' ');
// }

// 2 - (original solution using split() instead of Spread syntax):
// function reverseWords(string) {
//   return string.split(' ').map(word => {
//     return word.length >= 5 ? word.split('').reverse().join('') : word;
//   }).join(' ');
// }
