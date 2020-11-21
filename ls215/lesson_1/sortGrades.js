let studentGrades = [
  { name: 'StudentA', grade: 90.1 },
  { name: 'StudentB', grade: 92 },
  { name: 'StudentC', grade: 91.8 },
  { name: 'StudentD', grade: 95.23 },
  { name: 'StudentE', grade: 91.81 },
];

function compareGrades(student1, student2) {
  if (student1.grade < student2.grade) {
    return 1;
  } else if (student1.grade > student2.grade) {
    return -1;
  } else {
    return 0;
  }
}

console.log(studentGrades.sort(compareGrades));

// console output:
// [
//   { name: 'StudentD', grade: 95.23 },
//   { name: 'StudentB', grade: 92 },
//   { name: 'StudentE', grade: 91.81 },
//   { name: 'StudentC', grade: 91.8 },
//   { name: 'StudentA', grade: 90.1 }
// ]


// ALTERNATIVE SOLUTION:

// Using inline style:
// let studentGrades = [
//   { name: 'StudentA', grade: 90.1 },
//   { name: 'StudentB', grade: 92 },
//   { name: 'StudentC', grade: 91.8 },
//   { name: 'StudentD', grade: 95.23 },
//   { name: 'StudentE', grade: 91.81 },
// ];

// studentGrades.sort((student1, student2) => {
//   if (student1.grade < student2.grade) {
//     return 1;
//   } else if (student1.grade > student2.grade) {
//     return -1;
//   } else {
//     return 0;
//   }
// });
