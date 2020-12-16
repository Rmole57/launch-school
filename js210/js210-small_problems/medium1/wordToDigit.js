"use strict";

function wordToDigit(sentence) {
  const NUMBER_WORDS = ['zero', 'one', 'two', 'three', 'four',
                        'five', 'six', 'seven', 'eight', 'nine'];

  return sentence.replace(/[a-z]+/gi, match => {
    let matchLower = match.toLowerCase();

    if (NUMBER_WORDS.includes(matchLower)) {
      return String(NUMBER_WORDS.indexOf(matchLower));
    }

    return match;
  });
}

console.log(wordToDigit('five four three two one.'));
// "5 4 3 2 1."

console.log(wordToDigit('Please call me at Five five five One two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."

console.log(wordToDigit('The weight is done.'));
// "The weight is done."


// ALTERNATIVE SOLUTION:

// const NUM_WORDS = {
//   zero:  0,
//   one:   1,
//   two:   2,
//   three: 3,
//   four:  4,
//   five:  5,
//   six:   6,
//   seven: 7,
//   eight: 8,
//   nine:  9,
// };

// function wordToDigit(sentence) {
//   Object.keys(NUM_WORDS).forEach(word => {
//     let regex = new RegExp(`\\b${word}\\b`, 'g');
//     sentence = sentence.replace(regex, NUM_WORDS[word]);
//   });

//   return sentence;
// }


// FURTHER EXPLORATION:

// 1) - See original solution!

// 2) - Solution inspired by a classmate's implementation:
// function wordToDigit(sentence) {
//   const NUM_WORD_REGEX = /\b(zero|one|two|three|four|five|six|seven|eight|nine)\b/gi;
//   const NUMBER_WORDS = ['zero', 'one', 'two', 'three', 'four',
//                         'five', 'six', 'seven', 'eight', 'nine'];

//   return sentence.replace(NUM_WORD_REGEX, match => NUMBER_WORDS.indexOf(match.toLowerCase()));
// }
