function isBalanced(string) {
  let count = 0;
  for (let index = 0; index < string.length; index += 1) {
    if (count < 0) return false;

    if (string[index] === '(') count += 1;
    if (string[index] === ')') count -= 1;
  }

  return count === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false


// ALTERNATIVE SOLUTION:

// function isBalanced(string) {
//   let parensCount = 0;
//   for (let i = 0; i < string.length; i += 1) {
//     if (string[i] === '(') {
//       parensCount += 1;
//     } else if (string[i] === ')') {
//       parensCount -= 1;
//     }

//     if (parensCount < 0) {
//       return false;
//     }
//   }

//   return parensCount === 0;
// }
