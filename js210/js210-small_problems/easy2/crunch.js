function crunch(text) {
  let crunchText = '';

  for (let index = 0; index < text.length; index += 1) {
    if (text[index] !== text [index + 1]) {
      crunchText += text[index];
    }
  }

  return crunchText;
}

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""

// ALTERNATIVE SOLUTION:

// function crunch(text) {
//   let index = 0;
//   let crunchText = '';

//   while (index <= text.length - 1) {
//     if (text[index] !== text[index + 1]) {
//       crunchText += text[index];
//     }

//     index += 1;
//   }

//   return crunchText;
// }

// FURTHER EXPLORATION:

// function crunch(text) {
//   return text.replace(/(.)\1+/g, '$1');
// }
