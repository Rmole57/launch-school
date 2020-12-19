"use strict";

function triangle(angle1, angle2, angle3) {
  let sortedAngles = [angle1, angle2, angle3].sort((a, b) => a - b);

  if (!isValid(sortedAngles)) return 'invalid';
  if (sortedAngles.every(angle => angle < 90)) return 'acute';
  if (sortedAngles[2] > 90) return 'obtuse';
  return 'right';
}

function isValid(angles) {
  let angleSum = angles.reduce((sum, angle) => sum + angle);
  return angleSum === 180 && angles[0] > 0;
}

console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"


// ALTERNATIVE SOLUTION:

// function triangle(angle1, angle2, angle3) {
//   const angles = [angle1, angle2, angle3];
//   if (isValid(angles)) {
//     return getTriangleType(angles);
//   } else {
//     return "invalid";
//   }
// }

// function isValid(angles) {
//   const totalAngle = angles.reduce((total, angle) => total + angle);

//   const allNonZero = angles.every(angle => angle > 0);

//   return totalAngle === 180 && allNonZero;
// }

// function getTriangleType(angles) {
//   if (angles.some(testRightTriangle)) {
//     return "right";
//   } else if (angles.every(testAcuteTriangle)) {
//     return "acute";
//   } else {
//     return "obtuse";
//   }
// }

// function testRightTriangle(angle) {
//   return angle === 90;
// }

// function testAcuteTriangle(angle) {
//   return angle < 90;
// }
