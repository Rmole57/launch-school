function myBind(func, ctx, ...partialArgs) {
  return function (...args) {
    return func.apply(ctx, partialArgs.concat(args));
  };
}

function addNumbers(a, b) {
  return a + b;
}

const addFive = myBind(addNumbers, null, 5);

console.log(addFive(10));  // 15
