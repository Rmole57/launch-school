let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(data) {
  return data.map(band => {
    updateCountry(band);
    capitalizeBandName(band);
    removeDotsInBandName(band);
    return band;
  });
}

function updateCountry(band) {
  band.country = 'Canada';
}

function capitalizeBandName(band) {
  band.name = band.name
                  .split(' ')
                  .map(word => capitalizeString(word))
                  .join(' ');
}

function capitalizeString(string) {
  let initial = string[0].toUpperCase();
  let rest = string.slice(1, string.length);
  return initial + rest;
}

function removeDotsInBandName(band) {
  band.name = band.name.replace(/\./g, '');
}

console.log(processBands(bands));

// should return (as shown by console output):
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]


// ALTERNATIVE SOLUTION:

// Solution that tames side effects:
// function processBands(bands) {
//   return bands.map(band => {
//     let capitalizedName = capitalizePhrase(band.name);
//     let newBandName = removeDotsInString(capitalizedName);

//     return {
//       name: newBandName,
//       country: 'Canada',
//       active: band.active,
//     };
//   });
// }

// function capitalizePhrase(phrase) {
//   return phrase.split(' ')
//                .map(word => capitalizeString(word))
//                .join(' ');
// }

// function capitalizeString(string) {
//   let initial = string[0].toUpperCase();
//   let rest = string.slice(1, string.length);
//   return initial + rest;
// }

// function removeDotsInString(string) {
//   return string.replace(/\./g, '');
// }
