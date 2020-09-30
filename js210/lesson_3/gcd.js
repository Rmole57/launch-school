let gcd = function (num1, num2) {
  if (num1 % num2 === 0) return Math.min(num1, num2);

  if (num1 > num2) {
    return gcd(num2, num1 % num2);
  } else {
    return gcd(num1, num2 % num1);
  }
};

console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1
console.log(gcd(18, 48));  // 6

// ALTERNATIVE SOLUTION:

// function gcd(num1, num2) {
//   var temp;

//   while (num2 !== 0) {
//     temp = num2;
//     num2 = num1 % num2;
//     num1 = temp;
//   }

//   return num1;
// }

// FURTHER EXPLORATION:

// function gcd(numbers) {
//   if (numbers.length === 2) {
//     let temp;
//     let num1 = numbers[0];
//     let num2 = numbers[1];

//     while (num2 !== 0) {
//       temp = num2;
//       num2 = num1 % num2;
//       num1 = temp;
//     }

//     return num1;
//   }

//   return gcd([gcd([numbers[0], numbers[1]]), numbers.slice(2)].flat());
// }

// console.log(gcd([12, 4, 8]));         // 4
// console.log(gcd([12, 4, 8, 24]));     // 4
// console.log(gcd([12, 4, 8, 24, 34])); // 2

// console.log(gcd([5, 10, 15]));         // 5
// console.log(gcd([5, 10, 15, 25]));     // 5
// console.log(gcd([5, 10, 15, 25, 42])); // 1
