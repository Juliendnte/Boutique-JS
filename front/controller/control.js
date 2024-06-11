const url = "http://localhost:4000";
const axios = require("axios");
let error = {
  message: "",
  status: 0,
};
/*
-Panier
-Affichage du payement
-Partie utilisateur{
  -Historique de commande
  -Favoris
}
-Filtre
-Surveiller quand il créer son compte qu'il met le même mdp
-Mieux sécurisé l'api (faire plus attention a ce que met l'utilisateur)
-Pagination cassé
-Footer n'est toujours pas fait
*/

exports.Index = (req, res) => {
  res.render("../views/pages/index");
};

exports.Basket = (req, res) => {
  res.render("../views/pages/basket");
};

exports.Result = async (req, res) => {
  let watches;
  try {
    if (req.query.next) {
      watches = await axios.get(`${req.query.next}&offset=${req.query.offset}` + (req.query.search ? `&search=${req.query.search}` : ""));
    } else if (req.query.previous) {
      watches = await axios.get(`${req.query.previous}&offset=${req.query.offset}` + (req.query.search ? `&search=${req.query.search}` : ""));
    } else {
      watches = await axios.get(url + (req.query.search ? "/search?search=" + req.query.search : "/articles"));
    }
  }catch (err){
    if (err.response.data.status !== 404) {
      error = {
        message : "Probleme serveur",
        status: 500
      }
      res.redirect("/error500")
      return
    }else {
      error =`Aucune montres trouvé pour ${req.query.search} `
    }
  }
  try{
    res.render("../views/pages/result", {
      lst: watches.data.articles,
      search: !!req.query.search,
      error: null
    });
  }catch (err){
    res.render("../views/pages/result", {
      lst: null,
      search: true,
      error: true,
      message : error
    });
  }
};

exports.Login = (req, res) => {
  res.render("../views/pages/login", error);
  error = {
    message : "",
    status: 0
  }
};

exports.CreateAccount = (req, res) => {
  res.render("../views/pages/create-account", error);
  error = {
    message: "",
    status: 0,
  };
};

exports.Marque = async (req, res) => {
  try{
    const response = await axios.get(url + "/marque")
    res.render("../views/pages/marque",{
      marque: response.data.marque
    });
  }catch (err){
    error = {
      message : "Probleme serveur",
      status: 500
    }
    res.redirect("/error500");
  }
}

exports.WatchDetail = async (req, res) => {
  let colorReq;
  let watchReq;
  let similarReq;
  try {
    watchReq = await axios.get(url + "/article/" + req.query.id);
    colorReq = await axios.get(url + "/color/" + req.query.id);
    similarReq = await axios.get(url + "/similar/" + req.query.id);
  }catch (err){
    if (err.watchReq){
      error.message = err.watchReq.data.message;
      error.status = err.watchReq.data.status;
    }else if (err.colorReq){
      error.message = err.colorReq.data.message;
      error.status = err.colorReq.data.status;
    }else if (err.similarReq){
      error.message = err.similarReq.data.message
      error.status = err.similarReq.data.status;
    }else{
      error = {
        message : "Probleme serveur",
        status: 500
      }
    }
    res.redirect("/error500");
    return
  }

  if (await getFavId(req.cookies.Token, watchReq.data.article.Id)){
    res.render("../views/pages/detail", {
      watch: watchReq.data.article,
      color: colorReq.data.articlesId,
      similar: similarReq.data.articles,
      like: "true"
    });
  }else {
    res.render("../views/pages/detail", {
      watch: watchReq.data.article,
      color: colorReq.data.articlesId,
      similar: similarReq.data.articles,
      like: false
    });
  }
};

