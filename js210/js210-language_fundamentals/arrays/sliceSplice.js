function slice(array, begin, end) {
  begin = begin > array.length ? array.length : begin;
  end = end > array.length ? array.length : end;

  const result = [];
  for (let index = begin; index < end; index++) {
    result.push(array[index]);
  }

  return result;
}

console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

const arr1 = [1, 2, 3];
console.log(slice(arr1, 1, 3));                    // [2, 3]
console.log(arr1);                                 // [1, 2, 3]

function splice(array, start, deleteCount, ...elements) {
  start = start > array.length ? array.length : start;
  deleteCount = deleteCount > (array.length - start) ? array.length - start : deleteCount;

  const front = slice(array, 0, start);
  const removedElements = slice(array, start, start + deleteCount);
  const back = slice(array, start + deleteCount, array.length);

  const newArray = front.concat(elements, back);

  for (let index = 0; index < newArray.length; index++) {
    array[index] = newArray[index];
  }

  return removedElements;
}

console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two'));             // [2]
console.log(arr2);                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
console.log(splice(arr3, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
console.log(splice(arr4, 1, 0));                    // []
console.log(splice(arr4, 1, 0, 'a'));               // []
console.log(arr4);                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
console.log(splice(arr5, 0, 0, 'a'));               // []
console.log(arr5);                                  // ["a", 1, 2, 3]


// ALTERNATIVE SOLUTIONS:

// 1 - LS solution:
// function slice(array, begin, end) {
//   const result = [];

//   begin = begin > array.length ? array.length : begin;
//   end = end > array.length ? array.length : end;

//   for (let i = begin; i < end; i += 1) {
//     result.push(array[i]);
//   }

//   return result;
// }

// function splice(array, start, deleteCount, ...args) {
//   start = start > array.length ? array.length : start;
//   deleteCount = deleteCount > (array.length - start) ? array.length - start : deleteCount;

//   const arrayCopy = slice(array, 0, array.length);
//   const elementCount = args.length;
//   const newLength = array.length + elementCount - deleteCount;
//   array.length = newLength;

//   for (let i = 0; i < elementCount; i += 1) {
//     array[start + i] = args[i];
//   }

//   let copyBackCount = arrayCopy.length - (start + deleteCount);
//   for (let i = 0; i < copyBackCount; i += 1) {
//     array[start + elementCount + i] = arrayCopy[start + deleteCount + i];
//   }

//   return slice(arrayCopy, start, start + deleteCount);
// }

// 2 - Original, iterative solution for splice function: builds newArray through various for loops and then copies contents of newArray into array thus modifying it in place (mutating it):
// function splice(array, start, deleteCount, ...elements) {
//   start = start > array.length ? array.length : start;
//   deleteCount = deleteCount > (array.length - start) ? array.length - start : deleteCount;

//   const removedElements = slice(array, start, start + deleteCount);

//   const newArray = [];
//   for (let index = 0; index < start; index++) {
//     newArray[index] = array[index];
//   }

//   newArray.push(...elements);

//   for (let index = start + deleteCount; index < array.length; index++) {
//     newArray.push(array[index]);
//   }

//   for (let index = 0; index < newArray.length; index++) {
//     array[index] = newArray[index];
//   }

//   return removedElements;
// }

// 3 - Using array literal notation and spread syntax to build newArray in splice function:
// function splice(array, start, deleteCount, ...elements) {
//   start = start > array.length ? array.length : start;
//   deleteCount = deleteCount > (array.length - start) ? array.length - start : deleteCount;

//   const front = slice(array, 0, start);
//   const removedElements = slice(array, start, start + deleteCount);
//   const back = slice(array, start + deleteCount, array.length);

//   const newArray = [...front, ...elements, ...back];

//   for (let index = 0; index < newArray.length; index++) {
//     array[index] = newArray[index];
//   }

//   return removedElements;
// }
