function delayLog() {
  for (let count = 1; count <= 10; count += 1) {
    setTimeout(() => {
      console.log(count);
    }, 1000 * count);
  }
}

delayLog();


// ALTERNATIVE SOLUTION:

// function makeLogger(number) {
//   return function() {
//     console.log(number);
//   }
// }

// function delayLog() {
//   for (let index = 1; index <= 10; index += 1) {
//     let logger = makeLogger(index);
//     setTimeout(logger, index * 1000);
//   }
// }
