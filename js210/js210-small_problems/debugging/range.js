"use strict";

function range(start, end) {
  if (end === undefined) {
    [start, end] = [0, start];
  }

  const range = [];

  for (let element = start; element <= end; element++) {
    range.push(element);
  }

  return range;
}

// Examples

console.log(range(10, 20));
console.log(range(5));


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution:
// function range(start, end) {
//   if (arguments.length === 1) {
//     end = start;
//     start = 0;
//   }

//   const range = [];
//   for (let element = start; element <= end; element++) {
//     range.push(element);
//   }

//   return range;
// }

// 2) - Solution exploring having the function return an invocation of itself if the 'end' argument is omitted:
// function range(start, end) {
//   if (end === undefined) return range(0, start);

//   const result = [];

//   for (let element = start; element <= end; element++) {
//     result.push(element);
//   }

//   return result;
// }
