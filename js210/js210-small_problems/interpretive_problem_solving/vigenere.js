"use strict";

function vigenereEncrypt(plaintext, keyword) {
  let ciphertext = '';
  let keyPosition = 0;

  plaintext.split('').forEach(char => {
    if (/[a-z]/i.test(char)) {
      ciphertext += encrypt(char, keyword[keyPosition]);
      keyPosition = (keyPosition + 1) % keyword.length;
    } else {
      ciphertext += char;
    }
  });

  return ciphertext;
}

function encrypt(letter, keyLetter) {
  const LOWER_ALPHA = 'abcdefghijklmnopqrstuvwxyz';

  let keyShift = LOWER_ALPHA.indexOf(keyLetter.toLowerCase());

  let oldPosition = LOWER_ALPHA.indexOf(letter.toLowerCase());
  let newPosition = (oldPosition + keyShift) % 26;
  let shiftedLetter = LOWER_ALPHA[newPosition];

  return /[a-z]/.test(letter) ? shiftedLetter : shiftedLetter.toUpperCase();
}

console.log(vigenereEncrypt("hello", 'abc'));                            // "hfnlp"
console.log(vigenereEncrypt("HeLlo", 'abc'));                            // "HfNlp"
console.log(vigenereEncrypt("hello", 'aBC'));                            // "hfnlp"
console.log(vigenereEncrypt("Pineapples don't go on pizzas!", 'meat'));  // "Bmnxmtpeqw dhz'x gh ar pbldal!"
console.log(vigenereEncrypt("Pineapples don't go on pizzas!", 'A'));     // "Pineapples don't go on pizzas!"
console.log(vigenereEncrypt("Pineapples don't go on pizzas!", "Aa"));    // "Pineapples don't go on pizzas!"
console.log(vigenereEncrypt("Pineapples don't go on pizzas!", "cab"));   // "Riogaqrlfu dpp't hq oo riabat!"
console.log(vigenereEncrypt("Dog", "Rabbit"));                           // "Uoh"


// ALTERNATIVE SOLUTION:

// function vigenereEncrypt(plaintext, keyword) {
//   const upperAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//   const lowerAlphabet = 'abcdefghijklmnopqrstuvwxyz';
//   let ciphertext = '';
//   let keyPos = 0;
//   keyword = keyword.toUpperCase();
//   let key;

//   plaintext.split('').forEach(char => {
//     if (char >= 'A' && char <= 'Z') {
//       key = upperAlphabet.indexOf(keyword[keyPos]);
//       ciphertext += encrypt(char, key, upperAlphabet);
//       keyPos = (keyPos + 1) % keyword.length;
//     } else if (char >= 'a' && char <= 'z') {
//       key = upperAlphabet.indexOf(keyword[keyPos]);
//       ciphertext += encrypt(char, key, lowerAlphabet);
//       keyPos = (keyPos + 1) % keyword.length;
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
