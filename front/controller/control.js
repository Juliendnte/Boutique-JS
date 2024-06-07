const url = "http://localhost:4000";
const axios = require("axios");

/*
-Gérer les cas d'erreurs
-Panier
-Affichage du payement
-Partie utilisateur{
  -Historique de commande
  -Favoris
}
-Filtre
-Finir tous ce qui est liée au compte mot de passe oublié, token etc ...
 */

exports.Index = (req, res) => {
  res.render("../views/pages/index");
};

exports.Result = async (req, res) => {
  let watches;
  if (req.query.next) {
    watches = await axios.get(`${req.query.next}&offset=${req.query.offset}`+ (req.query.search ? `&search=${req.query.search}`: ""));
  } else if (req.query.previous) {
    watches = await axios.get(`${req.query.previous}&offset=${req.query.offset}`+ (req.query.search ? `&search=${req.query.search}`: ""));
  } else {
    watches = await axios.get(url + (req.query.search ? "/search?search=" + req.query.search : "/articles"));
  }

  res.render("../views/pages/result", {
    lst: watches.data.articles,
    search: !!req.query.search
  });
};

exports.Login = (req, res) => {
  res.render("../views/pages/login");
};

exports.CreateAccount = (req, res) => {
  res.render("../views/pages/create-account");
};

exports.WatchDetail = async (req, res) => {
  let colorReq;
  let watchReq;
  let similarReq;
  watchReq = await axios.get(url + "/article/" + req.query.id);
  colorReq = await axios.get(url + "/color/" + req.query.id);
  similarReq = await axios.get(url + "/similar/" + req.query.id);
  res.render("../views/pages/detail", {
    watch: watchReq.data.article,
    color: colorReq.data.articlesId,
    similar: similarReq.data.articles,
  });
};

exports.LoginTreatment = async (req, res) => {
  const {name, password, remember} = req.body;
  console.log(name, password, remember)
  if (!name){
    res.redirect('/Index');
    return
  }
  let {username, email} = "";
  isValidEmail(name) ? email = name : username = name

  const response = await axios.post("http://localhost:4000/login", {username,password,email,remember});
  console.log(response.data.Token)
  maxAge = 24 * 60 * 60 * 1000 * remember ? 365 : 1;
  if (response.status === 200){
    res.cookie = ("Token",response.data.Token, {
      maxAge,
      httpOnly: true,
    })
  }else{
    console.log(response);
  }
  res.redirect('/Index');
}

exports.RegisterTreatment = async (req, res) => {
  const {username , password, email} = req.body;
  const response = await axios.post("http://localhost:4000/register", {username,password,email});
  console.log("register treatment "+response);
  res.redirect('/Index');
}

exports.SearchTreatment = async (req, res) => {
  const {search} = req.body;
  res.redirect(`/result?search=${search}`);
}

exports.forgotPasswordGet = async (req, res) => {
  res.render("../views/pages/forgotPassword");
}

exports.forgotPasswordPost = async (req, res) => {
  const {email} = req.body;
  if (!isValidEmail(email)){
    res.render("../views/pages/forgotPassword", {
      send: false
    });
  }else{
    const response = await axios.post("/forgetPassword", {email})
    console.log(response)
    res.render("../views/pages/forgotPassword", {
      send: response.status === 200
    });
  }
}

exports.resetPasswordGet = async (req, res) => {
  const token = req.query.token
  res.render("../views/pages/resetPassword",{
    token
  })
}

exports.resetPasswordPost = async (req, res) => {
  const {token} = req.params.token;
  const {password} = req.body;
  const response = await axios.post(url + "/resetPassword",{password}, {
    headers: {
      'Authorization': token,
      'Content-Type': 'application/json'
    }
  });
  console.log(response.data);
  res.render("../views/pages/index")
}

function isValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}