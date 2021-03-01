function nodeSwap(id1, id2) {
  const node1 = document.getElementById(id1);
  const node2 = document.getElementById(id2);

  if (isValidSwap(node1, node2)) {
    const node1Clone = node1.cloneNode(true);
    const node2Clone = node2.cloneNode(true);

    node1.parentNode.replaceChild(node2Clone, node1);
    node2.parentNode.replaceChild(node1Clone, node2);
    return true;
  }
}

function isValidSwap(node1, node2) {
  return ((node1 && node2) &&
         !node1.contains(node2) &&
         !node2.contains(node1));
}

console.log(nodeSwap(1, 20));  // undefined
console.log(nodeSwap(1, 4));   // undefined
console.log(nodeSwap(9, 3));   // undefined
console.log(nodeSwap(1, 2));   // true
console.log(nodeSwap(8, 1));   // true
console.log(nodeSwap(6, 9));   // true


// FURTHER EXPLORATION:

// function nodeSwap(id1, id2) {
//   const node1 = document.getElementById(id1);
//   const node2 = document.getElementById(id2);

//   if (isValidSwap(node1, node2)) {
//     const node2NextSibling = node2.nextSibling;

//     const node1parent = node1.parentNode;
//     const node2parent = node2.parentNode;

//     node1parent.insertBefore(node2, node1);
//     node2parent.insertBefore(node1, node2NextSibling);
//     return true;
//   }
// }
