function shortLongShort(string1, string2) {
  let sortedStrings = [string1, string2].sort((a, b) => a.length - b.length);
  let short = sortedStrings[0];
  let long = sortedStrings[1];

  return short + long + short;
}

console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
console.log(shortLongShort('', 'xyz'));         // "xyz"

// ALTERNATIVE SOLUTIONS:

// 1 - LS Solution:
// function shortLongShort(string1, string2) {
//   if (string1.length > string2.length) {
//     return string2 + string1 + string2;
//   } else {
//     return string1 + string2 + string1;
//   }
// }

// 2 - Interesting solution from a classmate using "destructuring assignment":
// function shortLongShort(string1, string2) {
//   string1.length > string2.length ? [string1, string2] = [string2, string1] : null;
//   return string1 + string2 + string1;
// }
