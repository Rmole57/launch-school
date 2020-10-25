function invoiceTotal(...amounts) {
  return amounts.reduce((acc, cur) => acc + cur);
}

console.log(invoiceTotal(20, 30, 40, 50));          // works as expected
console.log(invoiceTotal(20, 30, 40, 50, 40, 40));  // does not work; how can you make it work?


// ALTERNATIVE SOLUTION:

// function invoiceTotal(...args) {
//   let total = 0;

//   for (let i = 0; i < args.length; i += 1) {
//     total += args[i];
//   }

//   return total;
// }
