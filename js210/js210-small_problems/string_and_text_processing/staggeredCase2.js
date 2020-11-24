function staggeredCase(string) {
  let needUpper = true;

  return string.split('').map((char) =>  {
    if (/[a-z]/i.test(char)) {
      if (needUpper) {
        needUpper = false;
        return char.toUpperCase();
      } else {
        needUpper = true;
        return char.toLowerCase();
      }
    } else {
      return char;
    }
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution:
// function staggeredCase(string) {
//   let needUpper = true;
//   let newChar;

//   return string.split('').map(char => {
//     if (char.match(/[a-z]/i)) {
//       if (needUpper) {
//         newChar = char.toUpperCase();
//       } else {
//         newChar = char.toLowerCase();
//       }

//       needUpper = !needUpper;
//       return newChar;
//     } else {
//       return char;
//     }
//   }).join('');
// }

// 2) - Interesting solution from a classmate exploring the functionality of the String.prototype.replace method:
// function staggeredCase(string) {
//   return string.replace(/([a-z])([^a-z]*)([a-z])/gi, (_match, p1, p2, p3) => {
//     return p1.toUpperCase() + p2 + p3.toLowerCase();
//   });
// }
