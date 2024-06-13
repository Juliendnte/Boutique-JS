const url = "http://localhost:4000";
const axios = require("axios");
let error = {
  message: "",
  status: 0,
};
/*
-Filtre
-Mieux sécurisé l'api (faire plus attention a ce que met l'utilisateur)
-Commenté le code et le synthétisé
*/

exports.Index = async (req, res) => {
  res.render("../views/pages/index", {
    connect: await getFav(req.cookies.Token),
  });
};

exports.MentionsLegales = async (req, res) => {
  res.render("../views/pages/mentions-legales", {
    connect: await getFav(req.cookies.Token),
  });
  error = {
    message: "",
    status: 0,
  };
};

exports.Basket = async (req, res) => {
  res.render("../views/pages/basket", {
    connect: await getFav(req.cookies.Token),
    error,
  });
  error = {
    message: "",
    status: 0,
  };
};

exports.Result = async (req, res) => {
  let watches;
  try {
    if (req.query.next) {
      watches = await axios.get(
        `${req.query.next}&offset=${req.query.offset}` +
          (req.query.search ? `&search=${req.query.search}` : "")
      );
    } else if (req.query.previous) {
      watches = await axios.get(
        `${req.query.previous}&offset=${req.query.offset}` +
          (req.query.search ? `&search=${req.query.search}` : "")
      );
    } else {
      watches = await axios.get(
        url +
          (req.query.search
            ? "/search?search=" + req.query.search
            : "/articles")
      );
    }
  } catch (err) {
    if (err.response.data.status !== 404) {
      error = {
        message: "Probleme serveur",
        status: 500,
      };
      res.redirect("/error500");
      return;
    } else {
      error = `Aucune montres trouvé pour ${req.query.search} `;
    }
  }
  try {
    res.render("../views/pages/result", {
      lst: watches.data.articles,
      search: !!req.query.search,
      connect: await getFav(req.cookies.Token),
      error: null,
    });
  } catch (err) {
    res.render("../views/pages/result", {
      lst: null,
      search: true,
      error: true,
      connect: await getFav(req.cookies.Token),
      message: error,
    });
  }
};

exports.Login = async (req, res) => {
  res.render("../views/pages/login", {
    error,
    connect: await getFav(req.cookies.Token),
  });
  error = {
    message: "",
    status: 0,
  };
};

exports.CreateAccount = async (req, res) => {
  res.render("../views/pages/create-account", {
    error,
    connect: await getFav(req.cookies.Token),
  });
  error = {
    message: "",
    status: 0,
  };
};

exports.Marque = async (req, res) => {
  const connect = await getFav(req.cookies.Token);

  try {
    const response = await axios.get(url + "/marque");
    res.render("../views/pages/marque", {
      marque: response.data.marque,
      connect,
    });
  } catch (err) {
    error = {
      message: "Probleme serveur",
      status: 500,
    };
    res.redirect("/error500");
  }
};

exports.WatchDetail = async (req, res) => {
  let colorReq;
  let watchReq;
  let similarReq;
  try {
    watchReq = await axios.get(url + "/article/" + req.query.id);
    colorReq = await axios.get(url + "/color/" + req.query.id);
    similarReq = await axios.get(url + "/similar/" + req.query.id);
  } catch (err) {
    if (err.watchReq) {
      error.message = err.watchReq.data.message;
      error.status = err.watchReq.data.status;
    } else if (err.colorReq) {
      error.message = err.colorReq.data.message;
      error.status = err.colorReq.data.status;
    } else if (err.similarReq) {
      error.message = err.similarReq.data.message;
      error.status = err.similarReq.data.status;
    } else {
      error = {
        message: "Probleme serveur",
        status: 500,
      };
    }
    res.redirect("/error500");
    return;
  }
  const like = await getFavId(req.cookies.Token, watchReq.data.article.Id);
  const connect = await getFav(req.cookies.Token);
  res.render("../views/pages/detail", {
    watch: watchReq.data.article,
    color: colorReq.data.articlesId,
    similar: similarReq.data.articles,
    like,
    connect,
  });
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
    if (response.status === 200) {
      res.cookie("Token", response.data.Token, {
        maxAge: maxAge,
        httpOnly: true,
        secure: false,
        sameSite: "Lax",
      });
    } else {
      error.message = response.data.message;
      error.status = response.data.status;
      res.redirect("/login");
      return;
    }
  } catch (err) {
    error.message = err.response.data.message;
    error.status = err.response.data.status;
    res.redirect("/login");
    return;
  }
  res.redirect("/Index");
};

