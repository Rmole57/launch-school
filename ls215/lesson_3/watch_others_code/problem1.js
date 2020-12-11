"use strict";

function formatPhoneNumber(numberString) {
  let digitsOnly = numberString.replace(/\D/g, '');

  if (digitsOnly.length === 10) return digitsOnly;

  if (digitsOnly.length === 11 && digitsOnly.startsWith('1')) {
    return digitsOnly.slice(1);
  }

  return '0000000000';
}

// 10 digits (no special characters):
console.log(formatPhoneNumber('5557148899'));              // 5557148899
console.log(formatPhoneNumber('1234567891'));              // 1234567891

// 10 digits (with non-digit characters)
console.log(formatPhoneNumber('(555)714-8899'));           // 5557148899
console.log(formatPhoneNumber('555 714 8899'));            // 5557148899
console.log(formatPhoneNumber('555.543.1122'));            // 5555431122
console.log(formatPhoneNumber('^$I@555 714 8absd**899'));  // 5557148899

// 11 digits (with 1 starting):
console.log(formatPhoneNumber('1(555)714-8899'));          // 5557148899
console.log(formatPhoneNumber('12345678912'));             // 2345678912

// 11 digits (without 1 starting):
console.log(formatPhoneNumber('23456789123'));             // 0000000000

// Less than 10 digits:
console.log(formatPhoneNumber('5557149'));                 // 0000000000
console.log(formatPhoneNumber('12345abcde'));              // 0000000000

// More than 10 digits:
console.log(formatPhoneNumber('1234567891234'));           // 0000000000

// Empty string:
console.log(formatPhoneNumber(''));                        // 0000000000
