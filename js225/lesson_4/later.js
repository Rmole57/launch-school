function later(func, argument) {
  return function () {
    func(argument);
  };
}

let logWarning = later(console.log, 'The system is shutting down!');

logWarning();  // logs: The system is shutting down!
