function allMatches(words, pattern) {
  matches = [];

  words.forEach((word) => {
    if (pattern.test(word)) {
      matches.push(word);
    }
  });

  return matches;
}

let words = [
  'laboratory',
  'experiment',
  'flab',
  'Pans Labyrinth',
  'elaborate',
  'polar bear',
];

console.log(allMatches(words, /lab/)); // ['laboratory', 'flab', 'elaborate']

// ALTERNATIVE SOLUTIONS:

// 1)
// function allMatches(words, pattern) {
//   let matches = [];
//   for (let index = 0; index < words.length; index += 1) {
//     if (pattern.test(words[index])) {
//       matches.push(words[index]);
//     }
//   }

//   return matches;
// }

// 2)
// function allMatches(words, pattern) {
//   return words.filter((word) => pattern.test(word));
// }
