const burger = document.querySelector("#burger");
burger.addEventListener("click", displayBurger);
const span1 = document.querySelector("#first-span");
const span2 = document.querySelector("#second-span");
const span3 = document.querySelector("#third-span");
const burgerListCtn = document.querySelector(".burger-list-ctn");
const burgerList = document.querySelectorAll(".burger-list-ctn p");

function displayBurger() {
  span1.style =
    "transition: transform 0.5s; display: inline-block; transform-origin: left; transform: rotate(45deg);";
  span3.style =
    "transition: transform 0.5s; display: inline-block; transform-origin: left; transform: rotate(-45deg)";
  span2.style = "opacity: 0; transition: opacity 0.5s ease;";
  burgerListCtn.style = "transition: 0.5s; height: 87vh;";
  burgerList.forEach((elem) => {
    elem.style = "opacity: 1; transition: opacity 1s ease;";
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
  burgerListCtn.style = "transition: 0.5s; height: 0;";
  burgerList.forEach((elem) => {
    elem.style = "opacity: 0; transition: opacity 0.2s ease;";
  });
  burger.removeEventListener("click", hideBurger);
  burger.addEventListener("click", displayBurger);
}
