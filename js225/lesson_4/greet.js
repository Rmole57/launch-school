function greet(greeting, name) {
  let capitalized = greeting[0].toUpperCase() + greeting.slice(1);
  let message = capitalized + ', ' + name + '!';
  console.log(message);
}

function partial(primary, arg1) {
  return function (arg2) {
    return primary(arg1, arg2);
  };
}

greet('howdy', 'Joe');                   // Howdy, Joe!
greet('good morning', 'Sue');            // Good morning, Sue!

// using partial function application:
let sayHello = partial(greet, 'hello');
sayHello('Brandon');                     // Hello, Brandon!

let sayHi = partial(greet, 'hi');
sayHi('Sarah');                          // Hi, Sarah!
