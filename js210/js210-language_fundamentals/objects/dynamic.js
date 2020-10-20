const myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

const prop2 = '456';
myObject['prop2'] = '456';
myObject[prop2] = '678';

console.log(myObject[prop2]); // "678"
console.log(myObject.prop2);  // "456"


// FURTHER EXPLORATION:

// NOTE: The below results are logged because of the "hoisting" process during the "creation phase" of the JS engine!

// const myObj = {};
// myObj[myFunc()] = 'hello, ';

// function myFunc() {
//   return 'funcProp';
// }

// console.log(myObj); // { funcProp: 'hello, ' }
// myObj[myFunc()] = 'world!';
// console.log(myObj); // { funcProp: 'world!' }
