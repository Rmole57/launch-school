function average(numbers) {
  let total = 0;

  for(let index = 0, length = numbers.length; index < length; index += 1) {
    total += numbers[index];
  }

  return total / numbers.length;
}

console.log(average([3, 5, 8, 7, 4]));
