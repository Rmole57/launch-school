"use strict";

function star(n) {
  let topHalf = buildHalf(Math.floor(n / 2));
  let centerRow = '*'.repeat(n);
  let result = topHalf.concat(centerRow, topHalf.slice().reverse()).join('\n');
  console.log(result);
}

function buildHalf(n) {
  let rows = [];

  for (let leadingSpaces = 0; leadingSpaces < n; leadingSpaces += 1) {
    let spacesBetween = n - 1 - leadingSpaces;
    rows.push(' '.repeat(leadingSpaces) + '*' + (' '.repeat(spacesBetween) + '*').repeat(2));
  }

  return rows;
}

star(7);
// logs
// *  *  *
//  * * *
//   ***
// *******
//   ***
//  * * *
// *  *  *

star(9);
// logs
// *   *   *
//  *  *  *
//   * * *
//    ***
// *********
//    ***
//   * * *
//  *  *  *
// *   *   *

star(11);
// *    *    *
//  *   *   *
//   *  *  *
//    * * *
//     ***
// ***********
//     ***
//    * * *
//   *  *  *
//  *   *   *
// *    *    *


// ALTERNATIVE SOLUTION:

// function repeat(char, times) {
//   let repeated = '';

//   for (let i = 0; i < times; i += 1) {
//     repeated += char;
//   }

//   return repeated;
// }

// function buildStarRow(spacesBetween, spacesPadding) {
//   const asterisks = ['*', '*', '*'];
//   const starRow = asterisks.join(repeat(' ', spacesBetween));
//   return repeat(' ', spacesPadding) + starRow;
// }

// function star(n) {
//   const middleIdx = Math.floor(n / 2);

//   for (let i = 0; i < middleIdx; i += 1) {
//     let spacesBetween = ((n - 3) / 2) - i;
//     let spacesPadding = i;
//     console.log(buildStarRow(spacesBetween, spacesPadding));
//   }

//   console.log(repeat('*', n));

//   for (let i = 0; i < middleIdx; i += 1) {
//     let spacesBetween = i;
//     let spacesPadding = ((n - 3) / 2) - i;
//     console.log(buildStarRow(spacesBetween, spacesPadding));
//   }
// }


// FURTHER EXPLORATION:

// function repeat(char, times) {
//   let repeated = '';

//   for (let i = 0; i < times; i += 1) {
//     repeated += char;
//   }

//   return repeated;
// }

// function buildStarRow(spacesBetween, spacesPadding) {
//   const asterisks = ['*', '*', '*'];
//   const starRow = asterisks.join(repeat(' ', spacesBetween));
//   return repeat(' ', spacesPadding) + starRow;
// }

// function star(n) {
//   const middleIdx = Math.floor(n / 2);
//   const topHalf = [];

//   for (let i = 0; i < middleIdx; i += 1) {
//     let spacesBetween = ((n - 3) / 2) - i;
//     let spacesPadding = i;
//     topHalf.push(buildStarRow(spacesBetween, spacesPadding));
//   }

//   let centerRow = repeat('*', n);
//   let result = topHalf.concat(centerRow, topHalf.slice().reverse());

//   console.log(result.join('\n'));
// }
