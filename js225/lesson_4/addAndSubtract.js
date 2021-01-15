function add(number) {
  total += number;
  console.log(total);
}

function subtract(number) {
  total -= number;
  console.log(total);
}

let total = 0;

add(1);
// logs: 1

add(42);
// logs: 43

subtract(39);
// logs: 4

add(6);
// logs: 10
