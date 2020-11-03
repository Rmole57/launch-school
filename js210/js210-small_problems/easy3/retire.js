"use strict";

const rlSync = require('readline-sync');

const currentAge = parseInt(rlSync.question('What is your age? '), 10);
const retireAge = parseInt(rlSync.question('At what age would you like to retire? '), 10);
const remainingYears = retireAge - currentAge;

const currentYear = new Date().getFullYear();
const retireYear = currentYear + remainingYears;

console.log(`It's ${currentYear}. You will retire in ${retireYear}.`);
console.log(`You only have ${remainingYears} years of work to go!`);
