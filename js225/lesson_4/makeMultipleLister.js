function makeMultipleLister(number) {
  return function () {
    for (let multiple = number; multiple < 100; multiple += number) {
      console.log(multiple);
    }
  };
}

let lister = makeMultipleLister(13);
lister();
// logs:
// 13
// 26
// 39
// 52
// 65
// 78
// 91
