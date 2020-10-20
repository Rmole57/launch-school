const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
const array2 = [];

for (let i = 0; i < array1.length; i += 1) {
  array2.push(array1[i]);
}

for (let i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  }
}

console.log(array2);

// Console Output:
// ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo']


// FURTHER EXPLORATION:

// #1:
// Yes, changes would be made because both arrays reference the same object as one of their elements. And since
// objects are mutable, any changes made to the object are reflected in both arrays since the elements at
// the respective indices in the arrays both reference the same object.

// #2 (2 solutions):
// First solution is to just make the same changes in the second for loop:
// const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
// const array2 = [];

// for (let i = 0; i < array1.length; i += 1) {
//   array2.push(array1[i]);
// }

// for (let i = 0; i < array1.length; i += 1) {
//   if (array1[i].startsWith('C')) {
//     array1[i] = array1[i].toUpperCase();
//     array2[i] = array1[i];
//   }
// }

// console.log(array2);

// Second solution is to just initialize the second array to the first array so each variable is referencing,
// or "pointing" to the same array object, and get rid of the first for loop entirely:
// const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
// const array2 = array1;

// for (let i = 0; i < array1.length; i += 1) {
//   if (array1[i].startsWith('C')) {
//     array1[i] = array1[i].toUpperCase();
//   }
// }

// console.log(array2);
