function pop(array) {
  if (array.length === 0) return undefined;

  const last = array[array.length - 1];
  array.length = array.length - 1;

  return last;
}

function push(array, ...args) {
  for (let index = 0; index < args.length; index += 1) {
    array[array.length] = args[index];
  }

  return array.length;
}

// pop
const array1 = [1, 2, 3];
console.log(pop(array1));                        // 3
console.log(array1);                            // [1, 2]
console.log(pop([]));                           // undefined
console.log(pop([1, 2, ['a', 'b', 'c']]));      // ["a", "b", "c"]

// push
const array2 = [1, 2, 3];
console.log(push(array2, 4, 5, 6));              // 6
console.log(array2);                            // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b']));          // 3
console.log(push([], 1));                       // 1
console.log(push([]));                          // 0


// ALTERNATIVE SOLUTIONS:

// 1 - LS Solution:
// function pop(array) {
//   const poppedElement = array[array.length - 1];
//   array.splice(array.length - 1);

//   return poppedElement;
// }

// function push(array, ...args) {
//   const length = args.length;

//   for (let i = 0; i < length; i += 1) {
//     array[array.length] = args[i];
//   }

//   return array.length;
// }

// 2 - Another "pop" implementation (a more iterative approach):
// function pop(array) {
//   const arrayCopy = [];

//   for (let i = 0; i < array.length; i += 1) {
//     arrayCopy[i] = array[i];
//   }

//   let poppedElement = array[array.length - 1];
//   array.length = 0;
//   for (let i = 0; i < arrayCopy.length - 1; i += 1) {
//     array.push(arrayCopy[i]);
//   }

//   return poppedElement;
// }
