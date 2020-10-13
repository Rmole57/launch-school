function arrayToString(arr) {
  let str = '';
  for (let index = 0; index < arr.length; index += 1) {
    str += String(arr[index]);
  }

  return str;
}

console.log(arrayToString([1, 'a', 4]));
console.log(arrayToString([1, 2, 3]));
