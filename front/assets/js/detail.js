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

const imgFavoris = document.querySelector(".favoris-btn-img");

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

// localStorage

const basket = JSON.parse(localStorage.getItem("panier")) || [];

// id et nombre qu'on envoie dans le basket

const addToBasketButton = document.querySelector(".add-to-basket");
addToBasketButton.addEventListener("click", addToBasket);

function addToBasket(e) {
  let toAdd = {
    id: parseInt(e.target.classList[1]),
    nb: 1,
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
  localStorage.setItem("panier", JSON.stringify(liste));
  updateNb();
}

function updateNb() {
  const nb = document.querySelector(".nb");
  let panier = JSON.parse(localStorage.getItem("panier"));
  nb.innerHTML = panier.length;
}
