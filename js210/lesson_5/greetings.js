function greetings(name, status) {
  let fullName = name.join(' ');
  let fullStatus = `${status.title} ${status.occupation}`

  console.log(`Hello ${fullName}! Nice to have a ${fullStatus} around.`);
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// console output
// Hello, John Q Doe! Nice to have a Master Plumber around.


// ALTERNATIVE SOLUTION:

// function greetings(name, status) {
//   let nameGreet = 'Hello, ' + name.join(' ') + '!';
//   let statusGreet = 'Nice to have a ' + status.title + ' ' + status.occupation + ' around.';

//   console.log(nameGreet + ' ' + statusGreet);
// }
