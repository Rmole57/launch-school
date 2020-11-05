"use strict";

function countOccurrences(array) {
  const counts = {};

  array.forEach(ele => {
    if (!counts[ele]) counts[ele] = 0;
    counts[ele] += 1;
  });

  for (let item in counts) {
    console.log(`${item} => ${String(counts[item])}`);
  }
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                  'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// Console Output:
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2


// ALTERNATIVE SOLUTION:

// function countOccurrences(elements) {
//   const occurrences = {};

//   for (let i = 0; i < elements.length; i += 1) {
//     occurrences[elements[i]] = occurrences[elements[i]] || 0;
//     occurrences[elements[i]] += 1;
//   }

//   logOccurrences(occurrences);
// }

// function logOccurrences(occurrences) {
//   for (let item in occurrences) {
//     console.log(`${item} => ${String(occurrences[item])}`);
//   }
// }
