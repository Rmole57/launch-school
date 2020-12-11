"use strict";

function isBlockWord(word) {
  const LETTER_BLOCKS = [ 'BO', 'XK', 'DQ', 'CP', 'NA',
                          'GT', 'RE', 'FS', 'JW', 'HU',
                          'VI', 'LY', 'ZM' ];

  return LETTER_BLOCKS.every(block => {
    let blockRegex = new RegExp(`[${block}]`, 'gi');
    return !word.match(blockRegex) || word.match(blockRegex).length === 1;
  });
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('floW'));       // true
console.log(isBlockWord('APPLE'));      // false
console.log(isBlockWord('apple'));      // false
console.log(isBlockWord('apPLE'));      // false
console.log(isBlockWord('Box'));        // false


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution #1:
// function isBlockWord(word) {
//   const blocks = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM'];
//   const letters = word.split('');

//   for (let i = 0; i < letters.length; i += 1) {
//     let matchingBlock = blocks.filter(block => block.includes(letters[i].toUpperCase()))[0];

//     if (matchingBlock === undefined) {
//       return false;
//     } else {
//       blocks.splice(blocks.indexOf(matchingBlock), 1);
//     }
//   }

//   return true;
// }

// 2) - Launch School solution #2:
// function isBlockWord(word) {
//   const blocks = ['B:O', 'X:K', 'D:Q', 'C:P', 'N:A', 'G:T', 'R:E', 'F:S', 'J:W', 'H:U', 'V:I', 'L:Y', 'Z:M'];
//   const regExps = blocks.map(block => new RegExp(block.replace(':', '|'), 'gi'));

//   return regExps.every(regExp => (word.match(regExp) || []).length < 2);
// }
