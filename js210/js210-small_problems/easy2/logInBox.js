function logInBox(text) {
  const BOX_WIDTH = text.length + 2;

  const BORDER = `+${'-'.repeat(BOX_WIDTH)}+`;
  const EMPTY_LINE = `|${' '.repeat(BOX_WIDTH)}|`;

  let message = `| ${text} |`;

  console.log(BORDER);
  console.log(EMPTY_LINE);
  console.log(message);
  console.log(EMPTY_LINE);
  console.log(BORDER);
}

logInBox('To boldly go where no one has gone before.');
logInBox('');

// ALTERNATIVE SOLUTION:

// function logInBox(message) {
//   const horizontalRule = `+${repeatChar('-', message.length + 2)}+`;
//   const emptyLine = `|${repeatChar(' ', message.length + 2)}|`;

//   console.log(horizontalRule);
//   console.log(emptyLine);
//   console.log(`| ${message} |`);
//   console.log(emptyLine);
//   console.log(horizontalRule);
// }

// function repeatChar(char, times) {
//   let repeated = '';
//   while (repeated.length < times) {
//     repeated += char;
//   }

//   return repeated;
// }

// FURTHER EXPLORATION:

// function logInBox(text, width) {
//   const BOX_WIDTH = (!width || width > text.length + 2) ? text.length + 2 : width;

//   const BORDER = `+${'-'.repeat(BOX_WIDTH)}+`;
//   const EMPTY_LINE = `|${' '.repeat(BOX_WIDTH)}|`;

//   let message = text ? wrap(text, BOX_WIDTH) : EMPTY_LINE;

//   console.log(BORDER);
//   console.log(EMPTY_LINE);
//   console.log(message);
//   console.log(EMPTY_LINE);
//   console.log(BORDER);
// }

// function wrap(text, width) { 
//   const TEXT_WIDTH = width - 2;

//   let wrappedText = [];
//   for (let startIndex = 0; startIndex < text.length; startIndex += TEXT_WIDTH) {
//     let endIndex = startIndex + TEXT_WIDTH;
//     let textLine = text.substring(startIndex, endIndex);
//     let extraPadding = ' '.repeat(TEXT_WIDTH - textLine.length);

//     wrappedText.push(`| ${textLine + extraPadding} |`);
//   }

//   return wrappedText.join('\n');
// }

// logInBox('To boldly go where no one has gone before.', 15);
// logInBox('To boldly go where no one has gone before.', 80);
// logInBox('', 10);
// logInBox('To boldly go where no one has gone before.');
// logInBox('');
