Object.prototype.ancestors = function ancestors() {
  const result = [];
  let ancestor = Object.getPrototypeOf(this);

  while (ancestor !== Object.prototype) {
    result.push(ancestor.name);
    ancestor = Object.getPrototypeOf(ancestor);
  }

  return result.concat('Object.prototype');
};

// name property added to make objects easier to identify
const foo = {name: 'foo'};
const bar = Object.create(foo);
bar.name = 'bar';
const baz = Object.create(bar);
baz.name = 'baz';
const qux = Object.create(baz);
qux.name = 'qux';

console.log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
console.log(baz.ancestors());  // returns ['bar', 'foo', 'Object.prototype']
console.log(bar.ancestors());  // returns ['foo', 'Object.prototype']
console.log(foo.ancestors());  // returns ['Object.prototype']


// ALTERNATIVE SOLUTION:

// Launch School solution using recursion:
// Object.prototype.ancestors = function ancestors() {
//   const ancestor = Object.getPrototypeOf(this);

//   if (Object.prototype.hasOwnProperty.call(ancestor, 'name')) {
//     return [ancestor.name].concat(ancestor.ancestors());
//   }

//   return ['Object.prototype'];
// };
