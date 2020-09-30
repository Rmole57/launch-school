function passwordPrompt() {
  let rlSync = require('readline-sync');
  return rlSync.question('What is the password: ');
}

const PASSWORD = 'password';
let failedAttempts = 0;

do {
  let guess = passwordPrompt();

  if (guess === PASSWORD) {
    break;
  }

  failedAttempts += 1;
} while (failedAttempts < 3);

if (failedAttempts === 3) {
  console.log('You have been denied access.');
} else {
  console.log('You have successfully logged in.');
}

// ALTERNATIVE SOLUTION:

// const PASSWORD = 'password';
// let failedAttempts = 0;

// while (true) {
//   let guess = prompt('What is the password:');

//   if (guess === PASSWORD) {
//     console.log('You have successfully logged in.');
//     break;
//   }

//   failedAttempts += 1;

//   if (failedAttempts === 3) {
//     console.log('You have been denied access.');
//     break;
//   }
// }
