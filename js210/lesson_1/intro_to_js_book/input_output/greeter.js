let rlSync = require('readline-sync');
let firstName = rlSync.question('What is your first name? ');
let lastName = rlSync.question('What is your last name? ');
let fullName = `${firstName} ${lastName}`;
console.log(`Hello, ${fullName}!`);
