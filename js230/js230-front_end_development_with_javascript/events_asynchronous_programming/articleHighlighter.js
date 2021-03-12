function removeHighlights() {
  [main].concat(articles).forEach(element => element.classList.remove('highlight'));
}

let nav = document.querySelector('header ul');
let main = document.querySelector('main');
let articles = Array.from(main.querySelectorAll('article'));

document.addEventListener('click', function (event) {
  removeHighlights();
  main.classList.add('highlight');
});

main.addEventListener('click', function (event) {
  let targetArticle;
  for (let i = 0; i < articles.length; i += 1) {
    if (articles[i].contains(event.target)) {
      targetArticle = articles[i];
      break;
    }
  }
  
  removeHighlights();
  if (targetArticle) {
    event.stopPropagation();
    targetArticle.classList.add('highlight');
  }
});

nav.addEventListener('click', function (event) {
  if (event.target.tagName === 'A') {
    event.stopPropagation();
    removeHighlights();
    let articleId = event.target.getAttribute('href');
    let article = main.querySelector(articleId);
    article.classList.add('highlight');
  }
});


// ALTERNATIVE SOLUTION:

// function highlight({target}) {
//   let element;
//   let id;

//   removeHighlight();

//   if (target.tagName === 'A') {
//     id = target.href.match('#article-[0-9]+')[0]
//     element = document.querySelector(id);
//   } else {
//     element = document.querySelector('main');
//   }

//   element.classList.add('highlight');
// }

// function removeHighlight() {
//   const highlighted = document.querySelector('.highlight');
//   if (highlighted) {
//     highlighted.classList.remove('highlight');
//   }
// }

// const nav = document.querySelector('header ul');
// const main = document.querySelector('main');

// nav.addEventListener('click', highlight);
// document.addEventListener('click', highlight);
// main.addEventListener("click", e => {
//   e.preventDefault();
//   let article = e.target;
//   if (article.tagName !== 'ARTICLE') { article = article.parentNode; }

//   if (article.tagName === "ARTICLE") {
//     e.stopPropagation();
//     removeHighlight();
//     article.classList.add("highlight");
//   }
// });
