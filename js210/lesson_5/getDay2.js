let today = new Date();
let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
let dayIndex = today.getDay();

console.log(`Today's day is ${daysOfWeek[dayIndex]}`);


// ALTERNATIVE SOLUTION:

// console.log("Today's day is " + daysOfWeek[today.getDay()]);
