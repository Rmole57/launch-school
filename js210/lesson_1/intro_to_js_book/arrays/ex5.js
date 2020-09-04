function removeNonInteger(array) {
  return array.filter(value => Number.isInteger(value));
}

let array = [1, 'a', '1', 3, NaN, 3.1415, -4, null, false];
let newArray = removeNonInteger(array);
console.log(newArray);

// ALTERNATIVE SOLUTIONS:

// 1)
// function removeNonInteger(array) {
//   return array.filter(function(element) {
//     return Number.isInteger(element);
//   });
// }

// 2)
// function removeNonInteger(array) {
//   return array.filter(Number.isInteger);
// }
