function uniqueElements(arr) {
  let uniques = [];
  for (let index = 0; index < arr.length; index += 1) {
    if (!uniques.includes(arr[index])) uniques.push(arr[index]);
  }

  return uniques;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]


// ALTERNATIVE SOLUTION:

// function uniqueElements(arr) {
//   let uniques = [];
//   let len = arr.length;

//   for (let index = 0; index < len; index += 1) {
//     if (uniques.indexOf(arr[index]) === -1) {
//       uniques.push(arr[index]);
//     }
//   }

//   return uniques;
// }
