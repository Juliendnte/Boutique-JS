new Swiper(".mySwiper", {
  loop: true,
  slidesPerView: 1,
  spaceBetween: 10,
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  breakpoints: {
    350: {
      slidesPerView: 1,
    },
    700: {
      slidesPerView: 1,
    },
    1024: {
      slidesPerView: 1,
    },
  },
});

const description = document.querySelector("#description");
const descriptionContainer = description.innerHTML;
const button = document.querySelector(".voir-plus");
button.addEventListener("click", ShortenDescription);

function ShortenDescription() {
  const newText = descriptionContainer.slice(0, 200) + "...";
  description.innerHTML = newText;
  description.style =
    "background: linear-gradient(to bottom, #1d1c69 10%, #454491 50%, #9f9edb 60%);-webkit-text-fill-color: transparent;-webkit-background-clip: text;background-clip: text;color: transparent;";
  button.innerHTML = "Voir plus";
  button.removeEventListener("click", ShortenDescription);
  button.addEventListener("click", ExtendDescription);
}

function ExtendDescription() {
  description.innerHTML = descriptionContainer;
  description.style = "background:none; color: var(--horo-blue);";
  button.innerHTML = "Voir moins";
  button.removeEventListener("click", ExtendDescription);
  button.addEventListener("click", ShortenDescription);
}

ShortenDescription();

const colors = document.querySelectorAll(".example"); // à modifier quand t'auras les images
colors.forEach((color) => {
  color.addEventListener("click", ChangeSelected);
});

const favButton = document.querySelector(".favoris-btn");
const imgFavoris = document.querySelector(".favoris-btn-img");

favButton.addEventListener("click", () => {
  if (favButton.classList[1] === "fav-selected") {
    imgFavoris.src = "/public/img/fav.png";
    favButton.classList.remove("fav-selected");
  } else {
    imgFavoris.src = "/public/img/fav-selected.png";
    favButton.classList.add("fav-selected");
  }
});

function ChangeSelected(e) {
  colors.forEach((color) => {
    color.classList.remove("selected");
  });
  e.target.classList.add("selected");
}

function UpdateFavoris() {
  let fav = JSON.parse(localStorage.getItem("favoris")) || [];
  let toRem = favButton.classList[1];
  console.log(toRem);
  if (!fav.find((f) => toRem === f)) {
    fav.push(toRem);
    localStorage.setItem("favoris", JSON.stringify(fav));
  } else {
    fav.splice(index, 1);
    localStorage.setItem("favoris", JSON.stringify(fav));
    console.log("Item removed succesfully");
  }
}

function insertSpace() {
  const carteInput = document.querySelector(".carte-infos");
  let valeur = carteInput.value.replace(/\s/g, "");
  let nouvelleValeur = "";
  for (let i = 0; i < valeur.length; i += 4) {
    nouvelleValeur += valeur.substr(i, 4) + " ";
  }
  carteInput.value = nouvelleValeur.trim();
}

// localStorage

const basket = JSON.parse(localStorage.getItem("panier")) || [];

// id et nombre qu'on envoie dans le basket

const addToBasketButton = document.querySelector(".add-to-basket");
addToBasketButton.addEventListener("click", addToBasket);

function addToBasket(e) {
  console.log("price : " + e.target.classList[5]);
  let toAdd = {
    id: parseInt(e.target.classList[1]),
    nb: 1,
    img: e.target.classList[2],
    marque: e.target.classList[3],
    model: e.target.classList[4],
    price: parseInt(e.target.classList[5]),
    stock: parseInt(e.target.classList[6]),
  };
  let liste = JSON.parse(localStorage.getItem("panier")) || [];
  for (const elem of liste) {
    if (elem.id === toAdd.id) {
      elem.nb++;
      localStorage.setItem("panier", JSON.stringify(liste));
      return;
    }
  }
  liste.push(toAdd);
  console.log("liste : " + JSON.parse(localStorage.getItem("panier")));
  localStorage.setItem("panier", JSON.stringify(liste));
}
