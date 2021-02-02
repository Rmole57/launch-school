function createObject(obj) {
  return Object.setPrototypeOf({}, obj);
}

let foo = {
  a: 1
};

let bar = createObject(foo);
console.log(foo.isPrototypeOf(bar));         // true


// ALTERNATIVE SOLUTION:

// function createObject(obj) {
//   function F() {}
//   F.prototype = obj;
//   return new F();
// }
