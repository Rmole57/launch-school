let apples = 3;
let bananas = '3';

if (apples === bananas) {
  console.log('Strictly Equal!');
} else {
  if (apples == bananas) {
    console.log('Same value, but different types!');
  } else {
    console.log('Not strictly equal!');
  }
}

let areEqual = apples === bananas;
console.log(areEqual);

bananas = undefined;
let eitherOr = apples || bananas;
console.log(eitherOr);

bananas = 1;
eitherOr = apples || bananas;
console.log(eitherOr);

eitherOr = bananas || apples;
console.log(eitherOr);

let lastName = 'Mole';
let familyMessage = lastName === 'Mole' ? "You're part of the family!" : "You're not family.";
console.log(familyMessage);
