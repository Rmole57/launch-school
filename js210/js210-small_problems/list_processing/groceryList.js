function buyFruit(fruitsList) {
  const fruits = [];
  fruitsList.forEach(item => {
    for (let count = 0; count < item[1]; count += 1) {
      fruits.push(item[0]);
    }
  });

  return fruits;
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns (as shown by console output): ["apple", "apple", "apple", "orange", "banana", "banana"]


// ALTERNATIVE SOLUTIONS:

// 1) - LS Solution:
// function buyFruit(fruitsList) {
//   return fruitsList.map(fruit => repeat(fruit))
//                    .reduce((groceryList, fruit) => groceryList.concat(fruit));
// }

// function repeat(fruit) {
//   const result = [];

//   for (let i = 0; i < fruit[1]; i += 1) {
//     result.push(fruit[0]);
//   }

//   return result;
// }

// 2) - LS Solution with flat() variation:
// function buyFruit(fruitsList) {
//   return fruitsList.map(fruit => repeat(fruit)).flat();
// }

// function repeat(fruit) {
//   const result = [];

//   for (let i = 0; i < fruit[1]; i += 1) {
//     result.push(fruit[0]);
//   }

//   return result;
// }

// 3) - Solution inspired by classmate's implementation (for exploration purposes):
// function buyFruit(fruitsList) {
//   return fruitsList.flatMap(([fruit, amount]) => new Array(amount).fill(fruit));
// }
