function dateSuffix(date) {
  let dateString = String(date);

  if (dateString[0] === 1 && dateString.length === 2) return dateString + 'th';
  
  let suffix;
  switch (date % 10) {
    case 1:
      suffix = 'st';
      break;
    case 2:
      suffix = 'nd';
      break;
    case 3:
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
let day = dateSuffix(today.getDate());

let month = today.getMonth();

console.log(`Today's day is ${daysOfWeek[dayIndex]}, ${month} ${day}`);


// ALTERNATIVE SOLUTIONS:

// 1 - LS Solution:
// console.log("Today's date is " + daysOfWeek[today.getDay()] + ', ' +
//                                  String(today.getMonth()) + ' ' +
//                                  dateSuffix(today.getDate()));

// 2 - Another solution for exporation purposes (combination of mine and the LS solution above):
// function dateSuffix(date) {
//   let dateString = String(date);

//   let digit;
//   if (dateString.length === 1 || dateString[0] !== '1') {
//     digit = dateString[dateString.length - 1];
//   }
  
//   let suffix;
//   switch (digit) {
//     case '1':
//       suffix = 'st';
//       break;
//     case '2':
//       suffix = 'nd';
//       break;
//     case '3':
//       suffix = 'rd';
//       break;
//     default:
//       suffix = 'th';
//   }

//   return dateString + suffix;
// }
