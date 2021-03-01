// FURTHER EXPLORATION:

function childNodes(id) {
  let parent = document.getElementById(String(id));
  let directChildren = parent.childNodes;
  let allChildren = [];

  for (let index = 0; index < directChildren.length; index += 1) {
    walk(directChildren[index], node => allChildren.push(node));
  }

  return [directChildren.length, allChildren.length - directChildren.length];
}

function walk(node, callback) {
  callback(node);
  for (let index = 0; index < node.childNodes.length; index += 1) {
    walk(node.childNodes[index], callback);
  }
}

console.log(childNodes(1));   // [9, 12]
console.log(childNodes(2));   // [2, 1]
console.log(childNodes(3));   // [1, 0]
console.log(childNodes(4));   // [3, 1]
console.log(childNodes(5));   // [1, 0]
console.log(childNodes(6));   // [1, 1]
console.log(childNodes(7));   // [1, 0]
console.log(childNodes(8));   // [1, 2]
console.log(childNodes(9));   // [1, 1]
console.log(childNodes(10));  // [1, 0]


// ALTERNATIVE FURTHER EXPLORATION SOLUTIONS:

// 1)
// function childNodes(id) {
//   let parent = document.getElementById(String(id));
//   let directChildren = parent.childNodes;
//   let directCount = directChildren.length;
//   let fullCount = 0;

//   for (let index = 0; index < directCount; index += 1) {
//     walk(directChildren[index], () => fullCount += 1);
//   }

//   return [directCount, fullCount - directCount];
// }

// 2)
// function childNodes(id) {
//   let parent = document.getElementById(String(id));
//   let directChildren = parent.childNodes;
//   let directCount = directChildren.length;
//   let indirectCount = 0;

//   for (let index = 0; index < directCount; index += 1) {
//     walk(directChildren[index], (node) => indirectCount += node.childNodes.length);
//   }

//   return [directCount, indirectCount];
// }
