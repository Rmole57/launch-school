function nodesToArr() {
  const nodesArray = ['BODY', formatNodes(document.body.children)];
  let currentParentNodes = nodesArray[1];

  while (currentParentNodes.some(([node]) => node.children.length > 0)) {
    convertToArr(currentParentNodes);
    currentParentNodes = getNextGeneration(currentParentNodes);
  }

  convertToArr(currentParentNodes);
  return nodesArray;
}

function formatNodes(nodes) {
  return Array.from(nodes).map(node => [node]);
}

function convertToArr(parentNodes) {
  parentNodes.forEach(parentElement => {
    let node = parentElement[0];
    parentElement[0] = node.tagName;
    parentElement.push(formatNodes(node.children));
  });
}

function getNextGeneration(parentNodes) {
  return parentNodes.reduce((collection, node) => {
    return collection.concat(node[1]);
  }, []);
}

nodesToArr();


// ALTERNATIVE SOLUTIONS:

// 1) - Launch School solution:
// function nodesToArr() {
//   const nodesArray = ['BODY', formatNodes(Array.prototype.slice.call(document.body.children))];
//   let currentParentNodes = nodesArray[1];

//   while (anyChildren(currentParentNodes)) {
//     currentParentNodes = getNextGenerationParents(currentParentNodes);
//   }

//   getNextGenerationParents(currentParentNodes);

//   return nodesArray;
// }

// function getNextGenerationParents(currentParentNodes) {
//   let newParentNodes = [];
//   currentParentNodes.forEach((parentNode, index, parentNodes) => {
//     parentNodes[index] = appendChildren(parentNode);
//     if (parentNodes[index][1].length > 0) {
//       newParentNodes = newParentNodes.concat(parentNodes[index][1]);
//     }
//   });

//   return newParentNodes;
// }

// function anyChildren(parentNodes) {
//   for (let i = 0; i < parentNodes.length; i += 1) {
//     if (parentNodes[i][0].children.length > 0) {
//       return true;
//     }
//   }

//   return false;
// }

// function appendChildren(parentNode) {
//   const children = formatNodes(Array.prototype.slice.call(parentNode[0].children));
//   parentNode[0] = parentNode[0].tagName;
//   parentNode.push(children);
//   return parentNode;
// }

// function formatNodes(nodes) {
//   return nodes.map(node => [node]);
// }

// 2) - Recursive solution:
// function nodesToArr(node = document.body) {
//   return [node.tagName, [...node.children].map(nodesToArr)];
// }
