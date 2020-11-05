"use strict";

const DEGREES_SYMBOL = '\xB0';
const MINUTES_PER_DEGREES = 60;
const SECONDS_PER_MINUTES = 60;

function dms(degreesFloat) {
  const degreesInt = Math.floor(degreesFloat);

  const minutesFloat = (degreesFloat - degreesInt) * MINUTES_PER_DEGREES;
  const minutesInt = Math.floor(minutesFloat);

  const secondsInt = Math.floor((minutesFloat - minutesInt) * SECONDS_PER_MINUTES);

  return `${degreesInt}${DEGREES_SYMBOL}${padZeroes(minutesInt)}'${padZeroes(secondsInt)}"`;
}

function padZeroes(number) {
  let numString = String(number);
  return numString.padStart(2, '0');
}

console.log(dms(30));           // 30°00'00"
console.log(dms(76.73));        // 76°43'48"
console.log(dms(254.6));        // 254°35'59"
console.log(dms(93.034773));    // 93°02'05"
console.log(dms(0));            // 0°00'00"
console.log(dms(360));          // 360°00'00" or 0°00'00"


// ALTERNATIVE SOLUTION:

// const DEGREE = '\xB0';
// const MINUTES_PER_DEGREE = 60;
// const SECONDS_PER_MINUTE = 60;
// const SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE;

// function dms(degreesFloat) {
//   const degreesInt = Math.floor(degreesFloat);
//   const minutes = Math.floor((degreesFloat - degreesInt) * MINUTES_PER_DEGREE);
//   const seconds = Math.floor(
//     (degreesFloat - degreesInt - (minutes / MINUTES_PER_DEGREE)) *
//     SECONDS_PER_DEGREE
//   );

//   return `${String(degreesInt) + DEGREE + padZeroes(minutes)}'${padZeroes(seconds)}"`;
// }

// function padZeroes(number) {
//   const numString = String(number);
//   return numString.length < 2 ? (`0${numString}`) : numString;
// }


// FURTHER EXPLORATION:

// function dms(degreesFloat) {
//   degreesFloat %= 360;

//   if (degreesFloat < 0) {
//     degreesFloat = 360 + degreesFloat;
//   }

//   const degreesInt = Math.floor(degreesFloat);

//   const minutesFloat = (degreesFloat - degreesInt) * MINUTES_PER_DEGREES;
//   const minutesInt = Math.floor(minutesFloat);

//   const secondsInt = Math.floor((minutesFloat - minutesInt) * SECONDS_PER_MINUTES);

//   return `${degreesInt}${DEGREES_SYMBOL}${padZeroes(minutesInt)}'${padZeroes(secondsInt)}"`;
// }

// function padZeroes(number) {
//   let numString = String(number);
//   return numString.padStart(2, '0');
// }

// console.log(dms(-1));     // 359°00'00"
// console.log(dms(400));    // 40°00'00"
// console.log(dms(-40));    // 320°00'00"
// console.log(dms(-420));   // 300°00'00"
// console.log(dms(-76.73)); // 283°16'11"
// console.log(dms(283.27)); // 283°16'11"
