function removeVowels(strings) {
  return strings.map(string => string.replace(/[aeiou]/gi, ''));
}

console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));         // ["bcdfghjklmnpqrstvwxyz"]
console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));  // ["grn", "YLLW", "blck", "wht"]
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));                // ["BC", "", "XYZ"]


// ALTERNATIVE SOLUTION:

// function removeVowels(stringArray) {
//   const VOWELS = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
//   return stringArray.map(string => string.split('').map(char => {
//     if (VOWELS.includes(char)) {
//       return '';
//     } else {
//       return char;
//     }
//   }).join(''));
// }


// FURTHER EXPLORATION:

// See original solution implementation above!
