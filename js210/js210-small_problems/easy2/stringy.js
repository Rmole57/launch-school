function stringy(length) {
  let result = '';

  for (let counter = 0; counter < length; counter++) {
    if (counter % 2 === 0) {
      result += '1';
    } else {
      result += '0';
    }
  }

  return result;
}

console.log(stringy(6));    // "101010"
console.log(stringy(9));    // "101010101"
console.log(stringy(4));    // "1010"
console.log(stringy(7));    // "1010101"
