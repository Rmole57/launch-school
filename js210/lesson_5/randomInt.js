function randomInt(min, max) {
  if (min > max) {
    [min, max] = [max, min];
  }

  return Math.floor(Math.random() * (max - min + 1) + min);
}

console.log(randomInt(1, 5));
console.log(randomInt(30, 55));
console.log(randomInt(7, 2));
console.log(randomInt(20, 20));


// ALTERNATIVE SOLUTIONS:

// LS Solution #1:
// const randomInt = function(min, max) {
//   if (min === max) {
//     return min;
//   } else if (min > max) {
//     let swap = min;
//     min = max;
//     max = swap;
//   }

//   let difference = max - min + 1;
//   return Math.floor(Math.random() * difference) + min;
// };

// LS Solution #2 (with destructuring assignment):
// const randomInt = function(min, max) {
//   if (min === max) {
//     return min;
//   } else if (min > max) {
//     [min, max] = [max, min];
//   }

//   let difference = max - min + 1;
//   return Math.floor(Math.random() * difference) + min;
// };
