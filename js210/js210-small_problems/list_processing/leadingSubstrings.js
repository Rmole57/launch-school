function leadingSubstrings(string) {
  return string.split('').map((_letter, idx) => string.slice(0, idx + 1));
}

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]


// ALTERNATIVE SOLUTION:

// function leadingSubstrings(string) {
//   let substrings = [];
//   for (let length = 1; length <= string.length; length += 1) {
//     substrings.push(string.slice(0, length));
//   }

//   return substrings;
// }


// FURTHER EXPLORATION:

// function leadingSubstrings(string) {
//   let letters = string.split('');

//   return letters.reduce((acc, _cur, idx) => {
//     return acc.concat(letters.slice(0, idx + 1).join(''));
//   }, []);
// }
