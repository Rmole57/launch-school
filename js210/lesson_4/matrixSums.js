function matrixSums(arr) {
  let sumsArray = [];
  for (let index = 0; index < arr.length; index += 1) {
    let sum = arr[index].reduce((acc, cur) => acc + cur);
    sumsArray.push(sum);
  }

  return sumsArray;
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]


// ALTERNATIVE SOLUTION:

// function matrixSums(arr) {
//   let sums = [];
//   let outerLen = arr.length;

//   for (let mainIndex = 0; mainIndex < outerLen; mainIndex += 1) {
//     let currentSum = 0;
//     let innerLen = arr[mainIndex].length;
//     for (let subIndex = 0; subIndex < innerLen; subIndex += 1) {
//       currentSum += arr[mainIndex][subIndex];
//     }

//     sums.push(currentSum);
//   }

//   return sums;
// }
