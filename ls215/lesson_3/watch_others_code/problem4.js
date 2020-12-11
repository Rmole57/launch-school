"use strict";

function expandNumList(numListString) {
  const RANGE_INDICATORS = ['-', ':', '..'];

  let resultList = [];
  let listParts = numListString.match(/\d+|[-:]|\.{2}/g);

  let counter = Number(listParts[0]);

  listParts.forEach((part, index) => {
    if (RANGE_INDICATORS.includes(part)) {
      while (!String(counter).endsWith(listParts[index + 1])) {
        resultList.push(counter);
        counter += 1;
      }
    } else {
      while (!String(counter).endsWith(part)) {
        counter += 1;
      }
      resultList.push(counter);
      counter += 1;
    }
  });

  return resultList;
}

console.log(expandNumList('1,3,7,2,4,1'));  // 1, 3, 7, 12, 14, 21
console.log(expandNumList('1-3,1-2'));      // 1, 2, 3, 11, 12
console.log(expandNumList('1:5-2'));        // 1, 2, 3, 4, 5, 6 ... 12
console.log(expandNumList('104-2'));        // 104, 105, ... 112
console.log(expandNumList('104-02'));       // 104, 105, ... 202
console.log(expandNumList('545,64..11'));   // 545, 564, 656, ... 611
console.log(expandNumList('1:1..1-1'));     // 1, 2, ... 11, 12, ... 21, 22 ... 31
