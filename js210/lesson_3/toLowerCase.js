function toLowerCase(string) {
  let lowerCaseString = '';

  for (let index = 0; index < string.length; index += 1) {
    let asciiNumeric = string.charCodeAt(index);

    if (asciiNumeric >= 65 && asciiNumeric <= 90) {
      asciiNumeric += 32;
    }

    lowerCaseString += String.fromCharCode(asciiNumeric);
  }

  return lowerCaseString;
}

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"

// ALTERNATIVE SOLUTION:

// function toLowerCase(string) {
//   const CONVERSION_OFFSET = 32;
//   let newString = '';

//   for (let index = 0; index < string.length; index += 1) {
//     let charCode = string.charCodeAt(index);

//     if (string[index] >= 'A' && string[index] <= 'Z') {
//       charCode += CONVERSION_OFFSET;
//     }

//     newString += String.fromCharCode(charCode);
//   }

//   return newString;
// }
