logValue(); // Hello, world!

function logValue() {
  console.log('Hello, world!');
}

// FURTHER EXPLORATION:

// Provided snippet:

// var logValue = 'foo';

// function logValue() {
//   console.log('Hello, world!');
// }

// console.log(typeof logValue); // string

// Hoisted equivalent of snippet:

// function logValue() {
//   console.log('Hello, world!');
// }

// var logValue; // logValue variable is hoisted but ignored because there already exists a logValue variable that is a function

// logValue = 'foo'; // logValue reassigned to the string 'foo'

// console.log(typeof logValue); // string
