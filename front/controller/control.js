const url = "http://localhost:4000";
const axios = require("axios");
let error = {
  message : "",
  status: 0
}
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
-Surveiller quand il créer son compte qu'il met le même mdp
-Mieux sécurisé l'api (faire plus attention a ce que met l'utilisateur)
 */

exports.Index = (req, res) => {
  res.render("../views/pages/index");
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
    res.render("../views/pages/result",{
      err: watches.data.message
    });
    return
  }

  res.render("../views/pages/result", {
    lst: watches.data.articles,
    search: !!req.query.search
  });
};

exports.Login = (req, res) => {
  console.log(error)
  res.render("../views/pages/login", error);
  error = {
    message : "",
    status: 0
  }
};

exports.CreateAccount = (req, res) => {
  console.log(error)
  res.render("../views/pages/create-account", error);
  error = {
    message : "",
    status: 0
  }
};

exports.WatchDetail = async (req, res) => {
  let colorReq;
  let watchReq;
  let similarReq;
  try{
    watchReq = await axios.get(url + "/article/" + req.query.id);
    colorReq = await axios.get(url + "/color/" + req.query.id);
    similarReq = await axios.get(url + "/similar/" + req.query.id);
  }catch (err){
    if (watchReq.data.message){
      error.message = watchReq.data.message;
      error.status = watchReq.data.status;
    }else if (colorReq.data.message){
      error.message = colorReq.data.message;
      error.status = colorReq.data.status;
    }else{
      error.message = similarReq.data.message
      error.status = similarReq.data.status;
    }
    res.redirect("/");
    return
  }
  res.render("../views/pages/detail", {
    watch: watchReq.data.article,
    color: colorReq.data.articlesId,
    similar: similarReq.data.articles,
  });
};

exports.LoginTreatment = async (req, res) => {
  const {name, password, remember} = req.body;
  if (!name){
    error.message = "Le champs username/Email doit être remplie"
    error.status = 401;
    res.redirect('/login');
    return
  }
  let {username, email} = "";
  isValidEmail(name) ? email = name : username = name

  try{
    const response = await axios.post(url + "/login", {username,password,email,remember});
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
  const response = await axios.post(url + "/register", {username,password,email});
  if (response.data === 201){
    res.redirect('/Index')
  }else{
    error.message = response.data.message
    error.status = response.data.status
    res.redirect("/create-account")
  }
}

exports.SearchTreatment = async (req, res) => {
  const {search} = req.body;
  res.redirect(`/result?search=${search}`);
}

exports.forgotPasswordGet = async (req, res) => {
  res.render("../views/pages/forgotPassword", {
    send : null
  });
}

exports.forgotPasswordPost = async (req, res) => {
  const {email} = req.body;
  if (!isValidEmail(email)){
    res.render("../views/pages/forgotPassword", {
      send: false
    });
  }else{
    const response = await axios.post("http://localhost:4000/forgotPassword", {email})
    console.log(response.data)
    res.render("../views/pages/forgotPassword", {
      send: response.status === 200
    });
  }
}

exports.resetPasswordGet = async (req, res) => {
  const token = req.query.token;
  res.render("../views/pages/resetPassword",{
    token
  })
}

exports.resetPasswordPost = async (req, res) => {
  const token = req.params.token;
  const {password} = req.body;
  const response = await axios.post(url + "/resetPassword",{password}, {
    headers: {
      'Authorization': token,
      'Content-Type': 'application/json'
    }
  });
  console.log(response.data);
  res.redirect("/Index")
}

exports.Error = async (req, res) => {
  error = {
    message : error.message ? error.message : "Nous ne trouvons pas la page que vous recherchez.",
    status: error.status? error.status: 404
  }
  res.render("../views/pages/error", error);
  error = {
    message : "",
    status: 0
  }
}

function isValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}