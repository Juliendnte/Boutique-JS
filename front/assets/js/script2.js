const burger = document.querySelector("#burger");
burger.addEventListener("click", displayBurger);
const span1 = document.querySelector("#first-span");
const span2 = document.querySelector("#second-span");
const span3 = document.querySelector("#third-span");
const burgerListCtn = document.querySelector(".burger-list-ctn");
const burgerList = document.querySelectorAll(".burger-list-ctn p");
const burgerCategories = document.querySelectorAll(".burger-categories");
const burgerListCtnSpan = document.querySelector(".burger-list-ctn span");
const searchButton = document.querySelector(".search");
const searchBar = document.querySelector(".search-bar");
burgerCategories.forEach((cat) => {
  cat.style = "display: none;";
});

function displayBurger() {
  span1.style =
    "transition: transform 0.5s; display: inline-block; transform-origin: left; transform: rotate(45deg);";
  span3.style =
    "transition: transform 0.5s; display: inline-block; transform-origin: left; transform: rotate(-45deg)";
  span2.style = "opacity: 0; transition: opacity 0.5s ease;";
  burgerListCtn.style = "transition: 0.5s; height: 87vh; overflow: hidden;";
  burgerListCtnSpan.style = "display: flex";
  burgerList.forEach((elem) => {
    elem.style = "transition: opacity 1s ease;";
  });
  burgerCategories.forEach((cat) => {
    cat.style = "display: flex";
  });
  burger.removeEventListener("click", displayBurger);
  burger.addEventListener("click", hideBurger);
}

function hideBurger() {
  span1.style =
    "transition: transform 0.5s; display: inline-block; transform-origin: left; transform: rotate(0deg);";
  span3.style =
    "transition: transform 0.5s; display: inline-block; transform-origin: left; transform: rotate(0deg)";
  span2.style = "opacity: 1; transition: opacity 0.5s ease;";
  burgerListCtn.style = "transition: 0.5s; height: 0px;";
  burgerList.forEach((elem) => {
    elem.style = "transition: opacity 0.2s ease;";
  });
  burgerListCtnSpan.style = "display: none";
  burgerCategories.forEach((cat) => {
    cat.style = "display: none";
  });
  burger.removeEventListener("click", hideBurger);
  burger.addEventListener("click", displayBurger);
}

searchButton.addEventListener("click", displaySearch);

function displaySearch() {
  searchBar.style = "height: 70px; transition: all 0.3s;";
  searchButton.removeEventListener("click", displaySearch);
  searchButton.addEventListener("click", hideSearch);
}

function hideSearch() {
  searchBar.style = "height: 0vh; transition: all 0.3s;";
  searchButton.removeEventListener("click", hideSearch);
  searchButton.addEventListener("click", displaySearch);
}

var swiper = new Swiper(".mySwiper", {
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
    "  background: linear-gradient(to bottom, #1d1c69 10%, #454491 50%, #9f9edb 60%);-webkit-text-fill-color: transparent;-webkit-background-clip: text;background-clip: text;color: transparent;";
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

function ChangeSelected(e) {
  colors.forEach((color) => {
    color.classList.remove("selected");
  });
  e.target.classList.add("selected");
}
