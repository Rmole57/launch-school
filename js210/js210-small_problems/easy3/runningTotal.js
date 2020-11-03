function runningTotal(arr) {
  const resultArr = [];
  for (let index = 0; index < arr.length; index += 1) {
    if (index === 0) {
      resultArr.push(arr[index]);
    } else {
      resultArr.push(arr[index] + resultArr[index - 1]);
    }
  }

  return resultArr;
}

console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
console.log(runningTotal([3]));                    // [3]
console.log(runningTotal([]));                     // []


// ALTERNATIVE SOLUTION:

// function runningTotal(array) {
//   const resultArray = [];
//   let sum = 0;

//   for (let i = 0; i < array.length; i += 1) {
//     sum += array[i];
//     resultArray.push(sum);
//   }

//   return resultArray;
// }


// FURTHER EXPLORATION:

// function runningTotal(arr) {
//   return arr.map((num, index) => {
//     return num + arr.slice(0, index).reduce((acc, curr) => acc + curr, 0);
//   });
// }
