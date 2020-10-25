// Code Snippet 1:
var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate)); // "The total value is 15"

function counter(count) {
  // ...
}


// Code Snippet 2:
function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate)); // "The total value is NaN"

var counter = 5;
var rate = 3;


// Code Snippet 3:
var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate)); // "The total value is 15"


// Code Snippet 4:
let counter = 5;
let rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate)); // SyntaxError


// SNIPPETS AFTER HOISTING:

// Code Snippet 1:
function counter(count) {
  // ...
}

var rate;

counter = 5;
rate = 3;

console.log('The total value is ' + String(counter * rate));
// logs: The total value is 15


// Code Snippet 2:
function counter(count) {
  // ...
}

var rate;

console.log('The total value is ' + String(counter * rate));
// logs: The total value is NaN

counter = 5;
rate = 3;


// Code Snippet 3:
function counter(count) {
  // ...
}

var rate;

counter = 5;
rate = 3;

console.log('The total value is ' + String(counter * rate));
// logs: The total value is 15


// Code Snippet 4:
function counter(count) {
  // ...
}

let counter;
// Uncaught SyntaxError: Identifier 'counter' has already been declared
let rate;

counter = 5;
rate = 3;

console.log('The total value is ' + String(counter * rate));
