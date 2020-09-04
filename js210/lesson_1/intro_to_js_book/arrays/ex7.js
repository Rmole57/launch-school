function sumOfSquares(numbersArray) {
  return numbersArray.reduce((sum, number) => sum + number**2, 0);
}

let numbers = [3, 5, 7];
console.log(sumOfSquares(numbers));

// ALTERNATIVE SOLUTION:

// function sumOfSquares(numbers) {
//   return numbers.reduce((accumulator, number) => {
//     return accumulator + number * number;
//   }, 0);
// }
