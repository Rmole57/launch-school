function extend(destination) {
  return Object.assign(destination, ...Array.from(arguments).slice(1));
}

let foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

let joe = {
  name: 'Joe'
};

let funcs = {
  sayHello() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye() {
    console.log('Goodbye, ' + this.name);
  },
};

let object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // => 1
object.sayHello();                // => Hello, Joe


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution #1:
// function extend(destination) {
//   for (let i = 1; i < arguments.length; i++) {
//     let source = arguments[i];
//     for (let prop in source) {
//       if (Object.prototype.hasOwnProperty.call(source, prop)) {
//         destination[prop] = source[prop];
//       }
//     }
//   }

//   return destination;
// }

// 2) - Launch School solution #2:
// function extend(destination) {
//   for (let i = 1; i < arguments.length; i++) {
//     let source = arguments[i];
//     Object.getOwnPropertyNames(source).forEach(function(prop) {
//       destination[prop] = source[prop];
//     });
//   }

//   return destination;
// }
