function trimLeft(string) {
  let copyMode = false;
  let newString = '';

  for (let index = 0; index < string.length; index += 1) {
    if (string[index] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      newString += string[index];
    }
  }

  return newString;
}

function trimRight(string) {
  let copyMode = false;
  let newString = '';

  for (let index = string.length - 1; index >= 0; index -= 1) {
    if (string[index] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      newString += string[newString.length];
    }
  }

  return newString;
}

function trim(string) {
  return trimRight(trimLeft(string));
}

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""

// ALTERNATIVE SOLUTION:

// function trim(string) {
//   let trimmed = trimLeft(string);
//   trimmed = trimRight(trimmed);

//   return trimmed;
// }

// function trimLeft(string) {
//   let newString = '';
//   let copyMode = false;

//   for (let index = 0; index < string.length; index += 1) {
//     if (string[index] !== ' ') {
//       copyMode = true;
//     }

//     if (copyMode) {
//       newString += string[index];
//     }
//   }

//   return newString;
// }

// function trimRight(string) {
//   let newString = '';
//   let copyMode = false;

//   for (let index = string.length - 1; index >= 0; index -= 1) {
//     if (string[index] !== ' ') {
//       copyMode = true;
//     }

//     if (copyMode) {
//       newString = string[index] + newString;
//     }
//   }

//   return newString;
// }
