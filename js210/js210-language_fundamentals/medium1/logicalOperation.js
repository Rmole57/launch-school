console.log((false && undefined));
console.log((false || undefined));
console.log(((false && undefined) || (false || undefined)));
console.log(((false || undefined) || (false && undefined)));
console.log(((false && undefined) && (false || undefined)));
console.log(((false || undefined) && (false && undefined)));
console.log(('a' || (false && undefined) || ''));
console.log(((false && undefined) || 'a' || ''));
console.log(('a' && (false || undefined) && ''));
console.log(((false || undefined) && 'a' && ''));

// Console Output:
// false
// undefined
// undefined
// false
// false
// undefined
// "a"
// "a"
// undefined
// undefined
