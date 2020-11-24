function letterCaseCount(string) {
  let counts = {lowercase: 0, uppercase: 0, neither: 0};

  string.split('').forEach(char => {
    if (/[a-z]/.test(char)) {
      counts.lowercase += 1;
    } else if (/[A-Z]/.test(char)) {
      counts.uppercase += 1;
    } else {
      counts.neither += 1;
    }
  });

  return counts;
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }


// ALTERNATIVE SOLUTION:

// function letterCaseCount(string) {
//   const lowerArray = string.match(/[a-z]/g) || [];
//   const upperArray = string.match(/[A-Z]/g) || [];
//   const neitherArray = string.match(/[^a-z]/gi) || [];

//   return {
//     lowercase: lowerArray.length,
//     uppercase: upperArray.length,
//     neither: neitherArray.length,
//   };
// }
