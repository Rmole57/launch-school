function cleanUp(text) {
  return text.replace(/[^a-z]+/gi, ' ');
}

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "

// ALTERNATIVE SOLUTIONS:

// 1 - LS solution:
// function cleanUp(text) {
//   let cleanText = '';

//   for (let i = 0; i < text.length; i += 1) {
//     if (isLowerCaseLetter(text[i]) || isUpperCaseLetter(text[i])) {
//       cleanText += text[i];
//     } else if (cleanText[cleanText.length - 1] !== ' ') {
//       cleanText += ' ';
//     }
//   }

//   return cleanText;
// }

// const isLowerCaseLetter = (char) => char >= 'a' && char <= 'z';

// const isUpperCaseLetter = (char) => char >= 'A' && char <= 'Z';


// 2 - A less efficient solution using regex (implemented for exploration purposes):
// function cleanUp(text) {
//   let cleanString = '';

//   for (let index = 0; index < text.length; index++) {
//     if (text[index].match(/[^a-z]/) && cleanString[cleanString.length - 1] !== ' ') {
//       cleanString += ' ';
//     } else if (text[index].match(/[a-z]/i)) {
//       cleanString += text[index];
//     }
//   }

//   return cleanString;
// }
