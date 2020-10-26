// Refactored Code:
const person = { name: 'Victor' };
const otherPerson = person;

console.log(person === otherPerson);    // true

// Original Code:
// const person = { name: 'Victor' };
// const otherPerson = { name: 'Victor' };

// console.log(person === otherPerson);    // false -- expected: true
