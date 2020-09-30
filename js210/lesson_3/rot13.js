function encodeChar(char) {
  const LOWER_ALPHABET = 'abcdefghijklmnopqrstuvwxyz';
  const SHIFT = 13;

  let wrapAdjust = position => position % 26;

  let originalPosition = LOWER_ALPHABET.indexOf(char.toLowerCase());
  let shiftedPosition = wrapAdjust(originalPosition + SHIFT);

  if (char.match(/[A-Z]/)) {
    return LOWER_ALPHABET[shiftedPosition].toUpperCase();
  }
  
  return LOWER_ALPHABET[shiftedPosition];
}

function rot13(string) {
  let encodedString = '';

  for (let index = 0; index < string.length; index += 1) {
    if (string[index].match(/[a-z]/i)) {
      encodedString += encodeChar(string[index]);
    } else {
      encodedString += string[index];
    }
  }

  return encodedString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// logs: Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
// logs: Teachers open the door, but you must enter by yourself.

// ALTERNATIVE SOLUTION:

// LS Reference Solution:
// function rot13(text) {
//   let transformed = '';
//   for (let index = 0; index < text.length; index += 1) {
//     transformed += rot13Character(text[index]);
//   }

//   return transformed;
// }

// function rot13Character(char) {
//   const ALPHABET = 'abcdefghijklmnopqrstuvwxyz';
//   let isUpperCase = false;
//   let initialIndex = alphabet.indexOf(char);

//   // no match might mean that we are dealing with an uppercase letter
//   if (initialIndex === -1) {
//     initialIndex = ALPHABET.indexOf(char.toLowerCase());
//     isUpperCase = true;
//   }

//   // if there is still no match, it's not a character between a-z
//   if (initialIndex === -1) {
//     return char;
//   }

//   let shiftedIndex = (initialIndex + 13) % 26;
//   let transformed = ALPHABET[shiftedIndex];

//   if (isUpperCase) {
//     transformed = transformed.toUpperCase();
//   }

//   return transformed;
// }
