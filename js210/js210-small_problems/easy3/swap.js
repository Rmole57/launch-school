function swap(string) {
  const words = string.split(' ');

  for (let index = 0; index < words.length; index += 1) {
    words[index] = swapFirstLastCharacters(words[index]);
  }

  return words.join(' ');
}

function swapFirstLastCharacters(word) {
  let letters = word.split('');
  let lastIndex = letters.length - 1;

  [letters[0], letters[lastIndex]] = [letters[lastIndex], letters[0]];

  return letters.join('');
}

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"


// ALTERNATIVE SOLUTION:

// function swap(words) {
//   const wordsArray = words.split(' ');

//   for (let i = 0; i < wordsArray.length; i += 1) {
//     wordsArray[i] = swapFirstLastCharacters(wordsArray[i]);
//   }

//   return wordsArray.join(' ');
// }

// function swapFirstLastCharacters(word) {
//   if (word.length === 1) {
//     return word;
//   }

//   return word[word.length - 1] + word.slice(1, -1) + word[0];
// }


// FURTHER EXPLORATION:

// function swap(string) {
//   const words = string.split(' ');
//   return words.map(word => swapFirstLastCharacters(word)).join(' ');
// }
