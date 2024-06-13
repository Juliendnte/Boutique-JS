const burger = document.querySelector("#burger");
burger.addEventListener("click", displayBurger);
const span1 = document.querySelector("#first-span");
const span2 = document.querySelector("#second-span");
const span3 = document.querySelector("#third-span");
const burgerListCtn = document.querySelector(".burger-list-ctn");
const burgerList = document.querySelectorAll(".burger-list-ctn p");
const listP = document.querySelectorAll(".filtre p");
const vidCtn = document.querySelector(".vid-ctn");
const horlogerie = document.querySelector(".horlogerie");
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
  vidCtn.style = "transition: 0.7s; display: none;";
  horlogerie.style = "transition: 0.7s; display: none;";
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
  vidCtn.style =
    "display: flex; align-items: center; justify-content: center; overflow: hidden;";
  horlogerie.style =
    "display: flex; align-items: center; justify-content: center; overflow: hidden;";
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

function updateNb() {
  const nb = document.querySelector(".nb");
  let panier = JSON.parse(localStorage.getItem("panier"));
  nb.innerHTML = panier.length;
}

updateNb();
