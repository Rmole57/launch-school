function multisum(maxValue) {
  let sum = 0;

  for (let number = 1; number <= maxValue; number += 1) {
    if (number % 3 === 0 || number % 5 === 0) sum += number;
  }

  return sum;
}

console.log(multisum(3));       // 3
console.log(multisum(5));       // 8
console.log(multisum(10));      // 33
console.log(multisum(1000));    // 234168

// ALTERNATIVE SOLUTION:

// function isMultiple(number, divisor) {
//   return number % divisor === 0;
// }

// function multisum(maxValue) {
//   let sum = 0;

//   for (let i = 1; i <= maxValue; i += 1) {
//     if (isMultiple(i, 3) || isMultiple(i, 5)) {
//       sum += i;
//     }
//   }

//   return sum;
// }
