const NUMBERS = [1, 2, 3, 4, 5];

function reverseArray(arr) {
  let reversedArray = [];
  for (let index = arr.length - 1; index >= 0; index -= 1) {
    reversedArray.push(arr[index]);
  }

  return reversedArray;
}

console.log(reverseArray(NUMBERS));
