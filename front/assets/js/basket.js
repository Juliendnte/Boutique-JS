let basketListCtn = document.querySelector("#basket-ctn");
console.log("basketListCtn : " + basketListCtn);
let gros_truc = document.querySelector(".gros-truc");

function displayBasket() {
  let liste = JSON.parse(localStorage.getItem("panier")) || [];
  basketListCtn.innerHTML = "";
  for (const elem of liste) {
    let ctn = document.createElement("div");
    ctn.classList = "panier-item";
    ctn.innerHTML = `
      <img class="item-img" src="${elem.img}">
      <div class="infos-item">
        <p>${elem.marque}</p>
        <p>${elem.model}</p>
        <p>${elem.prix} €</p>
      </div>
      <div class="stock">
      <button id="moins" class="${elem.id}">-</button>
      <p id="${elem.id}" class="quantity">${elem.nb}</p>
      <button id="plus" class="${elem.id}">+</button>
      </div>
      <img class="${elem.id} delete-item-img" src="/public/img/trash.png">
    `;
    basketListCtn.appendChild(ctn);
  }
  const listPLus = document.querySelectorAll("#plus");
  const listMoins = document.querySelectorAll("#moins");
  listPLus.forEach((button) => {
    button.addEventListener("click", basketIncrease);
  });

  listMoins.forEach((button) => {
    button.addEventListener("click", basketDecrease);
  });

  const listStock = document.querySelectorAll(".quantity");
  const listSuppr = document.querySelectorAll(".delete-item-img");

  listSuppr.forEach((button) => {
    button.addEventListener("click", elemSuppr);
  });
}

displayBasket();

function basketIncrease(e) {
  const listStock = document.querySelectorAll(".quantity");
  toInc = e.target.classList[0];
  listStock.forEach((elem) => {
    if (elem.id === toInc) {
      let newStock = parseInt(elem.innerText) + 1;
      elem.innerText = newStock;
      let panier = JSON.parse(localStorage.getItem("panier"));
      panier.forEach((item) => {
        if (item.id === parseInt(toInc)) {
          item.nb = newStock;
        }
      });
      console.log(panier);
      localStorage.setItem("panier", JSON.stringify(panier));
    }
  });
}

function basketDecrease(e) {
  const listStock = document.querySelectorAll(".quantity");
  toDec = e.target.classList[0];
  listStock.forEach((elem) => {
    if (elem.id === toDec) {
      let newStock = parseInt(elem.innerText) - 1;
      elem.innerText = newStock;
      if (newStock === 0) {
        elemSuppr(e);
      } else {
        let panier = JSON.parse(localStorage.getItem("panier"));
        panier.forEach((item) => {
          if (item.id === parseInt(toDec)) {
            item.nb = newStock;
          }
        });
      }
    }
  });
}

function elemSuppr(e) {
  let panier = JSON.parse(localStorage.getItem("panier"));
  let toRem = e.target.classList[0];
  console.log(typeof toRem);
  let index = panier.findIndex((produit) => produit.id === parseInt(toRem));
  console.log("index : " + index);
  panier.splice(index, 1);
  localStorage.setItem("panier", JSON.stringify(panier));
  displayBasket();
}

async function AddresseStreet(){
  const street = document.querySelector("input[name=street]")
  if (street.value.length > 5) {
    try {
      gros_truc.classList.add("active");
      const response = await getAdresse(street.value);
      updateAddresses(response);
    } catch (err) {
      console.log(err);
    }
  } else {
    removeActiveClass()
    gros_truc.innerHTML = '';
  }
}

async function getAdresse(street) {
  const data = await fetch(`https://api-adresse.data.gouv.fr/search/?q=${street}`)
  return data.json();
}

function updateAddresses(response) {
  const addresses = response.features.map(feature => feature.properties);
  let innerHTMLContent = '';

  addresses.forEach(address => {
    innerHTMLContent += `
      <div class="petit-truc" onclick="clickAdress(this)">
        <p>${address.name || 'Unknown street'}</p>
        <p>${address.city || 'Unknown city'}</p>
        <p>${address.postcode || 'Unknown postal code'}</p>
      </div>
    `;
  });

  gros_truc.innerHTML = innerHTMLContent;
}

function removeActiveClass() {
  setTimeout(() => {
    gros_truc.classList.remove("active");
  },400);
}

function clickAdress(e){
  const paragraphs = e.querySelectorAll("p");
  const data = Array.from(paragraphs).map(p => p.textContent);
  const ville = document.querySelector("input[name=ville]")
  const postcode = document.querySelector("input[name=postcode]")
  ville.value = data[1];
  postcode.value = data[2];
}