function oddElementsOf(arr) {
  let newArray = [];
  for (let index = 0; index < arr.length; index++) {
    if (index % 2 !== 0) newArray.push(arr[index]);
  }

  return newArray;
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits));    // returns [8, 16, 42]


// ALTERNATIVE SOLUTION:

// function oddElementsOf(arr) {
//   let oddElements = [];
//   let length = arr.length;

//   for (let index = 1; index < length; index += 2) {
//     oddElements.push(arr[index]);
//   }

//   return oddElements;
// }
