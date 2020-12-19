"use strict";

function bubbleSort(array) {
  let sorted;

  do {
    sorted = true;

    for (let index = 0; index < array.length - 1; index += 1) {
      if (array[index] > array[index + 1]) {
        [array[index], array[index + 1]] = [array[index + 1], array[index]];
        sorted = false;
      }
    }
  } while (!sorted);

  return array;
}

const array1 = [5, 3];
bubbleSort(array1);
console.log(array1);    // [3, 5]

const array2 = [6, 2, 7, 1, 4];
bubbleSort(array2);
console.log(array2);    // [1, 2, 4, 6, 7]

const array3 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array3);
console.log(array3);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]


// ALTERNATIVE SOLUTION:

// function bubbleSort(array) {
//   while (true) {
//     let swapped = false;
//     for (let i = 1; i < array.length; i += 1) {
//       if (array[i - 1] <= array[i]) {
//         continue;
//       }

//       swap(array, i - 1, i);
//       swapped = true;
//     }

//     if (!swapped) {
//       break;
//     }
//   }
// }

// function swap(array, idx1, idx2) {
//   const temp = array[idx1];
//   array[idx1] = array[idx2];
//   array[idx2] = temp;
// }
