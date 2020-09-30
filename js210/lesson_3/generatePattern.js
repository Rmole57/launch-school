function generatePattern(nStars) {
  let numberString = '';

  for (let lineNumber = 1; lineNumber <= nStars; lineNumber += 1) {
    numberString += String(lineNumber);
    let starString = '*'.repeat(nStars - lineNumber);
    let pattern = numberString + starString;

    console.log(pattern);
  }
}

generatePattern(7);
// console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567

// ALTERNATIVE SOLUTION:

// function generatePattern(nStars) {
//   for (let lineNumber = 1; lineNumber <= nStars; lineNumber += 1) {
//     let string = '';

//     for (let digit = 1; digit <= lineNumber; digit += 1) {
//       string += String(digit);
//     }

//     for (let count = lineNumber + 1; count <= nStars; count += 1) {
//       string += '*';
//     }

//     console.log(string);
//   }
// }

// FURTHER EXPLORATION:

// My solution:
// function generatePattern(nStars) {
//   for (let lineNumber = 1; lineNumber <= nStars; lineNumber += 1) {
//     let string = '';

//     for (let digit = 1; digit <= lineNumber; digit += 1) {
//       string += String(digit);
//     }

//     for (let count = lineNumber + 1; count <= nStars; count += 1) {
//       string += '*'.repeat(String(count).length);
//     }

//     console.log(string);
//   }
// }

// generatePattern(20);
// generatePattern(100);

// LS solution:
// function generatePattern(nStars) {
//   let lastRowString = '';

//   for (let lineNumber = 1; lineNumber <= nStars; lineNumber += 1) {
//     lastRowString += String(lineNumber);
//   }

//   let width = lastRowString.length;

//   for (let lineNumber = 1; lineNumber <= nStars; lineNumber += 1) {
//     let string = '';
//     for (let digit = 1; digit <= lineNumber; digit += 1) {
//       string += String(digit);
//     }

//     let numberOfStars = width - string.length;
//     for (let count = 1; count <= numberOfStars; count += 1) {
//       string += '*';
//     }

//     console.log(string);
//   }
// }

// generatePattern(20);
// generatePattern(100);
