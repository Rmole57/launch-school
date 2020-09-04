let obj = {
  b: 2,
  a: 1,
  c: 3,
};

let upperKeys = Object.keys(obj).map((key) => key.toUpperCase());
console.log(upperKeys);
console.log(obj);

// ALTERNATIVE SOLUTION:

// let objKeys = [];
// Object.keys(obj).forEach(function(key) {
//   objKeys.push(key.toUpperCase());
// });
