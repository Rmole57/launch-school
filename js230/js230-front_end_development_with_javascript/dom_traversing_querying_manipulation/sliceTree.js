function sliceTree(start, end) {
  const startElement = document.getElementById(start);
  let endElement = document.getElementById(end);

  if (isInBody(startElement) && startElement.contains(endElement)) {
    const slicedTree = [];

    while (endElement !== startElement.parentNode) {
      slicedTree.unshift(endElement.tagName);
      endElement = endElement.parentNode;
    }

    return slicedTree;
  }
}

function isInBody(element) {
  return element !== document.body && document.body.contains(element);
}

console.log(sliceTree(1, 4));    // ["ARTICLE", "HEADER", "SPAN", "A"]
console.log(sliceTree(1, 76));   // undefined
console.log(sliceTree(2, 5));    // undefined
console.log(sliceTree(5, 4));    // undefined
console.log(sliceTree(1, 23));   // ["ARTICLE", "FOOTER"]
console.log(sliceTree(1, 22));   // ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
console.log(sliceTree(11, 19));  // ["SECTION", "P", "SPAN", "STRONG", "A"]
console.log(sliceTree(1, 1));    // ["ARTICLE"]


// ALTERNATIVE SOLUTION:

// function sliceTree(start, end) {
//   let endElement = document.getElementById(end);
//   const startElement = document.getElementById(start);

//   if (!startElement || !endElement) {
//     return undefined;
//   }

//   const slicedTree = [];
//   let currentElement;

//   do {
//     currentElement = endElement;
//     slicedTree.unshift(currentElement.tagName);
//     endElement = endElement.parentNode;
//   } while (currentElement.id !== String(start) && endElement.tagName !== 'BODY');

//   return (endElement.tagName === 'BODY' && currentElement.id !== String(start) ? undefined : slicedTree);
// }
