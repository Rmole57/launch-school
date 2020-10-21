function dateSuffix(date) {
  let dateString = String(date);

  let digit;
  if (dateString.length === 1 || dateString[0] !== '1') {
    digit = dateString[dateString.length - 1];
  }
  
  let suffix;
  switch (digit) {
    case '1':
      suffix = 'st';
      break;
    case '2':
      suffix = 'nd';
      break;
    case '3':
      suffix = 'rd';
      break;
    default:
      suffix = 'th';
  }

  return dateString + suffix;
}

let today = new Date();
let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
let dayIndex = today.getDay();
let date = dateSuffix(today.getDate());

console.log(`Today's day is ${daysOfWeek[dayIndex]}, the ${date}`);


// ALTERNATIVE SOLUTION:

// function dateSuffix(date) {
//   let dateString = String(date);

//   let digit;
//   if (dateString.length === 1 ) {
//     digit = dateString[0];
//   } else if (dateString[0] !== '1') {
//     digit = dateString[1];
//   }

//   let suffix = 'th';
//   if (digit === '1') {
//     suffix = 'st';
//   } else if (digit === '2') {
//     suffix = 'nd';
//   } else if (digit === '3') {
//     suffix = 'rd';
//   }

//   return String(date) + suffix;
// }

// console.log("Today's date is " + daysOfWeek[today.getDay()] + ', the ' + dateSuffix(today.getDate()));
