function makeList() {
  let todos = [];

  return function (todo) {
    if (todo === undefined) {
      if (todos.length === 0) {
        console.log('The list is empty.');
      } else {
        todos.forEach(todo => console.log(todo));
      }
    } else {
      if (todos.includes(todo)) {
        let removeIndex = todos.indexOf(todo);
        todos.splice(removeIndex, 1);
        console.log(`${todo} removed!`);
      } else {
        todos.push(todo);
        console.log(`${todo} added!`);
      }
    }
  };
}

let list = makeList();

list();
// logs:
// The list is empty.

list('make breakfast');
// logs:
// make breakfast added!

list('read book');
// logs:
// read book added!

list();
// logs:
// make breakfast
// read book

list('make breakfast');
// logs:
// make breakfast removed!

list();
// logs:
// read book


// ALTERNATIVE SOLUTION:

// function makeList() {
//   let items = [];

//   return function(newItem) {
//     let index;
//     if (newItem) {
//       index = items.indexOf(newItem);
//       if (index === -1) {
//         items.push(newItem);
//         console.log(newItem + ' added!');
//       } else {
//         items.splice(index, 1);
//         console.log(newItem + ' removed!');
//       }
//     } else {
//       if (items.length === 0) {
//         console.log('The list is empty.');
//       } else {
//         items.forEach(function(item) {
//           console.log(item);
//         });
//       }
//     }
//   };
// }