exports.RegisterTreatment = async (req, res) => {
  const { username, password, email } = req.body;
  try {
    const response = await axios.post(url + "/register", {
      username,
      password,
      email,
    });
    if (response.data.status === 201) {
      res.redirect("/Index");
      return;
    } else {
      error.message = response.data.message;
      error.status = response.data.status;
    }
  } catch (err) {
    error.message = err.response.data.message;
    error.status = err.response.data.status;
  }
  res.redirect("/create-account");
};

exports.SearchTreatment = (req, res) => {
  const { search } = req.body;
  res.redirect(`/result?search=${search}`);
};

exports.forgotPasswordGet = async (req, res) => {
  res.render("../views/pages/forgotPassword", {
    send: null,
    connect: await getFav(req.cookies.Token),
  });
};

exports.forgotPasswordPost = async (req, res) => {
  const { email } = req.body;
  if (!isValidEmail(email)) {
    res.render("../views/pages/forgotPassword", {
      send: false,
    });
  } else {
    try{
      const response = await axios.post("http://localhost:4000/forgotPassword", {
        email,
      });
      res.render("../views/pages/forgotPassword", {
        send: response.status === 200,
        connect: await getFav(req.cookies.Token),
      });
    }catch (err) {
      res.render("../views/pages/forgotPassword", {
        send: false,
        connect: await getFav(req.cookies.Token),
      });
    }
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

exports.User = async (req, res) => {
  const token = req.cookies.Token;

  try {
    const user = await axios.get(url + "/user", {
      headers: {
        Authorization: token,
        "Content-Type": "application/json",
      },
    });
    const fav = await getFav(token);
    const commande = await axios.get(url + "/commande", {
      headers: {
        Authorization: token,
        "Content-Type": "application/json",
      },
    });
    res.render("../views/pages/user", {
      fav: fav.data ? fav.data.Favoris : null,
      commande,
      connect: await getFav(req.cookies.Token),
      user: user.data,
    });
  } catch (err) {
    error.message = err.response.data.message;
    error.status = err.response.data.status;
    res.redirect("/login");
  }
};

exports.AjoutFav = async (req, res) => {
  const id = req.params.id;
  const token = req.cookies.Token;
  const headers = {
    Authorization: token,
    "Content-Type": "application/json",
  };
  try {
    (await getFavId(token, id))
      ? await axios.delete(`${url}/fav/${id}`, { headers })
      : await axios.get(`${url}/fav/${id}`, { headers });
  } catch (err) {
    try {
      error.message = err.response.data.message;
      error.status = err.response.data.status;
    } catch (err) {
      error = {
        message: "Probleme serveur",
        status: 500,
      };
      res.redirect("/error500");
      return;
    }
  }
  res.redirect(`back`);
};

exports.Logout = async (req, res) => {
  res.clearCookie("Token");
  res.redirect("/index");
};

exports.Payemenent = async (req, res) => {
  const { cb, date, cvc, price } = req.body;
  const card = {
    number: cb.replace(/\s/g, ""),
    expiration_date: date,
    cvc,
  };
  const payment_intent = {
    price: parseInt(price),
  };
  try {
    await axios.post(
      "https://challenge-js.ynovaix.com/payment",
      { card, payment_intent },
      {
        headers: {
          Authorization: "2f107ff8-9f12-4d22-92ec-cc2f553b67d3",
          "Content-Type": "application/json",
        },
      }
    );
    await axios.get(url + "/commande");
    res.render("../views/pages/kichta", { price });
  } catch (err) {
    console.log(err);
    error.message = err.response.data.message;
    error.status = err.response.data.status;
    res.redirect("/basket");
  }
};

async function getFavId(token, id) {
  try {
    const response = await axios.get(url + "/fav", {
      headers: {
        Authorization: token,
        "Content-Type": "application/json",
      },
    });

    for (const fav of response.data.Favoris) {
      if (fav.Id == id) {
        return true;
      }
    }
    return false;
  } catch (e) {
    return e.response.data.status ? false : null;
  }
}

async function getFav(token) {
  try {
    return await axios.get(url + "/fav", {
      headers: {
        Authorization: token,
        "Content-Type": "application/json",
      },
    });
  } catch (e) {
    return e.response.data.status ? false : null;
  }
}

function isValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}
