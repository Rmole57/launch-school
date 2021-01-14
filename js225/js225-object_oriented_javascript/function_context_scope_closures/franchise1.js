const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map(number => `${this.name} ${number}`);
  },
};

console.log(franchise.allMovies());


// ALTERNATIVE SOLUTION:

// const franchise = {
//   name: 'How to Train Your Dragon',
//   allMovies: function() {
//     const self = this;
//     return [1, 2, 3].map(function(number) {
//       return self.name + ' ' + number;
//     });
//   },
// };
