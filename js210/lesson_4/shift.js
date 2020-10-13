const shift = array => {
  if (array.length === 0) return undefined;

  let firstValue = array[0];

  for (let index = 0; index < array.length - 1; index += 1) {
    array[index] = array[index + 1];
  }

  array.length = array.length - 1;
  return firstValue;
};

let count = [1, 2, 3];
console.log(shift(count));           // 1
console.log(count);                  // [ 2, 3 ]
