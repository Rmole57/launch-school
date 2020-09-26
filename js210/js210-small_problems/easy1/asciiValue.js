function asciiValue(string) {
  let totalValue = 0;

  for (let index = 0; index < string.length; index += 1) {
    totalValue += string.charCodeAt(index);
  }

  return totalValue;
}

console.log(asciiValue('Four score'));         // 984
console.log(asciiValue('Launch School'));      // 1251
console.log(asciiValue('a'));                  // 97
console.log(asciiValue(''));                   // 0
