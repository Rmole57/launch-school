function concat(arr1, arr2) {
  let newArray = [];
  for (let index = 0; index < arr1.length; index += 1) {
    push(newArray, arr1[index]);
  }

  for (let index = 0; index < arr2.length; index += 1) {
    push(newArray, arr2[index]);
  }

  return newArray;
}

function push(array, value) {
  array[array.length] = value;
  return array.length;
}

console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]
