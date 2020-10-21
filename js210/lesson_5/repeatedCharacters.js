function repeatedCharacters(string) {
  let lowerCaseString = string.toLowerCase();
  let counts = {};

  for (let index = 0; index < lowerCaseString.length; index += 1) {
    let character = lowerCaseString[index];

    if (character in counts) {
      counts[character] += 1;
      continue;
    }

    counts[character] = 1;
  }

  for (let key in counts) {
    if (counts[key] < 2) delete counts[key];
  }

  return counts;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }


// ALTERNATIVE SOLUTION:

// function repeatedCharacters(string) {
//   let result = {};
//   let lowerCaseString = string.toLowerCase();

//   for (let index = 0; index < lowerCaseString.length; index += 1) {
//     if (result[lowerCaseString[index]] !== undefined) {
//       result[lowerCaseString[index]] += 1;
//     } else {
//       result[lowerCaseString[index]] = 1;
//     }
//   }

//   for (let key in result) {
//     if (result[key] === 1) {
//       delete result[key];
//     }
//   }

//   return result;
// }
