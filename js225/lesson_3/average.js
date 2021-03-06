let temperatures = [53, 86, 12, 43];

function average() {
  let total = 0;
  let i;
  for (i = this.length - 1; i >= 0; i -= 1) {
    total += this[i];
  }

  return total / this.length;
}

console.log(average.call(temperatures));   // => 48.5
console.log(average.apply(temperatures));  // => 48.5

let averageTemperature = average.bind(temperatures);
console.log(averageTemperature());         // => 48.5

temperatures.average = average;
console.log(temperatures.average());       // => 48.5
