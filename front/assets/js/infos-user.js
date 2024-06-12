const favCtn = document.querySelector("#fav-ctn");

function displayFavoris() {
  let panier = JSON.parse(localStorage.getItem("panier"));
  console.log(panier);

  if (panier) {
    favCtn.innerHTML = "";
    panier.forEach(async (elem) => {
      let val = await getWatches(elem.id);
      console.log(val);
      let ctn = document.createElement("div");
      ctn.classList = "elem-fav";
      console.log(val.article.Id);
      ctn.innerHTML = `
        <img src="${val.article.img[0]}" class="img-item">
        <div class="text-ctn">
        <p>${val.article.Model}</p>
        <p>${val.article.marque}</p>
        </div>
        <a href="/ajoutFav/${val.article.Id}">
        <img class="delete-item-img" src="/public/img/trash.png">
        </a>
        
    `;
      console.log(ctn);
      favCtn.appendChild(ctn);
    });
  }
}

displayFavoris();

async function getWatches(watch) {
  const data = await fetch(`http://localhost:4000/article/${watch}`);
  return data.json();
}
