function myBind(func, ctx) {
  return function (...args) {
    return func.apply(ctx, args);
  };
}

let rob = {
  name: 'Rob',
};

let greet = function (greeting) {
  console.log(`${greeting}, ${this.name}!`);
};

greet('Hello');              // Hello, undefined!

greet = myBind(greet, rob);
greet('Good evening');       // Good evening, Rob!
