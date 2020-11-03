function wordSizes(string) {
  const wordsArray = string.split(' ');
  const sizesObj = {};

  for (let index = 0; index < wordsArray.length; index += 1) {
    let cleanWordSize = removeNonLetters(wordsArray[index]).length;

    if (cleanWordSize === 0) continue;

    if (sizesObj[cleanWordSize]) {
      sizesObj[cleanWordSize] += 1;
    } else {
      sizesObj[cleanWordSize] = 1;
    }
  }

  return sizesObj;
}

function removeNonLetters(word) {
  return word.replace(/[^a-zA-Z]/, '');
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}


// ALTERNATIVE SOLUTION:

// function wordSizes(words) {
//   const wordsArray = words.split(' ');
//   const count = {};

//   for (let i = 0; i < wordsArray.length; i += 1) {
//     let cleanWordSize = removeNonLetters(wordsArray[i].toLowerCase()).length;
//     if (cleanWordSize === 0) {
//       continue;
//     }

//     count[cleanWordSize] = count[cleanWordSize] || 0;
//     count[cleanWordSize] += 1;
//   }

//   return count;
// }

// function removeNonLetters(string)  {
//   let result = '';

//   for (let i = 0; i < string.length; i += 1) {
//     if (isLetter(string[i])) {
//       result += string[i];
//     }
//   }

//   return result;
// }

// function isLetter(char) { return char >= 'a' && char <= 'z' }
