function startCounting() {
  let count = 0;

  counterId = setInterval(() => {
    count += 1;
    console.log(count);
  }, 1000);
}

function stopCounting() {
  clearInterval(counterId);
}

let counterId;
startCounting();
setTimeout(() => stopCounting(counterId), 5000);  // stops the counting after 5 seconds (after numbers 1-4 are logged)
