function missing(arr) {
  let missingNums = [];
  let start = arr[0] + 1;
  let end = arr[arr.length - 1] - 1;

  for (let currNum = start; currNum <= end; currNum += 1) {
    if (!arr.includes(currNum)) missingNums.push(currNum);
  }

  return missingNums;
}

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []


// ALTERNATIVE SOLUTION:

// function missing(array) {
//   let result = [];
//   let start = array[0] + 1;
//   let end = array[array.length - 1];

//   for (let integer = start; integer < end; integer += 1) {
//     if (array.indexOf(integer) === -1) {
//       result.push(integer);
//     }
//   }

//   return result;
// }
