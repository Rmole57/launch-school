function splice(array, start, amount) {
  let end = start + amount;

  let removedValues = slice(array, start, end);
  array[start] = array[end];
  array.length = array.length - amount;

  return removedValues;
}

function slice(array, start, end) {
  let newArray = [];
  for (let index = start; index < end; index += 1) {
    push(newArray, array[index]);
  }

  return newArray;
}

function push(array, value) {
  array[array.length] = value;
  return array.length;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]


// ALTERNATIVE SOLUTION:

// function splice(array, begin, number) {
//   let removedValues = [];
//   for (let index = begin; index < array.length; index += 1) {
//     if (index < begin + number) {
//       push(removedValues, array[index]);
//     }

//     array[index] = array[index + number];
//   }

//   array.length = array.length - removedValues.length;
//   return removedValues;
// }
