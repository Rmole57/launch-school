function firstNOf(arr, count) {
  let newArray = [];
  for (let index = 0; index < count; index += 1) {
    newArray.push(arr[index]);
  }

  return newArray;
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(firstNOf(digits, 3));    // returns [4, 8, 15]


// ALTERNATIVE SOLUTION:

// function firstNOf(arr, count) {
//   return arr.slice(0, count);
// }
