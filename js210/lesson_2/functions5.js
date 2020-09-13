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

let temperatures = [98, 77, 83, 66, 90];

console.log(average(temperatures));
