"use strict";

function createProduct(id, name, stock, price) {
  return {
    id,
    name,
    stock,
    price,
    setPrice(newPrice) {
      if (newPrice >= 0) {
        this.price = newPrice;
      } else {
        alert('Invalid price!');
      }
    },

    describe() {
      console.log('Name: ' + this.name);
      console.log('ID: ' + this.id);
      console.log('Price: $' + this.price);
      console.log('Stock: ' + this.stock);
    },
  };
}

let scissors = createProduct(0, 'Scissors', 8, 10);
let drill = createProduct(1, 'Cordless Drill', 15, 45);
let saw = createProduct(2, 'Circular Saw', 12, 95);
let hammer = createProduct(3, 'Sledge Hammer', 78, 45);
let boxCutter = createProduct(4, 'Box Cutter', 41, 15);

scissors.describe();
hammer.describe();


// ALTERNATIVE SOLUTION:

// function createProduct(id, name, stock, price) {
//   let newProduct = {};
//   newProduct.id = id;
//   newProduct.name = name;
//   newProduct.stock = stock;
//   newProduct.price = price;
//   newProduct.setPrice = function(newPrice) {
//     if (newPrice >= 0) {
//       this.price = newPrice;
//     } else {
//       alert('Invalid price!');
//     }
//   };

//   newProduct.describe = function() {
//     console.log('Name: ' + this.name);
//     console.log('ID: ' + this.id);
//     console.log('Price: $' + this.price);
//     console.log('Stock: ' + this.stock);
//   };

//   return newProduct;
// }
