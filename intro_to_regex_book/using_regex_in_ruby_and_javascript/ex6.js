function formatDate(dateString) {
  return dateString.replace(/^(\d{4})-(\d{2})-(\d{2})$/, '$3.$2.$1');
}

console.log(formatDate('2016-06-17')); // -> '17.06.2016'
console.log(formatDate('2016/06/17')); // -> '2016/06/17' (no change)


// ALTERNATIVE SOLUTION:

// let formatDate = function (original_date) {
//   return original_date.replace(/^(\d\d\d\d)-(\d\d)-(\d\d)$/, '$3.$2.$1');
// };
