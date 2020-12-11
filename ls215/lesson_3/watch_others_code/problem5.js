"use strict";

function railEncode(message, railAmount) {
  let lettersOnly = message.match(/[a-z]/gi) || [];
  if (railAmount > lettersOnly.length || railAmount === 1) return message;
  return buildRails(lettersOnly, railAmount).flat().join('');
}

function railDecode(cipher, railAmount) {
  if (railAmount > cipher.length || railAmount === 1) return cipher;

  let cipherLetters = cipher.split('');
  let rails = buildRails(new Array(cipher.length).fill('?'), railAmount);

  rails.forEach(subarray => {
    for (let index = 0; index < subarray.length; index += 1) {
      subarray[index] = cipherLetters.shift();
    }
  });

  return buildMessageFromRails(rails, railAmount);
}

function buildRails(charsArray, railAmount) {
  let rails = [];
  let railIndex = 0;
  let ascendStatus = true;

  charsArray.forEach(char => {
    if (!rails[railIndex]) rails[railIndex] = [];

    rails[railIndex].push(char);

    ascendStatus = adjustAscendStatus(ascendStatus, railIndex, railAmount);
    railIndex = ascendStatus ? railIndex + 1 : railIndex - 1;
  });

  return rails;
}

function buildMessageFromRails(rails, railAmount) {
  let message = '';
  let railIndex = 0;
  let ascendStatus = true;

  while (!rails.every(arrayEmpty)) {
    message += rails[railIndex].shift();
    ascendStatus = adjustAscendStatus(ascendStatus, railIndex, railAmount);
    railIndex = ascendStatus ? railIndex + 1 : railIndex - 1;
  }

  return message;
}

function adjustAscendStatus(currentStatus, railIndex, railAmount) {
  let highRailIndex = railAmount - 1;

  if (railIndex === 0) return true;
  if (railIndex === highRailIndex) return false;
  return currentStatus;
}

function arrayEmpty(array) {
  return Object.keys(array).length === 0;
}

// ======= ENCODE TEST CASES =======

console.log(railEncode('XOXOXOXOXOXOXOXOXO', 2));         // 'XXXXXXXXXOOOOOOOOO'
console.log(railEncode('WEAREDISCOVEREDFLEEATONCE', 3));  // 'WECRLTEERDSOEEFEAOCAIVDEN'
console.log(railEncode('EXERCISES', 4));                  // 'ESXIEECSR'

// edge cases:
console.log(railEncode('', 4));                         // ''
console.log(railEncode('One rail, only one rail', 1));  // 'One rail, only one rail'
console.log(railEncode('More rails than letters', 24)); // 'More rails than letters'


// ======= DECODE TEST CASES =======

console.log(railDecode('XXXXXXXXXOOOOOOOOO', 2));         // 'XOXOXOXOXOXOXOXOXO'
console.log(railDecode('TEITELHDVLSNHDTISEIIEA', 3));     // 'THEDEVILISINTHEDETAILS'
console.log(railDecode('WECRLTEERDSOEEFEAOCAIVDEN', 3));  // 'WEAREDISCOVEREDFLEEATONCE'

// edge cases:
console.log(railDecode('', 4));                         // ''
console.log(railDecode('One rail, only one rail', 1));  // 'One rail, only one rail'
console.log(railDecode('More rails than letters', 24)); // 'More rails than letters'
