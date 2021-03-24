document.addEventListener('DOMContentLoaded', event => {
  const message = document.querySelector('#message');
  const letters = document.querySelector('#spaces');
  const apples = document.querySelector('#apples');
  const guesses = document.querySelector('#guesses');
  const replay = document.querySelector('#replay');

  const randomWord = (() => {
    const words = ['apple', 'banana', 'orange', 'pear'];

    return function () {
      let randomIndex = Math.floor(Math.random() * words.length);
      let randomWord = words[randomIndex];
      words.splice(randomIndex, 1);
      return randomWord;
    };
  })();

  class Game {
    constructor() {
      this.incorrect = 0;
      this.lettersGuessed = [];
      this.correctSpaces = 0;
      this.allowedGuesses = 6;
      this.word = randomWord();

      if (!this.word) {
        this.displayMessage("Sorry, I've run out of words!");
        this.hideReplayLink();
        return this;
      }

      this.word = this.word.split('');
      this.reset();
    }

    createBlanks() {
      let spaces = this.word.map(el => '<span></span>').join('');

      let spans = letters.querySelectorAll('span');
      spans.forEach(span => {
        span.parentNode.removeChild(span);
      });

      letters.insertAdjacentHTML('beforeend', spaces);
      this.spaces = document.querySelectorAll('#spaces span');
    }

    fillBlanksFor(letter) {
      this.word.forEach((targetLetter, index) => {
        if (targetLetter === letter) {
          this.spaces[index].textContent = letter;
          this.correctSpaces++;
        }
      });
    }

    emptyGuesses() {
      let spans = guesses.querySelectorAll('span');
      spans.forEach(span => {
        guesses.removeChild(span);
      });
    }

    renderGuess(letter) {
      let guess = document.createElement('span');
      guess.textContent = letter;
      guesses.appendChild(guess);
    }

    renderIncorrectGuess(letter) {
      this.incorrect++;
      this.renderGuess(letter);
      this.setClass();
    }

    duplicateGuess(letter) {
      let duplicate = this.lettersGuessed.includes(letter);

      if (!duplicate) {
        this.lettersGuessed.push(letter);
      }

      return duplicate;
    }

    setClass() {
      apples.className = `guess_${this.incorrect}`;
    }

    displayMessage(text) {
      message.textContent = text;
    }

    showReplayLink() {
      replay.classList.add('visible');
    }

    hideReplayLink() {
      replay.classList.remove('visible');
    }

    processGuess(event) {
      let letter = event.key;

      if (isALetter(letter) && !this.duplicateGuess(letter)) {
        if (this.word.includes(letter)) {
          this.fillBlanksFor(letter);
          this.renderGuess(letter);

          if (this.correctSpaces === this.word.length) {
            this.win();
          }
        } else {
          this.renderIncorrectGuess(letter);
        }

        if (this.incorrect === this.allowedGuesses) {
          this.lose();
        }
      }
    }

    win() {
      this.unbind();
      this.displayMessage('You win!');
      this.showReplayLink();
      this.setGameStatus('win');
    }

    lose() {
      this.unbind();
      this.displayMessage("Sorry! You're out of guesses!");
      this.showReplayLink();
      this.setGameStatus('lose');
    }

    setGameStatus(status) {
      document.body.classList.remove('win', 'lose');
      if (status) {
        document.body.classList.add(status);
      }
    }

    bind() {
      this.processGuessHandler = (event) => this.processGuess(event);
      document.addEventListener('keyup', this.processGuessHandler);
    }

    unbind() {
      document.removeEventListener('keyup', this.processGuessHandler);
    }

    reset() {
      this.bind();
      this.createBlanks();
      this.setClass();
      this.hideReplayLink();
      this.emptyGuesses();
      this.setGameStatus();
      this.displayMessage('');
    }
  }

  function isALetter(letter) {
    return /[a-z]/.test(letter);
  }

  new Game();

  replay.addEventListener('click', event => {
    event.preventDefault();

    new Game();
  })
});
