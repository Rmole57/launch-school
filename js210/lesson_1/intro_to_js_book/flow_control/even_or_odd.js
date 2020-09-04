function evenOrOdd(num) {
  if (!Number.isInteger(num)) {
    console.log('Sorry, the value you passed is not an integer');
    return;
  }

  if (num % 2 === 0) {
    console.log('even');
  } else {
    console.log('odd');
  }
}

evenOrOdd(4);
evenOrOdd(7);
evenOrOdd(5);
evenOrOdd(12);
evenOrOdd('5');
