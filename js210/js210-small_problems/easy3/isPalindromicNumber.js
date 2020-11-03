function isPalindromicNumber(number) {
  return isPalindrome(String(number));
}

function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

console.log(isPalindromicNumber(34543));        // true
console.log(isPalindromicNumber(123210));       // false
console.log(isPalindromicNumber(22));           // true
console.log(isPalindromicNumber(5));            // true


// FURTHER EXPLORATION:

// Leading zeros won't work because JavaScript will either treat the number
// as an octal number, or if the number contains an 8 or a 9, JavaScript will
// automatically remove the leading 0's. The only way to really preserve any
// leading zeros is to pass in a String rather than a Number.
