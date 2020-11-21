function isUrl(text) {
  let urlRegex = /^https?:\/\/\S+$/
  return urlRegex.test(text);
}

console.log(isUrl('http://launchschool.com'));   // -> true
console.log(isUrl('https://example.com'));       // -> true
console.log(isUrl('https://example.com hello')); // -> false
console.log(isUrl('   https://example.com'));    // -> false


// ALTERNATIVE SOLUTION:

// let isUrl = function (text) {
//   return !!text.match(/^https?:\/\/\S+$/);
// };
