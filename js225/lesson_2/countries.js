"use strict";

function makeCountry(name, continent, visited = false) {
  return {
    name,
    continent,
    visited,
    visitCountry() {
      this.visited = true;
    },
    getDescription() {
      return this.name + ' is located in ' + this.continent + '. I ' +
      (this.visited ? 'have' : "haven't") +
      ' visited ' + this.name + '.';
    },
  };
}

let chile = makeCountry('The Republic of Chile', 'South America');
let canada = makeCountry('Canada', 'North America');
let southAfrica = makeCountry('The Republic of South Africa', 'Africa');

console.log(chile.getDescription());       // "The Republic of Chile is located in South America. I haven't visited The Republic of Chile."
console.log(southAfrica.getDescription()); // "The Republic of South Africa is located in Africa. I haven't visited The Republic of South Africa."
console.log(canada.getDescription());      // "Canada is located in North America. I haven't visited Canada."

canada.visitCountry();
console.log(canada.getDescription());      // "Canada is located in North America. I have visited Canada."
