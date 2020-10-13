const pop = array => {
  if (array.length === 0) return undefined;

  let lastValue = array[array.length - 1];
  array.length = array.length - 1;
  return lastValue;
};

let count = [1, 2, 3];
console.log(pop(count));             // 3
console.log(count);                  // [ 1, 2 ]


// ALTERNATIVE SOLUTION:

// const pop = array => {
//   if (array.length === 0) {
//     return undefined;
//   }

//   let newLength = array.length - 1;
//   let value = array[newLength];
//   array.length = newLength;
//   return value;
// };
