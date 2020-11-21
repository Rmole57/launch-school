function myMap(array, func) {
  let newArray = [];
  array.forEach(value => newArray.push(func(value)));
  return newArray;
}

function getBooksTitle(books) {
  return myMap(books, getTitle);
}

let books = [
  {
    title: 'JavaScript and JQuery: Interactive Front-End Web Development',
    author: 'Jon Ducket',
    edition: '1st',
  },
  {
    title: 'Eloquent JavaScript: A Modern Introduction to Programming',
    author: 'Haverbeke',
    edition: '2nd',
  },
  {
    title: "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics",
    author: 'Jennifer Niederst Robbins',
    edition: '4th',
  },
];

function getTitle(book) {
  return book['title'];
}

console.log(getBooksTitle(books));
// console output:
// [
//   "JavaScript and JQuery: Interactive Front-End Web Development",
//   "Eloquent JavaScript: A Modern Introduction to Programming",
//   "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics"
// ]


// ALTERNATIVE SOLUTION:

// Using inline style:
// function getBooksTitle(books) {
//   return myMap(books, function (book) {
//     return book['title'];
//   });
// }
