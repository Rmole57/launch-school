function shift(array) {
  return array.splice(0, 1)[0];
}

function unshift(array, ...values) {
  array.splice(0, 0, ...values);
  return array.length;
}

console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]


// ALTERNATIVE SOLUTION:

// function shift(array) {
//   let result;

//   if (array.length !== 0) {
//     result = array.splice(0, 1).pop();
//   }

//   return result;
// }

// function unshift(array, ...args) {
//   for (let i = 0; i < args.length; i += 1) {
//     array.splice(i , 0, args[i]);
//   }

//   return array.length;
// }


// FURTHER EXPLORATION:

// Original iterative implementation:
// function shift(array) {
//   if (array.length === 0) return undefined;

//   const removedElement = array[0];
//   for (let index = 0; index < array.length - 1; index++) {
//     array[index] = array[index + 1];
//   }

//   array.length = array.length - 1;

//   return removedElement;
// }

// function unshift(array, ...values) {
//   array.length = array.length + values.length;

//   for (let index = array.length - 1; index >= array.length - values.length - 1; index--) {
//     array[index] = array[index - values.length];
//   }

//   for (let index = 0; index < values.length; index++) {
//     array[index] = values[index];
//   }

//   return array.length;
// }
