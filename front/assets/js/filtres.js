const Confirm = document.querySelector("#confirm");
Confirm.addEventListener("click", filterSearch);

async function filterSearch() {
  var colorcheckboxes = document.querySelectorAll(
    '.color-ctn input[type="checkbox"]:checked'
  );

  var matierecheckboxes = document.querySelectorAll(
    '.matiere-ctn input[type="checkbox"]:checked'
  );

  var marquecheckboxes = document.querySelectorAll(
    '.marque-ctn input[type="checkbox"]:checked'
  );

  var selectedColors = [];
  var selectedMatiere = [];
  var selectedMarque = [];
  colorcheckboxes.forEach((checkbox) => {
    selectedColors.push(checkbox.value);
  });
  matierecheckboxes.forEach((checkbox) => {
    selectedMatiere.push(checkbox.value);
  });
  marquecheckboxes.forEach((checkbox) => {
    selectedMarque.push(checkbox.value);
  });

  const watches = await getWatches();
  let result = filterArticles(
    watches.articles.items,
    selectedColors,
    selectedMarque,
    selectedMatiere
  );

  console.log(result);
}

function filterArticles(articles, couleurs, marques, matieres) {
  const filteredArticles = [];
  for (let i = 0; i < articles.length; i++) {
    const article = articles[i];
    const couleurMatch =
      couleurs.length === 0 || couleurs.includes(article.color);
    const marqueMatch =
      marques.length === 0 || marques.includes(article.marqueLabel);

    const matiereMatch =
      matieres.length === 0 || matieres.includes(article.matiere);

    console.log(couleurMatch, marqueMatch, matiereMatch);

    if (couleurMatch && marqueMatch && matiereMatch) {
      filteredArticles.push(article);
    }
  }

  return filteredArticles;
}

const colorbtn = document.querySelector(".color-btn");
const colorctn = document.querySelector(".color-ctn");
colorbtn.addEventListener("click", toggleColor);

const matbtn = document.querySelector(".matiere-btn");
const matctn = document.querySelector(".matiere-ctn");
matbtn.addEventListener("click", toggleMatiere);

const marquebtn = document.querySelector(".marque-btn");
const marquectn = document.querySelector(".marque-ctn");
marquebtn.addEventListener("click", toggleMarque);

function toggleColor() {
  if (matctn.classList[1] === "visible") {
    toggleMatiere();
  }
  if (marquectn.classList[1] === "visible") {
    toggleMarque();
  }
  colorctn.classList.toggle("visible");
}

function toggleMatiere() {
  if (colorctn.classList[1] === "visible") {
    toggleColor();
  }
  if (marquectn.classList[1] === "visible") {
    toggleMarque();
  }
  matctn.classList.toggle("visible");
}

function toggleMarque() {
  if (matctn.classList[1] === "visible") {
    toggleMatiere();
  }
  if (colorctn.classList[1] === "visible") {
    toggleColor();
  }
  marquectn.classList.toggle("visible");
}

async function getWatches() {
  const data = await fetch(`http://localhost:4000/articles?limit=120&offset=0`);
  return data.json();
}
