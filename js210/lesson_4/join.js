function join(array, separator) {
  let resultString = '';
  for (let index = 0; index < array.length; index += 1) {
    resultString += String(array[index]);
    if (index < array.length - 1) resultString += separator;
  }

  return resultString;
}

console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'
