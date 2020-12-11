"use strict";

function caesarEncrypt(plaintext, key) {
  let ciphertext = '';

  plaintext.split('').forEach(char => {
    ciphertext += /[a-z]/i.test(char) ? encrypt(char, key) : char;
  });

  return ciphertext;
}

function encrypt(letter, key) {
  const LOWER_ALPHA = 'abcdefghijklmnopqrstuvwxyz';

  let oldPosition = LOWER_ALPHA.indexOf(letter.toLowerCase());
  let newPosition = (oldPosition + key) % 26;
  let shiftedLetter = LOWER_ALPHA[newPosition];

  return /[a-z]/.test(letter) ? shiftedLetter : shiftedLetter.toUpperCase();
}

// simple shift
console.log(caesarEncrypt('A', 0));       // "A"
console.log(caesarEncrypt('A', 3));       // "D"

// wrap around
console.log(caesarEncrypt('y', 5));       // "d"
console.log(caesarEncrypt('a', 47));      // "v"

// all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2));
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution #1:
// function caesarEncrypt(plaintext, key) {
//   const upperAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//   const lowerAlphabet = 'abcdefghijklmnopqrstuvwxyz';
//   let ciphertext = '';

//   plaintext.split('').forEach(char => {
//     if (char >= 'A' && char <= 'Z') {
//       ciphertext += encrypt(char, key, upperAlphabet);
//     } else if (char >= 'a' && char <= 'z') {
//       ciphertext += encrypt(char, key, lowerAlphabet);
//     } else {
//       ciphertext += char;
//     }
//   });

//   return ciphertext;
// }

// function encrypt(letter, key, alphabet) {
//   const letterPos = alphabet.indexOf(letter);

//   for (let step = 1; step <= key; step += 1) {
//     if (!alphabet[letterPos + step]) {
//       alphabet += alphabet;
//     }

//     letter = alphabet[letterPos + step];
//   }

//   return letter;
// }

// 2) - Launch School solution #2:
// function caesarEncrypt(plaintext, key) {
//   let ciphertext = '';

//   plaintext.split('').forEach(char => {
//     if (char >= 'A' && char <= 'Z') {
//       ciphertext += encrypt(char, key, 'upper');
//     } else if (char >= 'a' && char <= 'z') {
//       ciphertext += encrypt(char, key, 'lower');
//     } else {
//       ciphertext += char;
//     }
//   });

//   return ciphertext;
// }

// function encrypt(letter, key, letterCase) {
//   const base = letterCase === 'upper' ? 65 : 97;
//   const charCode = letter.charCodeAt(0) - base;
//   const shifted = (charCode + key) % 26;

//   return String.fromCharCode(shifted + base);
// }
