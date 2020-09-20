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
