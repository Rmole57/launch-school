function sum(numbers) {
  let total = 0;
  
  for(let index = 0, length = numbers.length; index < length; index++) {
    total += numbers[index];
  }

  return total;
}

function average(numbers) {
  return sum(numbers) / numbers.length;
}

console.log(average([3, 5, 8, 7, 4]));
