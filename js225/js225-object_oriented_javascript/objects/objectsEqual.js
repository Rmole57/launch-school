"use strict";

function objectsEqual(obj1, obj2) {
  if (obj1 === obj2) return true;
  return keysMatch(obj1, obj2) && valuesMatch(obj1, obj2);
}

function keysMatch(obj1, obj2) {
  let keys1 = Object.keys(obj1).sort();
  let keys2 = Object.keys(obj2).sort();

  if (keys1.length !== keys2.length) return false;

  return keys1.every((key, index) => key === keys2[index]);
}

function valuesMatch(obj1, obj2) {
  for (let key in obj1) {
    if (obj1[key] !== obj2[key]) return false;
  }

  return true;
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                              // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));                    // false
console.log(objectsEqual({}, {}));                                              // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));          // false
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', b: undefined}));  // true


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution:
// function objectsEqual(a, b) {
//   if (a === b) {
//     return true;
//   }

//   return (keysMatch(a, b) && valuesMatch(a, b));
// }

// function keysMatch(a, b) {
//   const aKeys = Object.getOwnPropertyNames(a).sort();
//   const bKeys = Object.getOwnPropertyNames(b).sort();

//   if (aKeys.length !== bKeys.length) {
//     return false;
//   }

//   return aKeys.every((key, index) => key === bKeys[index]);
// }

// function valuesMatch(a, b) {
//   const aKeys = Object.getOwnPropertyNames(a).sort();

//   return aKeys.every(key => a[key] === b[key]);
// }

// 2) - Solution inspired by a classmates implementation:
// function objectsEqual(obj1, obj2) {
//   return Object.getOwnPropertyNames(obj1).every(key => obj1[key] === obj2[key]) &&
//          Object.getOwnPropertyNames(obj2).every(key => obj1[key] === obj2[key]);
// }


// FURTHER EXPLORATION:

// function objectsEqual(obj1, obj2) {
//   if (obj1 === obj2) return true;
//   return keysMatch(obj1, obj2) && valuesMatch(obj1, obj2);
// }

// function arraysEqual(arr1, arr2) {
//   return arr1.every((ele, index) => ele === arr2[index]) &&
//          arr2.every((ele, index) => ele === arr1[index]);
// }

// function keysMatch(obj1, obj2) {
//   let keys1 = Object.keys(obj1).sort();
//   let keys2 = Object.keys(obj2).sort();

//   if (keys1.length !== keys2.length) return false;

//   return keys1.every((key, index) => key === keys2[index]);
// }

// function valuesMatch(obj1, obj2) {
//   return Object.getOwnPropertyNames(obj1).sort().every(key => {
//     if (Array.isArray(obj1[key]) && Array.isArray(obj2[key])) {
//       return arraysEqual(obj1[key], obj2[key]);
//     } else if (typeof obj1[key] === 'object' && typeof obj2[key] === 'object') {
//       return objectsEqual(obj1[key], obj2[key]);
//     } else {
//       return obj1[key] === obj2[key];
//     }
//   });
// }

// Arrays as property values:
// console.log(objectsEqual({a: 'foo', b: [1, 2, 3]}, {a: 'foo', b: [1, 2, 3]}));  // true
// console.log(objectsEqual({a: 'foo', b: [1, 2, 3]}, {a: 'foo', b: [3, 2, 1]}));  // false

// Objects as property values:
// console.log(objectsEqual({a: 'foo', b: {this: 'hey', that: 'hello'}},
//                          {a: 'foo', b: {this: 'hey', that: 'hello'}}));  // true
// console.log(objectsEqual({a: 'foo', b: {this: 'hey', that: 'hello'}},
//                          {a: 'foo', b: {this: 'hey', that: 'hi'}}));     // false
