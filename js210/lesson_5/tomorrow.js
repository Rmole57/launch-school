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

function formattedMonth(date) {
  let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[date.getMonth()];
}

function formattedDay(date) {
  let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return daysOfWeek[date.getDay()];
}

function formattedDate(date) {
  let day = formattedDay(date);
  let month = formattedMonth(date);

  console.log(`Today's day is ${day}, ${month} ${dateSuffix(date.getDate())}`);
}

let today = new Date();
let tomorrow = new Date(today.getTime());

tomorrow.setDate(tomorrow.getDate() + 1);
formattedDate(tomorrow);


// ALTERNATIVE SOLUTION:

// let tomorrow = new Date(today.getTime());

// tomorrow.setDate(today.getDate() + 1);
// formattedDate(tomorrow);
