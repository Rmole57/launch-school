function sum(number) {
  return String(number)
    .split('')
    .map(Number)
    .reduce((acc, digit) => acc + digit);
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45


// ALTERNATIVE SOLUTION:

// function sum(number) {
//   return String(number)
//     .split("")
//     .reduce((accum, digit) => accum + Number(digit), 0);
// }
