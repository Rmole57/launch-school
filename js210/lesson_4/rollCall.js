const NAMES = ['Steve', 'Martha', 'Pat'];

function rollCall(firstNames) {
  for (let index = 0; index < firstNames.length; index += 1) {
    console.log(firstNames[index]);
  }
}

rollCall(NAMES);
