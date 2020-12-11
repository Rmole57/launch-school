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
