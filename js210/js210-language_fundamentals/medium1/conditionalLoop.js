// Solution 1:
let i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  }

  i += 1;
}

// Solution 2:
for (let i = 0; i < 10; i += 1) {
  if (i % 3 === 0) {
    console.log(i);
  }
}


// Original, broken code:
// let i = 0;
// while (i < 10) {
//   if (i % 3 === 0) {
//     console.log(i);
//   } else {
//     i += 1;
//   }
// }
