function lastNOf(arr, count) {
  let start = count > arr.length ? 0 : arr.length - count;
  return arr.slice(start);
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3));    // returns [16, 23, 42]


// ALTERNATIVE SOLUTION:

// function lastNOf(arr, length) {
//   let index = arr.length - length;

//   if (index < 0) {
//     index = 0;
//   }

//   return arr.slice(index);
// }
