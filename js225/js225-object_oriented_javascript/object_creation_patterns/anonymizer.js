const Account = (() => {
  let userEmail;
  let userPassword;
  let userFirstName;
  let userLastName;

  function isValidPassword(testPassword) {
    return userPassword === testPassword;
  }

  function getRandomLetter() {
    const randomIndex = Math.floor(Math.random() * 62);
    return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'[randomIndex];
  }

  function anonymize() {
    let result = '';

    for (let i = 0; i < 16; i += 1) {
      result += getRandomLetter();
    }

    return result;
  }

  return {
    init(email, password, firstName, lastName) {
      userEmail = email;
      userPassword = password;
      userFirstName = firstName;
      userLastName = lastName;
      this.displayName = anonymize();

      return this;
    },

    email(testPassword) {
      if (isValidPassword(testPassword)) {
        return userEmail;
      }

      return 'Invalid Password';
    },

    firstName(testPassword) {
      if (isValidPassword(testPassword)) {
        return userFirstName;
      }

      return 'Invalid Password';
    },

    lastName(testPassword) {
      if (isValidPassword(testPassword)) {
        return userLastName;
      }

      return 'Invalid Password';
    },

    reanonymize(testPassword) {
      if (isValidPassword(testPassword)) {
        this.displayName = anonymize();
        return true;
      }

      return 'Invalid Password';
    },

    resetPassword(testPassword, newPassword) {
      if (isValidPassword(testPassword)) {
        userPassword = newPassword;
        return true;
      }

      return 'Invalid Password';
    },
  };
})();

const fooBar = Object.create(Account).init('foo@bar.com', '123456', 'foo', 'bar');
console.log(fooBar.firstName);                     // logs the firstName function
console.log(fooBar.email);                         // logs the email function
console.log(fooBar.firstName('123456'));           // logs 'foo'
console.log(fooBar.firstName('abc'));              // logs 'Invalid Password'
console.log(fooBar.displayName);                   // logs 16 character sequence
console.log(fooBar.resetPassword('123', 'abc'))    // logs 'Invalid Password';
console.log(fooBar.resetPassword('123456', 'abc')) // logs true

const displayName = fooBar.displayName;
console.log(fooBar.reanonymize('abc'));            // logs true
console.log(displayName === fooBar.displayName);   // logs false


// FURTHER EXPLORATION:

// const Account = (() => {
//   const usersData = {};

//   function getUserData(user) {
//     return usersData[user.displayName];
//   }

//   function isValidPassword(userPassword, testPassword) {
//     return userPassword === testPassword;
//   }

//   function getRandomLetter() {
//     const randomIndex = Math.floor(Math.random() * 62);
//     return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'[randomIndex];
//   }

//   function anonymize() {
//     let result = '';

//     for (let i = 0; i < 16; i += 1) {
//       result += getRandomLetter();
//     }

//     return result;
//   }

//   return {
//     init(email, password, firstName, lastName) {
//       this.displayName = anonymize();

//       usersData[this.displayName] = {
//         email,
//         password,
//         firstName,
//         lastName
//       };

//       return this;
//     },

//     email(testPassword) {
//       let userData = getUserData(this);

//       if (isValidPassword(userData.password, testPassword)) {
//         return userData.email;
//       }

//       return 'Invalid Password';
//     },

//     firstName(testPassword) {
//       let userData = getUserData(this);

//       if (isValidPassword(userData.password, testPassword)) {
//         return userData.firstName;
//       }

//       return 'Invalid Password';
//     },

//     lastName(testPassword) {
//       let userData = getUserData(this);

//       if (isValidPassword(userData.password, testPassword)) {
//         return userData.lastName;
//       }

//       return 'Invalid Password';
//     },

//     reanonymize(testPassword) {
//       let userData = getUserData(this);

//       if (isValidPassword(userData.password, testPassword)) {
//         let oldDisplayName = this.displayName;
//         this.displayName = anonymize();
//         usersData[this.displayName] = userData;
//         delete usersData[oldDisplayName];
//         return true;
//       }

//       return 'Invalid Password';
//     },

//     resetPassword(testPassword, newPassword) {
//       let userData = getUserData(this);

//       if (isValidPassword(userData.password, testPassword)) {
//         userData.password = newPassword;
//         return true;
//       }

//       return 'Invalid Password';
//     },
//   };
// })();

// const fooBar = Object.create(Account).init('foo@bar.com', '123456', 'foo', 'bar');
// console.log(fooBar.firstName);                     // returns the firstName function
// console.log(fooBar.email);                         // returns the email function
// console.log(fooBar.firstName('123456'));           // logs 'foo'
// console.log(fooBar.firstName('abc'));              // logs 'Invalid Password'
// console.log(fooBar.displayName);                   // logs 16 character sequence
// console.log(fooBar.resetPassword('123', 'abc'))    // logs 'Invalid Password';
// console.log(fooBar.resetPassword('123456', 'abc')) // logs true

// const displayName = fooBar.displayName;
// console.log(fooBar.reanonymize('abc'));            // logs true
// console.log(displayName === fooBar.displayName);   // logs false

// const bazQux = Object.create(Account).init('baz@qux.com', '123456', 'baz', 'qux');
// console.log(fooBar.firstName('abc'));              // should log foo
// console.log(fooBar.email('abc'));                  // should log 'foo@bar.com'
