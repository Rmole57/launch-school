const rlSync = require('readline-sync');
const SQMETERS_TO_SQFEET = 10.7639;

console.log('Enter the length of the room in meters:');
let length = rlSync.prompt();
length = parseInt(length, 10);

console.log('Enter the width of the room in meters:');
let width = rlSync.prompt();
width = parseInt(width, 10);

let areaInMeters = length * width;
let areaInFeet = areaInMeters * SQMETERS_TO_SQFEET;

console.log(`The area of the room is ${areaInMeters.toFixed(2)} square meters (${areaInFeet.toFixed(2)} square feet).`);

// FURTHER EXPLORATION:

// 1 - (Solution using a do/while loop for validation):
// const rlSync = require('readline-sync');
// const SQMETERS_TO_SQFEET = 10.7639;

// let units;
// do {
//   if (units) {
//     console.log('Invalid input! Please type either "feet" or "meters".');
//   }

//   console.log('Enter your units (feet or meters):');
//   units = rlSync.prompt().toLowerCase();
// } while (!['feet', 'meters'].includes(units));

// console.log(`Enter the length of the room in ${units}:`);
// let length = parseInt(rlSync.prompt(), 10);

// console.log(`Enter the length of the room in ${units}:`);
// let width = parseInt(rlSync.prompt(), 10);

// let area = length * width;

// if (units === 'meters') {
//   let areaInMeters = area;
//   let areaInFeet = area * SQMETERS_TO_SQFEET;
//   console.log(`The area of the room is ${areaInMeters.toFixed(2)} square meters (${areaInFeet.toFixed(2)} square feet).`);
// } else {
//   let areaInMeters = area / SQMETERS_TO_SQFEET;
//   let areaInFeet = area;
//   console.log(`The area of the room is ${areaInFeet.toFixed(2)} square feet (${areaInMeters.toFixed(2)} square meters).`);
// }

// 2 - (Solution using built-in readlineSync functionality):
// const rlSync = require('readline-sync');
// const SQMETERS_TO_SQFEET = 10.7639;

// let units = rlSync.question('Enter your units (feet or meters):\n', {
//   limit: ['feet', 'meters'],
//   limitMessage: 'Sorry, $<lastInput> is not a valid unit.'
// }).toLowerCase();

// console.log(`Enter the length of the room in ${units}:`);
// let length = parseInt(rlSync.prompt(), 10);

// console.log(`Enter the length of the room in ${units}:`);
// let width = parseInt(rlSync.prompt(), 10);

// let area = length * width;

// if (units === 'meters') {
//   let areaInMeters = area;
//   let areaInFeet = area * SQMETERS_TO_SQFEET;
//   console.log(`The area of the room is ${areaInMeters.toFixed(2)} square meters (${areaInFeet.toFixed(2)} square feet).`);
// } else {
//   let areaInMeters = area / SQMETERS_TO_SQFEET;
//   let areaInFeet = area;
//   console.log(`The area of the room is ${areaInFeet.toFixed(2)} square feet (${areaInMeters.toFixed(2)} square meters).`);
// }
