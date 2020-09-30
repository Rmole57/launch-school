const rlSync = require('readline-sync');

let score1 = Number(rlSync.question('Enter score1: '));
let score2 = Number(rlSync.question('Enter score2: '));
let score3 = Number(rlSync.question('Enter score3: '));

let average = (score1 + score2 + score3) / 3;

let grade;
if (average >= 90) {
  grade = 'A';
} else if (average >= 70) {
  grade = 'B';
} else if (average >= 50) {
  grade = 'C';
} else {
  grade = 'F';
}

console.log(`Based on the average of your 3 scores your letter grade is "${grade}".`);

// ALTERNATIVE SOLUTION:

// const rlSync = require('readline-sync');

// let score1 = Number(rlSync.question('Enter score1: '));
// let score2 = Number(rlSync.question('Enter score2: '));
// let score3 = Number(rlSync.question('Enter score3: '));
// let total = score1 + score2 + score3;
// let average = total / 3;

// let grade = 'F';
// if (average >= 90) {
//   grade = 'A';
// } else if (average >= 70) {
//   grade = 'B';
// } else if (average >= 50) {
//   grade = 'C';
// }

// console.log('Based on the average of your 3 scores your letter grade is "' +
//             grade + '".');

// FURTHER EXPLORATION:

// function collectScores() {
//   const rlSync = require('readline-sync');
//   let scoreCount = rlSync.question('How many scores would you like to enter? ');
//   let scores = [];

//   for (let currentCount = 1; currentCount <= scoreCount; currentCount++) {
//     let score = Number(rlSync.question(`Enter score${currentCount}: `));
//     scores.push(score);
//   }

//   return scores;
// }

// function computeAverage(scores) {
//   let total = scores.reduce((acc, curr) => acc + curr );
//   return total / scores.length;
// }

// let scores = collectScores();
// let average = computeAverage(scores);

// let grade;
// if (average >= 90) {
//   grade = 'A';
// } else if (average >= 70) {
//   grade = 'B';
// } else if (average >= 50) {
//   grade = 'C';
// } else {
//   grade = 'F';
// }

// console.log(`Based on the average of your ${scores.length} scores ` + 
//             `your letter grade is "${grade}".`);
