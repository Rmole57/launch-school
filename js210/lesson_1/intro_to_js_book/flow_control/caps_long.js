function capsLong(string) {
  if (string.length > 10) {
    return string.toUpperCase();
  } else {
    return string;
  }
}

console.log(capsLong("Sue Smith"));
console.log(capsLong("Sue Robertson"));
console.log(capsLong("Joe Thomas"));
console.log(capsLong("Joe Stevens"));

// ALTERNATIVE SOLUTION:

// function capsLong(string) {
//   return ((string.length > 10) ? string.toUpperCase() : string);
// }
