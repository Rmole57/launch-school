function twice(number) {
  const numberString = String(number);
  const numberLength = numberString.length;

  if (numberLength % 2 === 0) {
    const center = numberLength / 2;
    const leftHalf = numberString.substring(0, center);
    const rightHalf = numberString.substring(center);
    
    if (leftHalf === rightHalf) return number;
  }

  return number * 2;
}

console.log(twice(37));          // 74
console.log(twice(44));          // 44
console.log(twice(334433));      // 668866
console.log(twice(444));         // 888
console.log(twice(107));         // 214
console.log(twice(103103));      // 103103
console.log(twice(3333));        // 3333
console.log(twice(7676));        // 7676

// ALTERNATIVE SOLUTION:

// function twice(number) {
//   if (isDoubleNumber(number)) {
//     return number;
//   } else {
//     return number * 2;
//   }
// }

// function isDoubleNumber(number) {
//   const stringNumber = String(number);
//   const center = stringNumber.length / 2;
//   const leftNumber = stringNumber.substring(0, center);
//   const rightNumber = stringNumber.substring(center);

//   return leftNumber === rightNumber;
// }