exports.LoginTreatment = async (req, res) => {
  const { name, password, remember } = req.body;
  if (!name) {
    error.message = "Le champs username/Email doit être remplie";
    error.status = 401;
    res.redirect("/login");
    return;
  }
  let { username, email } = "";
  isValidEmail(name) ? (email = name) : (username = name);

  try {
    const response = await axios.post(url + "/login", {
      username,
      password,
      email,
      remember,
    });
    let maxAge = 24 * 60 * 60 * 1000 * (remember ? 365 : 1);
    if (response.status === 200){
        res.cookie("Token", response.data.Token, {
          maxAge: maxAge,
          httpOnly: true,
          secure: false,
          sameSite: 'Lax',
        });
    }else{
      error.message = response.data.message
      error.status = response.data.status
      res.redirect("/login")
      return
    }
  }catch (err){
    error.message = err.response.data.message
    error.status = err.response.data.status
    res.redirect("/login")
    return
  }
  res.redirect('/Index');
}

exports.RegisterTreatment = async (req, res) => {
  const {username , password, email} = req.body;
  try {
    const response = await axios.post(url + "/register", {username,password,email});
    if (response.data.status === 201){
      res.redirect('/Index')
      return
    }else{
      error.message = response.data.message
      error.status = response.data.status
    }
  }catch (err){
    error.message = err.response.data.message
    error.status = err.response.data.status
  }
  res.redirect("/create-account")
}

exports.SearchTreatment = (req, res) => {
  const {search} = req.body;
  res.redirect(`/result?search=${search}`);
};

exports.forgotPasswordGet = (req, res) => {
  res.render("../views/pages/forgotPassword", {
    send: null,
  });
};

exports.forgotPasswordPost = async (req, res) => {
  const { email } = req.body;
  if (!isValidEmail(email)) {
    res.render("../views/pages/forgotPassword", {
      send: false,
    });
  } else {
    const response = await axios.post("http://localhost:4000/forgotPassword", {
      email,
    });
    console.log(response.data);
    res.render("../views/pages/forgotPassword", {
      send: response.status === 200,
    });
  }
};

exports.resetPasswordGet = (req, res) => {
  const token = req.query.token;
  res.render("../views/pages/resetPassword", {
    token,
  });
};

exports.resetPasswordPost = async (req, res) => {
  const token = req.params.token;
  const { password } = req.body;
  const response = await axios.post(
    url + "/resetPassword",
    { password },
    {
      headers: {
        Authorization: token,
        "Content-Type": "application/json",
      },
    }
  );
  console.log(response.data);
  res.redirect("/Index");
};

exports.Error = (req, res) => {
  error = {
    message: error.message
      ? error.message
      : "Nous ne trouvons pas la page que vous recherchez.",
    status: error.status ? error.status : 404,
  };
  res.render("../views/pages/error", error);
  error = {
    message: "",
    status: 0,
  };
};

exports.User = async (req, res) =>{ 
  const token = req.cookies.Token;

  try {
    const fav= await getFav(token);
    const commande = await axios.get(url + "/commande", {
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json'
      }
    })
    res.render("../views/pages/user", {
      fav: fav.data.Favoris,
      commande
    })
  }catch (err) {
    error.message = err.fav.data.message
    error.status = err.fav.data.status
    res.redirect("/login")
  }
}

exports.AjoutFav = async (req, res) =>{
  const id = req.params.id
  const token = req.cookies.Token;
  const headers= {
    'Authorization': token,
    'Content-Type': 'application/json'
  }
  try{
    await getFavId(token, id) ? await axios.delete(`${url}/fav/${id}`, {headers}) : await axios.get(`${url}/fav/${id}`, {headers})
  }catch (err){
    error.message = err.response.data.message
    error.status = err.response.data.status
  }
  res.redirect(`/detail?id=${id}`)
}

async function getFavId(token, id) {
  try {
    const response = await axios.get(url + "/fav", {
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json'
      }
    });

    for (const fav of response.data.Favoris) {
      if (fav.Id == id) {
        return true;
      }
    }

    return false;
  } catch (e) {
    return false;
  }
}

async function getFav(token) {
  try {
    return await axios.get(url + "/fav", {
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json'
      }
    });
  } catch (e) {
    return false;
  }
}

function isValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}
