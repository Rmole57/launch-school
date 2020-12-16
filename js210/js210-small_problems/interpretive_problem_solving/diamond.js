"use strict";

function diamond(n) {
  let topHalf = buildHalf(n / 2);
  let result = topHalf.concat(topHalf.slice().reverse().slice(1)).join('\n');
  console.log(result);
}

function buildHalf(n) {
  let rows = [];

  for (let count = 0; count < n; count += 1) {
    let row = `${' '.repeat(n - count)}${'*'.repeat(1 + (2 * count))}`;
    rows.push(row);
  }

  return rows;
}

diamond(1);
// logs:
// *

diamond(3);
// logs:
//  *
// ***
//  *

diamond(9);
// logs:
//     *
//    ***
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *


// ALTERNATIVE SOLUTION:

// function diamond(n) {
//   numberSequence(n).forEach(number => {
//     console.log(repeat(' ', (n - number) / 2) + repeat('*', number));
//   });
// }

// function numberSequence(n) {
//   const result = [];
//   let increment = 2;

//   for (let number = 1; number > 0; number += increment) {
//     result.push(number);
//     if (number === n) {
//       increment = -2;
//     }
//   }

//   return result;
// }

// function repeat(char, times) {
//   let repeated = '';

//   for (let i = 0; i < times; i += 1) {
//     repeated += char;
//   }

//   return repeated;
// }


// FURTHER EXPLORATION:

// function diamond(n) {
//   let topHalf = buildHalf(n / 2);
//   let result = topHalf.concat(topHalf.slice().reverse().slice(1)).join('\n');
//   console.log(result);
// }

// function buildHalf(n) {
//   let rows = [];

//   for (let count = 0; count < n; count += 1) {
//     let row = `${' '.repeat(n - count)}*`;
//     if (count > 0) row += `${' '.repeat(1 + (2 * (count - 1)))}*`;
//     rows.push(row);
//   }

//   return rows;
// }

// diamond(1);
// logs:
// *

// diamond(3);
// logs:
//  *
// * *
//  *

// diamond(9);
// logs:
//     *
//    * *
//   *   *
//  *     *
// *       *
//  *     *
//   *   *
//    * *
//     *
