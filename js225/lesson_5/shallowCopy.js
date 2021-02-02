function shallowCopy(object) {
  let copy = Object.create(Object.getPrototypeOf(object));
  return Object.assign(copy, object);
}

let foo = {
  a: 1,
  b: 2,
};

let bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

let baz = shallowCopy(bar);
console.log(baz.a);                    // => 1
baz.say();                             // => c is 3
console.log(baz.hasOwnProperty('a'));  // false
console.log(baz.hasOwnProperty('b'));  // false


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution #1:
// function shallowCopy(object) {
//   let result = Object.create(Object.getPrototypeOf(object));
//   let prop;

//   for (prop in object) {
//     if (Object.prototype.hasOwnProperty.call(object, prop)) {
//       result[prop] = object[prop];
//     }
//   }

//   return result;
// }

// 2) - Launch School solution #2:
// function shallowCopy(object) {
//   let copy = Object.create(Object.getPrototypeOf(object));

//   Object.getOwnPropertyNames(object).forEach(function(prop) {
//     copy[prop] = object[prop];
//   });

//   return copy;
// }
