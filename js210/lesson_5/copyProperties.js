function copyProperties(source, destination) {
  for (let property in source) {
    destination[property] = source[property];
  }

  return Object.keys(source).length;
}

let hal = {
  model: 9000,
  enabled: true,
};

let sal = {};
console.log(copyProperties(hal, sal));  // 2
console.log(sal);                       // { model: 9000, enabled: true }


// ALTERNATIVE SOLUTION:

// function copyProperties(source, destination) {
//   let count = 0;
//   for (let property in source) {
//     destination[property] = source[property];
//     count += 1;
//   }

//   return count;
// }
