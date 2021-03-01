function domTreeTracer(id) {
  let element = document.getElementById(id);
  let parent = element.parentElement;

  if (parent.tagName === 'BODY') {
    return [[element.tagName]];
  }
  
  let siblingNames = Array.from(parent.children).map(sibling => sibling.tagName);

  return [siblingNames].concat(domTreeTracer(parent.getAttribute('id')));
}

console.log(domTreeTracer(1));   // [["ARTICLE"]]
console.log(domTreeTracer(2));   // [["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
console.log(domTreeTracer(22));  //[["A"], ["STRONG"], ["SPAN", "SPAN"], ["P", "P"], ["SECTION", "SECTION"], ["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]


// ALTERNATIVE SOLUTION:

// function domTreeTracer(id) {
//   let currentElement = document.getElementById(id);
//   let parentElement;
//   const domTree = [];

//   do {
//     parentElement = currentElement.parentNode;
//     let children = getTagNames(parentElement.children);
//     domTree.push(children);

//     currentElement = parentElement;
//   } while (parentElement.tagName !== 'BODY');

//   return domTree;
// }

// function getTagNames(htmlCollection) {
//   const elementsArray = Array.from(htmlCollection);
//   return elementsArray.map(({tagName}) => tagName);
// }
