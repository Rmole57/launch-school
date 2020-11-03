function wordSizes(string) {
  const wordsArray = string.split(' ');
  const sizesObj = {};

  wordsArray.forEach(word => {
    let wordSize = word.length;

    if (wordSize === 0) return;

    if (sizesObj[wordSize]) {
      sizesObj[wordSize] += 1;
    } else {
      sizesObj[wordSize] = 1;
    }
  });

  return sizesObj;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
console.log(wordSizes("What's up doc?"));                              // { "2": 1, "4": 1, "6": 1 }
console.log(wordSizes(''));                                            // {}


// ALTERNATIVE SOLUTION:

// function wordSizes(words) {
//   const wordsArray = words.split(' ');
//   const count = {};

//   for (let i = 0; i < wordsArray.length; i += 1) {
//     let wordSize = wordsArray[i].length;
//     if (wordSize === 0) {
//       continue;
//     }

//     count[wordSize] = count[wordSize] || 0;
//     count[wordSize] += 1;
//   }

//   return count;
// }
