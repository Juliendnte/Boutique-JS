let basketListCtn = document.querySelector("#basket-ctn");
console.log("basketListCtn : " + basketListCtn);
let gros_truc = document.querySelector(".gros-truc");
let total;

async function getWatches(lst) {
  lst = lst.join();
  const data = await fetch(`http://localhost:4000/articlesID?id=${lst}`);
  return data.json();
}

async function affectEvent() {
  const listPlus = document.querySelectorAll(".plus");
  const listMoins = document.querySelectorAll(".moins");
  listPlus.forEach((button) => {
    button.addEventListener("click", basketIncrease);
  });

  listMoins.forEach((button) => {
    button.addEventListener("click", basketDecrease);
  });

  const listSuppr = document.querySelectorAll(".delete-item-img");

  listSuppr.forEach((button) => {
    button.addEventListener("click", trashElemSuppr);
  });
}

async function displayBasket() {
  let liste = JSON.parse(localStorage.getItem("panier")) || [];
  let listReq = [];
  liste.forEach((watch) => {
    listReq.push(watch.id);
  });
  basketListCtn.innerHTML = "";

  getWatches(listReq).then(async (watches) => {
    total = watches.listArticles;
    for (const elem of watches.listArticles) {
      let ctn = document.createElement("div");
      ctn.classList = "panier-item";
      let quantity;
      liste.forEach((item) => {
        if (elem.Id === item.id) {
          quantity = item.nb;
        }
      });

      ctn.innerHTML = `
          <img class="item-img" src="${elem.Images[0]}">
          <div class="infos-item">
            <p id="marque">${elem.marque}</p>
            <p>${elem.Model}</p>
            <p>${elem.Price} €</p>
          </div>
          <div class="stock">
            <button class="${elem.Id} moins">-</button>
            <p id="${elem.Id}" class="quantity">${quantity}</p>
            <button class="${elem.Id} plus">+</button>
          </div>
          <img class="${elem.Id} delete-item-img" src="/public/img/trash.png">
        `;
      basketListCtn.appendChild(ctn);
    }
    await affectEvent();
    detailCommande();
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
      localStorage.setItem("panier", JSON.stringify(panier));
    }
  });
  detailCommande();
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
        localStorage.setItem("panier", JSON.stringify(panier));
      }
    }
  });
  displayBasket();
}

function elemSuppr(e) {
  let panier = JSON.parse(localStorage.getItem("panier"));
  let toRem = e.target.classList[0];
  let index = panier.findIndex((produit) => produit.id === parseInt(toRem));
  panier.splice(index, 1);
  localStorage.setItem("panier", JSON.stringify(panier));
}

function trashElemSuppr(e) {
  let panier = JSON.parse(localStorage.getItem("panier"));
  let toRem = e.target.classList[0];
  let index = panier.findIndex((produit) => produit.id === parseInt(toRem));
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
function detailCommande() {
  const detailCommande = document.querySelector(".detail-commande-ctn");
  detailCommande.innerHTML = "";
  const totalCommande = document.querySelector("#total");

  var totalValue = 0;

  for (const elem of total) {
    let Nb = 0;
    let panier = JSON.parse(localStorage.getItem("panier"));
    panier.forEach((item) => {
      if (item.id === elem.Id) {
        Nb = item.nb;
      }
    });
    let elemPrice = document.createElement("p");
    elemPrice.classList = "price to-pad";
    elemPrice.innerText = `X${Nb} ${elem.Model} : ${elem.Price}€`;
    totalValue += parseInt(elem.Price) * Nb;
    detailCommande.appendChild(elemPrice);
  }

  totalCommande.innerText = "Total : " + totalValue + "€";
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
