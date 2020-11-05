"use strict";

function multiplyList(numbers1, numbers2) {
  const productArray = [];
  for (let index = 0; index < numbers1.length; index += 1) {
    productArray.push(numbers1[index] * numbers2[index]);
  }

  return productArray;
}

console.log(multiplyList([3, 5, 7], [9, 10, 11]));    // [27, 50, 77]
