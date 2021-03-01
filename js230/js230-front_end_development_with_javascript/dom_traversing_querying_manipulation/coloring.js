function colorGeneration(targetGen) {
  if (targetGen < 1) return;

  let genElements = [document.body];

  for (let currGen = 0; currGen < targetGen; currGen += 1) {
    genElements = genElements.reduce((collection, {children}) => {
      return collection.concat(Array.from(children));
    }, []);
  }

  genElements.forEach(({classList}) => {
    classList.add('generation-color');
  });
  
}

colorGeneration(1);
colorGeneration(4);
colorGeneration(7);
colorGeneration(8);
colorGeneration(3);
colorGeneration(0);


// ALTERNATIVE SOLUTION:

// function colorGeneration(targetGeneration) {
//   let generation = 0;
//   let parents = [document.body];
//   let elements;

//   while (generation < targetGeneration) {
//     generation += 1;
//     elements = getAllChildrenOf(parents);
//     parents = elements;
//   }

//   if (elements) {
//     color(elements);
//   }
// }

// function color(elements) {
//   elements.forEach(({classList}) => {
//     classList.add("generation-color");
//   });
// }

// function getAllChildrenOf(parents) {
//   return parents.map(({children}) => Array.prototype.slice
//                                                     .call(children))
//                                                     .reduce((collection, children) => collection.concat(children), []);
// }
