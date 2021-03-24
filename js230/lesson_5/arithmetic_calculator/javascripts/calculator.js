document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('form');
  const resultElement = document.querySelector('#result');

  form.addEventListener('submit', event => {
    event.preventDefault();

    const firstNum = Number(form.querySelector('#first-number').value);
    const secondNum = Number(form.querySelector('#second-number').value);
    const operator = form.querySelector('#operator').selectedOptions[0].value;
    let result;

    switch (operator) {
      case '+':
        result = firstNum + secondNum;
        break;
      case '-':
        result = firstNum - secondNum;
        break;
      case '*':
        result = firstNum * secondNum;
        break;
      case '/':
        result = firstNum / secondNum;
    }

    resultElement.textContent = String(result);
  });
});
