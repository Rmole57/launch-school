function wordCount(string) {
  const words = string.split(' ');
  const result = {};

  for (let index = 0; index < words.length; index++) {
    let word = words[index];

    if (!result[word]) {
      let regexp = RegExp(`${word}`, 'g');
      let count = string.match(regexp).length;
      result[word] = count;
    }
  }

  return result;
}

console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }


// ALTERNATIVE SOLUTION:

// function wordCount(text) {
//   let count = {};
//   let words = text.split(' ');

//   for (let index = 0; index < words.length; index += 1) {
//     let word = words[index];
//     if (!count[word]) {
//       count[word] = 0;
//     }

//     count[word] += 1;
//   }

//   return count;
// }
