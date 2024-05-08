const burger = document.querySelector("#burger");
burger.addEventListener("click", displayBurger);
const span1 = document.querySelector("#first-span");
const span2 = document.querySelector("#second-span");
const span3 = document.querySelector("#third-span");

function displayBurger() {
  span1.style =
    "display: inline-block; transform-origin: left; transform: rotate(45deg);";
  span3.style =
    "display: inline-block; transform-origin: left; transform: rotate(-45deg)";
  span2.style = "visibility: hidden";
  burger.removeEventListener("click", displayBurger);
  burger.addEventListener("click", hideBurger);
}

function hideBurger() {
  span1.style =
    "display: inline-block; transform-origin: left; transform: rotate(0deg);";
  span3.style =
    "display: inline-block; transform-origin: left; transform: rotate(0deg)";
  span2.style = "visibility: visible";
  burger.removeEventListener("click", hideBurger);
  burger.addEventListener("click", displayBurger);
}
