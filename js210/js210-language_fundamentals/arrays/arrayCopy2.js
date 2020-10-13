// Alternative 1
const myArray = [1, 2, 3, 4];
const myOtherArray = myArray.slice();

myArray.pop();
console.log(myArray);       // [1, 2, 3]
console.log(myOtherArray);  // [1, 2, 3, 4]

// Alternative 2
const myArray = [1, 2, 3, 4];
const myOtherArray = myArray.concat();

myArray.pop();
console.log(myArray);       // [1, 2, 3]
console.log(myOtherArray);  // [1, 2, 3, 4]

// Alternative 3
const myArray = [1, 2, 3, 4];
const myOtherArray = [];

for (let i = 0; i < myArray.length; i += 1) {
  myOtherArray.push(myArray[i]);
}

myArray.pop();
console.log(myArray);               // [1, 2, 3]
console.log(myOtherArray);          // [1, 2, 3, 4]
