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

console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]
