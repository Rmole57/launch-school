function incrementProperty(obj, propertyName) {
  if (obj[propertyName]) {
    obj[propertyName] += 1;
  } else {
    obj[propertyName] = 1;
  }

  return obj[propertyName];
}

let wins = {
  steve: 3,
  susie: 4,
};

console.log(incrementProperty(wins, 'susie'));   // 5
console.log(wins);                               // { steve: 3, susie: 5 }
console.log(incrementProperty(wins, 'lucy'));    // 1
console.log(wins);                               // { steve: 3, susie: 5, lucy: 1 }
