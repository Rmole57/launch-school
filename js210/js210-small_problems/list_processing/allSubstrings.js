function substrings(string) {
  let substrings = [];
  for (let index = 0; index < string.length; index += 1) {
    substrings = substrings.concat(leadingSubstrings(string.slice(index)));
  }

  return substrings;
}

function leadingSubstrings(string) {
  let substrings = [];
  for (let length = 1; length <= string.length; length += 1) {
    substrings.push(string.slice(0, length));
  }

  return substrings;
}

console.log(substrings('abcde'));

// returns (as shown by console output):
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]


// ALTERNATIVE SOLUTION:

// function substrings(string) {
//   let substrings = [];
//   for (let startIndex = 0; startIndex < string.length; startIndex += 1) {
//     let substring = string.substring(startIndex);
//     substrings = substrings.concat(leadingSubstrings(substring));
//   }

//   return substrings;
// }

// function leadingSubstrings(string) {
//   let substrings = [];
//   for (let length = 1; length <= string.length; length += 1) {
//     substrings.push(string.slice(0, length));
//   }

//   return substrings;
// }


// FURTHER EXPLORATION:

// 1)
// function substrings(string) {
//   let letters = string.split('');

//   return letters.map((_letter, idx) => {
//     return leadingSubstrings(letters.slice(idx).join(''));
//   }).reduce((acc, curArr) => acc.concat(curArr));
// }

// 2)
// function substrings(string) {
//   return string.split('').map((_letter, idx) => {
//     return leadingSubstrings(string.slice(idx));
//   }).flat();
// }
