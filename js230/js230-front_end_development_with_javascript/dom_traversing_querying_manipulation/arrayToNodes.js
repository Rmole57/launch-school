function arrayToNodes([nodeName, children]) {
  let element = document.createElement(nodeName);
  children.forEach(child => element.appendChild(arrayToNodes(child)));
  return element;
}

const nodes1 = ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]];
const nodes2 = ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]];

console.log(arrayToNodes(nodes1));
console.log(arrayToNodes(nodes2));


// ALTERNATIVE SOLUTION:

// function arrayToNodes(nodes) {
//   const parent = document.createElement(nodes[0]);
//   const children = nodes[1];

//   if (children.length === 0) {
//     return parent;
//   } else {
//     for (let i = 0; i < children.length; i += 1) {
//       parent.appendChild(arrayToNodes(children[i]));
//     }
//   }

//   return parent;
// }
