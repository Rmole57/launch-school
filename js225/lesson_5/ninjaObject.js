let ninjaA = (function() {
  function Ninja() {};
  return new Ninja();
})();

let ninjaB = new ninjaA.constructor;

console.log(ninjaB.constructor === ninjaA.constructor);    // => true


// ALTERNATIVE SOLUTION:

// let ninjaA = (function(){
//   function Ninja(){};
//   return new Ninja();
// })();

// let ninjaB = Object.create(Object.getPrototypeOf(ninjaA));

// console.log(ninjaB.constructor === ninjaA.constructor);  // => true
