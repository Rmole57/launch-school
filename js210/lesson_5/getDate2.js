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

let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
let monthIndex = today.getMonth();
let month = months[monthIndex];

console.log(`Today's day is ${daysOfWeek[dayIndex]}, ${month} ${day}`);


// ALTERNATIVE SOLUTION:

// console.log("Today's date is " + daysOfWeek[today.getDay()] + ', ' +
//                                  months[today.getMonth()] + ' ' +
//                                  dateSuffix(today.getDate()));
