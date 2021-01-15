function makeCounterLogger(start) {
  return function (end) {
    if (start > end) {
      for (let count = start; count >= end; count -= 1) {
        console.log(count);
      }
    } else {
      for (let count = start; count <= end; count += 1) {
        console.log(count);
      }
    }
  };
}

let countlog = makeCounterLogger(5);
countlog(8);
// logs:
// 5
// 6
// 7
// 8

countlog(2);
// logs:
// 5
// 4
// 3
// 2
