"use strict";

function lightsOn(switches) {
  let lights = new Array(switches).fill(false);

  for (let currRound = 1; currRound <= switches; currRound += 1) {
    for (let index = currRound - 1; index < switches; index += currRound) {
      lights[index] = !lights[index];
    }
  }

  return lights.map((status, index) => status ? index + 1 : status)
               .filter(light => light);
}

console.log(lightsOn(5));        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
console.log(lightsOn(10));       // [1, 4, 9]


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution:
// function lightsOn(n) {
//   let lights = initializeLights(n);

//   for (let i = 1; i <= n; i += 1) {          // rounds: 1..n
//     lights = toggleLights(lights, i);
//   }

//   let result = [];
//   for (let i = 0; i < n; i += 1) {           // indices: 0..n-1
//     if (lights[i]) {
//       result.push(i + 1);
//     }
//   }

//   return result;
// }

// function initializeLights(n) {
//   const lights = [];

//   for (let i = 0; i < n; i += 1) {
//     lights.push(false);
//   }

//   return lights;
// }

// function toggleLights(lights, round) {
//   return lights.map((light, index) => (index + 1) % round === 0 ? !light : light);
// }

// 2) - Original implementation:
// function lightsOn(switches) {
//   let lights = [];
//   for (let lightNumber = 1; lightNumber <= switches; lightNumber += 1) {
//     lights.push([lightNumber, false]);
//   }

//   lights.forEach(([lightNum]) => {
//     currRepetition = lightNum;

//     for (let index = currRepetition - 1; index < switches; index += currRepetition) {
//       lights[index][1] = lights[index][1] ? false : true;
//     }
//   });

//   return lights.filter(([_lightNum, status]) => status === true)
//                .map(([lightNum]) => lightNum);
// }

// 3) - Solution inspired by a classmate's implementation, realizing the fact that the resulting "on" switches are all perfect squares:
// function lightsOn(switches) {
//   let lights = [];
//   let limit = Math.floor(Math.sqrt(switches));

//   for (let toggleRound = 1; toggleRound <= limit; toggleRound += 1) {
//     lights.push(toggleRound**2);
//   }

//   return lights;
// }

// console.log(lightsOn(17));  // [1, 4, 9, 16]
