const rlSync = require('readline-sync');

const noun = rlSync.question('Enter a noun: ');
const verb = rlSync.question('Enter a verb: ');
const adjective = rlSync.question('Enter an adjective: ');
const adverb = rlSync.question('Enter and adverb: ');

const sentence = `Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`;

console.log(sentence);

// ALTERNATIVE SOLUTION:

// const noun = prompt('Enter a noun:');
// const verb = prompt('Enter a verb:');
// const adjective = prompt('Enter an adjective:');
// const adverb = prompt('Enter an adverb:');

// const sentence1 = `Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`;
// const sentence2 = `The ${adjective} ${noun} ${verb}s ${adverb} over the lazy dog.`;
// const sentence3 = `The ${noun} ${adverb} ${verb}s up ${adjective} Joe's turtle.`;

// console.log(sentence1);
// console.log(sentence2);
// console.log(sentence3);
