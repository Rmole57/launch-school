function times(number1, number2) {
  let result = number1 * number2;
  console.log(result);
  return result;
}

times(times(times(times(times(1, 1), 2), 3), 4), 5);

// ALTERNATIVE SOLUTION:

// let oneFactorial = times(1, 1);
// let twoFactorial = times(2, oneFactorial);
// let threeFactorial = times(3, twoFactorial);
// let fourFactorial = times(4, threeFactorial);
// let fiveFactorial = times(5, fourFactorial);
