const MILLISECONDS_PER_MINUTE = 60000;

function timeOfDay(deltaMinutes) {
  let deltaMilliseconds = deltaMinutes * MILLISECONDS_PER_MINUTE;
  let newTime = new Date(deltaMilliseconds);

  let hours = padWithZeroes(newTime.getUTCHours(), 2);
  let minutes = padWithZeroes(newTime.getMinutes(), 2);

  return `${hours}:${minutes}`;
}

function padWithZeroes(number, length) {
  let numberString = String(number);

  while (numberString.length < length) {
    numberString = `0${numberString}`;
  }

  return numberString;
}

console.log(timeOfDay(0));          // "00:00"
console.log(timeOfDay(-3));         // "23:57"
console.log(timeOfDay(35));         // "00:35"
console.log(timeOfDay(-1437));      // "00:03"
console.log(timeOfDay(3000));       // "02:00"
console.log(timeOfDay(800));        // "13:20"
console.log(timeOfDay(-4231));      // "01:29"


// ALTERNATIVE SOLUTIONS:

// 1 - LS Solution:
// const MILLISECONDS_PER_MINUTE = 60000;

// function timeOfDay(deltaMinutes) {
//   const midnight = new Date('1/1/2000 00:00');
//   const afterMidnight = new Date(midnight.getTime() + deltaMinutes * MILLISECONDS_PER_MINUTE);
//   const hours = padWithZeroes(afterMidnight.getHours(), 2);
//   const minutes = padWithZeroes(afterMidnight.getMinutes(), 2);

//   return `${hours}:${minutes}`;
// }

// function padWithZeroes(number, length) {
//   let numberString = String(number);

//   while (numberString.length < length) {
//     numberString = `0${numberString}`;
//   }

//   return numberString;
// }

// 2 - Interesting solution inspired by a classmate's implementation:
// const MILLISECONDS_PER_MINUTE = 60000;

// function timeOfDay(deltaMinutes) {
//   let newTime = new Date(2020, 8, 21, 0, deltaMinutes);

//   let hours = padWithZeroes(newTime.getHours(), 2);
//   let minutes = padWithZeroes(newTime.getMinutes(), 2);

//   return `${hours}:${minutes}`;
// }

// function padWithZeroes(number, length) {
//   let numberString = String(number);

//   while (numberString.length < length) {
//     numberString = `0${numberString}`;
//   }

//   return numberString;
// }
