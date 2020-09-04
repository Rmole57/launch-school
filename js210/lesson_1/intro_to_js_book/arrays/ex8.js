function oddLengths(arr) {
  return arr.reduce((filteredNumbersArray, letters) => {
    if (letters.length % 2 === 1) {
      filteredNumbersArray.push(letters.length);
    }
    return filteredNumbersArray;
  }, []);
}

let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
console.log(oddLengths(arr));

// ALTERNATIVE SOLUTION:

// function oddLengths(arr) {
//   return arr.reduce((filteredNumbersArray, letters) => {
//     let length = letters.length;
//     if (length % 2 === 1) {
//       filteredNumbersArray.push(length);
//     }

//     return filteredNumbersArray;
//   }, []);
// }
