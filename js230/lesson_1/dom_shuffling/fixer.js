let header = document.querySelector('body > header');
document.body.insertAdjacentElement('afterbegin', header);

let headerH1 = document.querySelector('main > h1');
header.insertAdjacentElement('afterbegin', headerH1);

let content = document.getElementById('content');
let mopFig = content.lastElementChild;
let chinFig = mopFig.previousElementSibling;
let chinPic = mopFig.querySelector('img');
let mopPic = chinFig.querySelector('img');

chinFig.insertBefore(chinPic, chinFig.firstElementChild);
mopFig.insertBefore(mopPic, mopFig.firstElementChild);

let article = document.querySelector('article');
article.appendChild(chinFig);
article.appendChild(mopFig);


// ALTERNATIVE SOLUTION:
// let header = document.querySelector("body > header");
// let h1 = document.querySelector("main > h1");
// header.insertBefore(h1, header.firstChild);
// document.body.insertBefore(header, document.body.firstChild);

// let [ chinStickFigure, babyMopFigure ] = document.querySelectorAll("figure");

// let babyMopImage = chinStickFigure.querySelector("img");
// let chinStickImage = babyMopFigure.querySelector("img");
// chinStickFigure.insertBefore(chinStickImage, chinStickFigure.firstChild);
// babyMopFigure.insertBefore(babyMopImage, babyMopFigure.firstChild);

// let article = document.querySelector("article");
// article.insertBefore(chinStickFigure, null);
// article.insertBefore(babyMopFigure, null);
