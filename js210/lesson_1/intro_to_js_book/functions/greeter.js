function getName(prompt) {
  let rlSync = require('readline-sync');
  let name = rlSync.question(prompt);
  return name;
}

let firstName = getName('What is your first name? ');
let lastName = getName('What is your last name? ');
let fullName = `${firstName} ${lastName}`;
console.log(`Hello, ${fullName}!`);
