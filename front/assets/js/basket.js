let basketListCtn = document.querySelector("#basket-ctn");
console.log("basketListCtn : " + basketListCtn);

async function getWatches(lst) {
  lst = lst.join();
  const data = await fetch(`http://localhost:4000/articlesID?id=${lst}`);
  return data.json();
}

async function displayBasket() {
  let liste = JSON.parse(localStorage.getItem("panier")) || [];
  console.log(liste);
  let listReq = [];
  liste.forEach((watch) => {
    listReq.push(watch.id);
  });
  basketListCtn.innerHTML = "";

  getWatches(listReq).then((watches) => {
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
          <img class="item-img" src="${elem.img[0]}">
          <div class="infos-item">
            <p id="marque">${elem.Marque}</p>
            <p>${elem.Model}</p>
            <p>${elem.Price} €</p>
          </div>
          <div class="stock">
            <button id="moins" class="${elem.Id}">-</button>
            <p id="${elem.Id}" class="quantity">${quantity}</p>
            <button id="plus" class="${elem.Id}">+</button>
          </div>
          <img class="${elem.Id} delete-item-img" src="/public/img/trash.png">
        `;
      basketListCtn.appendChild(ctn);
    }
  });

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
