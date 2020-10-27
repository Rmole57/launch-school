const transactionLog = [];

function processInput(input) {
  const numericalData = parseFloat(input);

  if (Number.isNaN(numericalData)) {
    throw (new Error('Data could not be converted to numerical amount.'));
  }

  return numericalData;
}

function logTransaction() {
  let data = prompt('Please enter the transaction amount: ');

  try {
    data = processInput(data);
    transactionLog.push(data);

    alert('Thank you. Data accepted.');
  } catch (error) {
    alert(error.message);
  }
}

function transactionTotal() {
  let total = 0;

  for (let i = 0; i < transactionLog.length; i++) {
    total += transactionLog[i];
  }

  return total;
}

logTransaction();
logTransaction();
logTransaction();

console.log(transactionTotal());


// FURTHER EXPLORATION:

// Refactored code to take advantage of NaN being falsy in order to eliminate unnecessary try/catch blocks:
// const transactionLog = [];

// function processInput(input) {
//   return parseFloat(input);
// }

// function logTransaction() {
//   let data = prompt('Please enter the transaction amount: ');

//   data = processInput(data);

//   if (data) {
//     transactionLog.push(data);
//     alert('Thank you. Data accepted.');
//   } else {
//     alert('Data could not be converted to numerical amount.')
//   }
// }
