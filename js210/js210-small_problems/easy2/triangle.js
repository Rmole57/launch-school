function triangle(height) {
  for (let starCount = 1; starCount <= height; starCount++) {
    let spaces = ' '.repeat(height - starCount);
    let stars = '*'.repeat(starCount);
    console.log(spaces + stars);
  }
}

triangle(5);
triangle(9);

// ALTERNATIVE SOLUTION:

// function triangle(height) {
//   let stars = 1;
//   let spaces = height - 1;

//   for (let i = 0; i < height; i += 1) {
//     console.log(repeat(' ', spaces) + repeat('*', stars));
//     stars += 1;
//     spaces -= 1;
//   }
// }

// function repeat(char, count) {
//   let repeated = '';

//   for (let i = 0; i < count; i += 1) {
//     repeated += char;
//   }

//   return repeated;
// }
