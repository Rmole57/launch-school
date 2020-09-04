const readlineSync = require('readline-sync');
let phrase = readlineSync.question('Please enter a phrase: ');

const NON_ALPHA = /[^a-z]/gi;
let phraseLength = phrase.replace(NON_ALPHA, '').length;

console.log(`There are ${phraseLength} characters in "${phrase}".`);
