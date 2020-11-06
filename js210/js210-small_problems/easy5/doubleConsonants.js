"use strict";

function doubleConsonants(string) {
  let stringArray = [...string];

  return stringArray.map(char => {
    return isConsonant(char) ? char.repeat(2) : char;
  }).join('');
}

function isConsonant(char) {
  const VOWELS = [...'aeiou'];
  return /[a-z]/i.test(char) && !VOWELS.includes(char.toLowerCase());
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""


// ALTERNATIVE SOLUTION:

// const CONSONANTS = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm',
//                   'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'];

// function doubleConsonants(string) {
//   const stringArray = [];

//   for (let i = 0; i < string.length; i += 1) {
//     stringArray.push(string[i]);
//     if (CONSONANTS.includes(string[i].toLowerCase())) {
//       stringArray.push(string[i]);
//     }
//   }

//   return stringArray.join('');
// }
