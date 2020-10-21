function formatTime(date) {
  let hourString = addZero(String(date.getHours()));
  let minutesString = addZero(String(date.getMinutes()));

  return `${hourString}:${minutesString}`
}

function addZero(value) {
  return value.padStart(2, '0');
}

let today = new Date();

console.log(formatTime(today));
console.log(formatTime(new Date(2013, 2, 1, 1, 10)));


// ALTERNATIVE SOLUTION:

// function formatTime(date) {
//   return addZero(date.getHours()) + ':' + addZero(date.getMinutes());
// }

// function addZero(value) {
//   let timeComponent = String(value);
//   return timeComponent.length < 2 ? '0' + timeComponent : timeComponent;
// }
