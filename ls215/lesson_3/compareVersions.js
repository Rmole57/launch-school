"use strict";

function compareVersions(version1, version2) {
  if (!validNumber(version1) || (!validNumber(version2))) return null;

  let version1Parts = toVersionParts(version1);
  let version2Parts = toVersionParts(version2);

  if (version1Parts.length !== version2Parts.length) {
    formatPartsLength(version1Parts, version2Parts);
  }

  for (let index = 0; index < version1Parts.length; index +=1 ) {
    if (version1Parts[index] > version2Parts[index]) return 1;
    if (version1Parts[index] < version2Parts[index]) return -1;
  }

  return 0;
}

function validNumber(versionNumber) {
  return /^\d+(\.\d+)*$/.test(versionNumber);
}

function toVersionParts(versionString) {
  return versionString.split('.').map(Number);
}

function formatPartsLength(parts1, parts2) {
  let arraysByLength = [parts1, parts2].sort((a, b) => a.length - b.length);
  let shortest = arraysByLength[0];
  let longest = arraysByLength[1];

  let originalEndIndex = shortest.length;

  shortest.length = longest.length;

  shortest.fill(0, originalEndIndex);
}

console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1


// ALTERNATIVE SOLUTION:

// function compareVersions(versionA, versionB) {
//   let validChars = /^[0-9]+(\.[0-9]+)*$/;

//   if (!validChars.test(versionA) || !validChars.test(versionB)) {
//     return null;
//   }

//   let aParts = versionA.split('.').map(Number);
//   let bParts = versionB.split('.').map(Number);
//   let maxLength = Math.max(aParts.length, bParts.length);

//   for (let i = 0; i < maxLength; i += 1) {
//     let aValue = aParts[i] || 0;
//     let bValue = bParts[i] || 0;

//     if (aValue > bValue) {
//       return 1;
//     } else if (aValue < bValue) {
//       return -1;
//     }
//   }

//   return 0;
// }
