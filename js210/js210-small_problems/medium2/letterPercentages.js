"use strict";

function letterPercentages(string) {
  const totalCount = string.length;

  let lowerCount = (string.match(/[a-z]/g) || []).length;
  let upperCount = (string.match(/[A-Z]/g) || []).length;
  let neitherCount = (string.match(/[^a-z]/gi) || []).length;

  return {
    lowercase: toPercentString(lowerCount, totalCount),
    uppercase: toPercentString(upperCount, totalCount),
    neither: toPercentString(neitherCount, totalCount),
  };
}

function toPercentString(count, total) {
  return ((count * 100) / total).toFixed(2);
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }

console.log(letterPercentages('AbC 357+ 2D'));
// { lowercase: "9.09", uppercase: "27.27", neither: "63.64" }


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution:
// function letterPercentages(string) {
//   const count = string.length;
//   return {
//     lowercase: (((string.match(/[a-z]/g) || []).length / count) * 100).toFixed(2),
//     uppercase: (((string.match(/[A-Z]/g) || []).length / count) * 100).toFixed(2),
//     neither: (((string.match(/[^a-z]/gi) || []).length / count) * 100).toFixed(2),
//   };
// }

// 2) - Original, iterative implementation:
// function letterPercentages(string) {
//   let lowerCount = 0;
//   let upperCount = 0;
//   let neitherCount = 0;

//   string.split('').forEach(char => {
//     if (/[A-Z]/.test(char)) {
//       upperCount += 1;
//     } else if (/[a-z]/.test(char)) {
//       lowerCount += 1;
//     } else {
//       neitherCount += 1;
//     }
//   });

//   return {
//     lowercase: toPercentString(lowerCount, string.length),
//     uppercase: toPercentString(upperCount, string.length),
//     neither: toPercentString(neitherCount, string.length),
//   };
// }
