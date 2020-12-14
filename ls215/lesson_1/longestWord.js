function myReduce(array, func, initial) {
  let value;
  let index;

  if (initial === undefined) {
    value = array[0];
    index = 1;
  } else {
    value = initial;
    index = 0;
  }

  array.slice(index).forEach((element, index, array) => {
   value = func(value, element, index, array);
  });

  return value;
}

function longestWord(words) {
  return myReduce(words, longest);
}

function longest(result, currentWord) {
  return currentWord.length >= result.length ? currentWord : result;
}

console.log(longestWord(['abc', 'launch', 'targets', '']));      // "targets"


// ALTERNATIVE SOLUTION:

// Using inline style:
// function longestWord(words) {
//   return myReduce(words, function (result, currentWord) {
//     return currentWord.length >= result.length ? currentWord : result;
//   });
// }
