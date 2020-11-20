function palindromes(string) {
  return substrings(string).filter(substring => {
    return substring === substring.split('').reverse().join('') &&
    substring.length > 1;
  });
}

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

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns (as shown by console output):
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
//   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns (as shown by console output):
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]


// ALTERNATIVE SOLUTION:

// function isPalindrome(word) {
//   return word.length > 1 && word === word.split('').reverse().join('');
// }

// function palindromes(string) {
//   return substrings(string).filter(isPalindrome);
// }
