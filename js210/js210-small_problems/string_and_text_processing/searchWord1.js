function searchWord(word, text) {
  const searchRegex = new RegExp(word, 'ig');
  const matches = text.match(searchRegex);

  return matches ? matches.length : 0;
}

const text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

console.log(searchWord('sed', text));      // 3


// FURTHER EXPLORATION:

// function searchWord(word, text) {
//   if (typeof word !== 'string' || typeof text !== 'string') return 0;

//   const searchRegex = new RegExp(`\\b${word}\\b`, 'ig');
//   const matches = text.match(searchRegex) || '';

//   return matches.length;
// }

// console.log(searchWord('qui', text));       // should return 4, NOT 13
// console.log(searchWord('hello'));           // 0 (missing second argument)
// console.log(searchWord(3, '3 words'));      // 0 (first argument is not a string)
// console.log(searchWord());                  // 0 (missing both arguments)
