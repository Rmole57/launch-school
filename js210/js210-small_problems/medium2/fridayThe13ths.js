"use strict";

function fridayThe13ths(year) {
  let thirteenths = 0;
  for (let month = 0; month < 12; month += 1) {
    if (new Date(year, month, 13).getDay() === 5) thirteenths += 1;
  }

  return thirteenths;
}

console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2


// ALTERNATIVE SOLUTION:

// function fridayThe13ths(year) {
//   const thirteenths = [];

//   for (let i = 0; i < 12; i += 1) {
//     thirteenths.push(new Date(year, i, 13));
//   }

//   return thirteenths.reduce((count, day) => day.getDay() === 5 ? (count + 1) : count, 0);
// }


// FURTHER EXPLORATION:

// function fridayThe13ths(year) {
//   const thirteenths = [];

//   for (let i = 0; i < 12; i += 1) {
//     thirteenths.push(new Date(year, i, 13));
//   }

//   return thirteenths.filter(isFriday).length;
// }

// function isFriday(date) {
//   return date.getDay() === 5;
// }
