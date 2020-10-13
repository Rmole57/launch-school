function areArraysEqual(array1, array2) {
  if (array1.length !== array2.length) return false;

  const sortedArray1 = array1.slice().sort();
  const sortedArray2 = array2.slice().sort();

  for (let index = 0; index < sortedArray1.length; index++) {
    if (sortedArray1[index] !== sortedArray2[index]) return false;
  }

  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true


// ALTERNATIVE SOLUTION:

// function areArraysEqual(array1, array2) {
//   if (array1.length !== array2.length) {
//     return false;
//   }

//   let array2Copy = array2.slice();
//   for (let i = 0; i < array1.length; i += 1) {
//     let index = array2Copy.indexOf(array1[i]);
//     if (index >= 0) {
//       array2Copy.splice(index, 1);
//     } else {
//       return false;
//     }
//   }

//   return true;
// }
