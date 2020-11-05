"use strict";

function union(arr1, ...args) {
  const combinedArrays = arr1.concat(...args);
  const result = [];

  combinedArrays.forEach(currEle => {
    if (!result.includes(currEle)) result.push(currEle);
  });

  return result;
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]


// ALTERNATIVE SOLUTION:

// function copyNonDupsTo(resultArray, array) {
//   array.forEach(value => {
//                   if (!resultArray.includes(value)) {
//                     resultArray.push(value);
//                   }
//                 });
// }

// function union(...args) {
//   const newArray = [];

//   args.forEach(value => copyNonDupsTo(newArray, value));

//   return newArray;
// }
