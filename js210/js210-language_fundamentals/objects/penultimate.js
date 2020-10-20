function penultimate(string) {
  let words = string.split(' ');
  return words[words.length - 2];
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"


// ALTERNATIVE SOLUTION:

// function penultimate(string) {
//   return string.split(' ').slice(-2, -1)[0];
// }
