"use strict";

function minilang(program) {
  let stack = [];
  let register = 0;

  program.split(' ').forEach(token => {
    switch (token) {
      case 'ADD':
        register += stack.pop();
        break;
      case 'SUB':
        register -= stack.pop();
        break;
      case 'MULT':
        register *= stack.pop();
        break;
      case 'DIV':
        register = Math.floor(register / stack.pop());
        break;
      case 'MOD':
        register = Math.floor(register % stack.pop());
        break;
      case 'PUSH':
        stack.push(register);
        break;
      case 'POP':
        register = stack.pop();
        break;
      case 'PRINT':
        console.log(register);
        break;
      default:
        register = parseInt(token, 10);
    }
  });
}

minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)


// FURTHER EXPLORATION:

// function minilang(program) {
//   let stack = [];
//   let register = 0;

//   program.split(' ').forEach(token => {
//     if (!isValidToken(token)) throw `Sorry, ${token} is an invalid token!`;

//     if (!isValidStackOperation(token, stack)) {
//       throw `Cannot perform ${token} operation on an empty stack!`;
//     }

//     switch (token) {
//       case 'ADD':
//         register += stack.pop();
//         break;
//       case 'SUB':
//         register -= stack.pop();
//         break;
//       case 'MULT':
//         register *= stack.pop();
//         break;
//       case 'DIV':
//         register = Math.floor(register / stack.pop());
//         break;
//       case 'MOD':
//         register = Math.floor(register % stack.pop());
//         break;
//       case 'PUSH':
//         stack.push(register);
//         break;
//       case 'POP':
//         register = stack.pop();
//         break;
//       case 'PRINT':
//         console.log(register);
//         break;
//       default:
//         register = parseInt(token, 10);
//     }
//   });
// }

// function isValidToken(token) {
//   const VALID_COMMANDS = ['ADD', 'SUB', 'MULT', 'DIV', 'MOD',
//                           'POP', 'PUSH', 'PRINT'];

//   return VALID_COMMANDS.includes(token) || /-?\d+/.test(token);
// }

// function isValidStackOperation(operation, stack) {
//   const OPERATIONS = ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP'];
//   return !(OPERATIONS.includes(operation) && stack.length === 0);
// }

// minilang('3 YOU POP PRINT POP 5 PRINT');
// throws error => Sorry, YOU is an invalid token!

// minilang('3 PUSH POP PRINT POP 5 PRINT');
// throws error => Cannot perform POP operation on an empty stack!
