function anagram(word, list) {
  return list.filter(candidate => areAnagrams(candidate, word));
}

function areAnagrams(source, target) {
  return source.split('').sort().join('') === target.split('').sort().join('');
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]


// ALTERNATIVE SOLUTION:

// function anagram(word, list) {
//   return list.filter(candidate => areAnagrams(word, candidate));
// }

// function areAnagrams(source, target) {
//   let sourceLetters = source.split('').sort();
//   let targetLetters = target.split('').sort();
//   return compareArrays(sourceLetters, targetLetters);
// }

// function compareArrays(array1, array2) {
//   if (array1.length !== array2.length) return false;

//   return array1.every((letter, index) => letter === array2[index]);
// }
