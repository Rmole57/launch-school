function indexOf(firstString, secondString) {
  let limit = firstString.length - secondString.length;

  for(let searchIndex = 0; searchIndex <= limit; searchIndex += 1) {
    if (firstString[searchIndex] === secondString[0]) {
      let testIndex = searchIndex;
      let testString = '';

      while (testString.length !== secondString.length) {
        testString += firstString[testIndex];
        testIndex += 1;
      }

      if (testString === secondString) return searchIndex;
    }
  }

  return -1;
}

function lastIndexOf(firstString, secondString) {
  let limit = firstString.length - secondString.length;

  for (let searchIndex = limit; searchIndex >= 0; searchIndex -= 1) {
    if (firstString[searchIndex] === secondString[0]) {
      let testIndex = searchIndex;
      let testString = '';

      while (testString.length !== secondString.length) {
        testString += firstString[testIndex];
        testIndex += 1;
      }

      if (testString === secondString) return searchIndex;
    }
  }

  return -1;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1

// ALTERNATIVE SOLUTION:

// function indexOf(firstString, secondString) {
//   let limit = firstString.length - secondString.length;

//   for (let indexFirst = 0; indexFirst <= limit; indexFirst += 1) {
//     let matchCount = 0;

//     for (let indexSecond = 0; indexSecond < secondString.length; indexSecond += 1) {
//       if (firstString[indexFirst + indexSecond] === secondString[indexSecond]) {
//         matchCount += 1;
//       } else {
//         break;
//       }
//     }

//     if (matchCount === secondString.length) {
//       return indexFirst;
//     }
//   }

//   return -1;
// }

// function lastIndexOf(firstString, secondString) {
//   let limit = firstString.length - secondString.length;

//   for (let indexFirst = limit; indexFirst >= 0; indexFirst -= 1) {
//     let matchCount = 0;

//     for (let indexSecond = 0; indexSecond < secondString.length; indexSecond += 1) {
//       if (firstString[indexFirst + indexSecond] === secondString[indexSecond]) {
//         matchCount += 1;
//       } else {
//         break;
//       }
//     }

//     if (matchCount === secondString.length) {
//       return indexFirst;
//     }
//   }

//   return -1;
// }

// FURTHER EXPLORATION:

// function lastIndexOf(firstString, secondString) {
//   let slice = function (string, startIndex) {
//     let substring = '';

//     for (let index = startIndex; index < string.length; index += 1) {
//       substring += string[index];
//     }

//     return substring;
//   };

//   let limit = firstString.length - secondString.length;

//   for (let index = limit; index >= 0; index -= 1) {
//     let testString = slice(firstString, index);
//     if (indexOf(testString, secondString) !== -1) return index;
//   }

//   return -1;
// }
