"use strict";

function triangle(side1, side2, side3) {
  if (!isValidTriangle(side1, side2, side3)) return 'invalid';
  if (side1 === side2 && side2 === side3) return 'equilateral';
  if (side1 !== side2 && side2 !== side3) return 'scalene';
  return 'isosceles';
}

function isValidTriangle(side1, side2, side3) {
  let sortedSides = [side1, side2, side3].sort((a, b) => a - b);
  if (sortedSides.some(length => length <= 0)) return false;
  return sortedSides[0] + sortedSides[1] > sortedSides[2];
}

console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"


// ALTERNATIVE SOLUTION:

// function triangle(side1, side2, side3) {
//   const perimeter = side1 + side2 + side3;
//   const longest = Math.max(side1, side2, side3);
//   const shortest = Math.min(side1, side2, side3);
//   const middle = perimeter - longest - shortest;

//   if (isValid(shortest, middle, longest)) {
//     return getTriangleType(side1, side2, side3);
//   } else {
//     return 'invalid';
//   }
// }

// function isValid(shortest, middle, longest) {
//   return shortest > 0 && (shortest + middle > longest);
// }

// function getTriangleType(side1, side2, side3) {
//   if (side1 === side2 && side2 === side3) {
//     return 'equilateral';
//   } else if (side1 === side2 || side1 === side3 || side2 === side3) {
//     return 'isosceles';
//   } else {
//     return 'scalene';
//   }
// }
