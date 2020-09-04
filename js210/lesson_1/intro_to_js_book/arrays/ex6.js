function oddLengths(arr) {
  let filteredNumbersArray = arr.map(letters => letters.length);
  return filteredNumbersArray.filter(value => value % 2 !== 0);
}

let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
console.log(oddLengths(arr));

// ALTERNATIVE SOLUTION:

// function oddLengths(arr) {
//   let filteredNumbersArray = arr.map((letters) => {
//     return letters.length;
//   }).filter((number) => {
//     return number % 2 === 1;
//   });

//   return filteredNumbersArray;
// }
