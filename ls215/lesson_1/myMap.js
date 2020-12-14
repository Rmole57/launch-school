function myMap(array, func) {
  let newArray = [];
  array.forEach((value, index, array) => newArray.push(func(value, index, array)));
  return newArray;
}

let plusOne = n => n + 1;
console.log(myMap([1, 2, 3, 4], plusOne));                          // [2, 3, 4, 5]
console.log(myMap(['a', 'b', 'c', 'd'], (_value, index) => index)); // [0, 1, 2, 3]
