function reverse(inputForReversal) {
  const inputIsArray = Array.isArray(inputForReversal);
  const lastIndex = inputForReversal.length - 1;

  let result = inputIsArray ? [] : '';
  for (let index = lastIndex; index >= 0; index -= 1) {
    if (inputIsArray) {
      result.push(inputForReversal[index]);
    } else {
      result += inputForReversal[index];
    }
  }

  return result;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]


// ALTERNATIVE SOLUTIONS:

// 1 - LS Solution:
// function reverse(inputForReversal) {
//   if (Array.isArray(inputForReversal)) {
//     return reverseArray(inputForReversal);
//   } else {
//     return reverseString(inputForReversal);
//   }
// }

// function reverseArray(inputForReversal) {
//   const reversed = [];
//   const length = inputForReversal.length;

//   for (let i = 0; i < length; i += 1) {
//     reversed[length - 1 - 1] = inputForReversal[i];
//   }

//   return reversed;
// }

// function reverseString(inputForReversal) {
//   const stringArray = inputForReversal.split('');
//   return reverseArray(stringArray).join('');
// }

// 2 - Interesting implementation from a classmate:
// function reverse(someValue) {
//   let array = Array.from(someValue);

//   let reversedArray = [];
//   for (let i = array.length - 1; i >= 0; i--) {
//     reversedArray.push(array[i]);
//   }

//   return (Array.isArray(someValue)) ? reversedArray : reversedArray.join('');
// }
