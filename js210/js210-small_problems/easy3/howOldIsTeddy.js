"use strict";

function randomBetween(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

const age = randomBetween(20, 200);
console.log(`Teddy is ${age} years old!`);


// FURTHER EXPLORATION:

// function randomBetween(min, max) {
//   if (min > max) [min, max] = [max, min];
//   return Math.floor(Math.random() * (max - min + 1) + min);
// }
