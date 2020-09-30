function getGrade(score1, score2, score3) {
  const average = (score1 + score2 + score3) / 3;

  if (average >= 90) return 'A';
  if (average >= 80) return 'B';
  if (average >= 70) return 'C';
  if (average >= 60) return 'D';
  return 'F';
}

console.log(getGrade(95, 90, 93));    // "A"
console.log(getGrade(50, 50, 95));    // "D"

// ALTERNATIVE SOLUTIONS:

// 1 - LS solution:
// function getGrade(grade1, grade2, grade3) {
//   const average = (grade1 + grade2 + grade3) / 3;

//   if (average >= 90 && average <= 100) {
//     return 'A';
//   } else if (average >= 80 && average < 90) {
//     return 'B';
//   } else if (average >= 70 && average < 80) {
//     return 'C';
//   } else if (average >= 60 && average < 70) {
//     return 'D';
//   } else {
//     return 'F';
//   }
// }

// 2 - Original solution before refactoring for readability:
// function getGrade(score1, score2, score3) {
//   const average = (score1 + score2 + score3) / 3;

//   if (average < 60) return 'F';
//   if (average < 70) return 'D';
//   if (average < 80) return 'C';
//   if (average < 90) return 'B';
//   return 'A';
// }
