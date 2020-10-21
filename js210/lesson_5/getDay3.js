let today = new Date();
let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
let dayIndex = today.getDay();
let date = today.getDate();

console.log(`Today's day is ${daysOfWeek[dayIndex]}, the ${date}th`);


// ALTERNATIVE SOLUTION:

// console.log("Today's date is " + daysOfWeek[today.getDay()] + ', the ' + String(today.getDate()) + 'th');
