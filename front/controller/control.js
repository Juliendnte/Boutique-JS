const url = "http://localhost:4000";
const axios = require("axios");
const ErrorHandler = require("./ErrorHandler");

const errorHandler = new ErrorHandler();

/**
 * Render the index page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.Index = async (req, res) => {
  res.render("../views/pages/index", {
    connect: await getFav(req.cookies.Token),
  });
};

/**
 * Render the confirmation page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.Confirm = async (req, res) => {
  res.render("../views/pages/kichta", {
    connect: await getFav(req.cookies.Token),
  });
};

/**
 * Render the legal mentions page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.MentionsLegales = async (req, res) => {
  res.render("../views/pages/mentions-legales", {
    connect: await getFav(req.cookies.Token),
  });
};

/**
 * Render the basket page.
 * On this page you can see the watches that put in your basket and buy them.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.Basket = async (req, res) => {
  res.render("../views/pages/basket", {
    connect: await getFav(req.cookies.Token),
    error : errorHandler.getError(),
  });
  errorHandler.resetError();
};

/**
 * Render the result page
 * On this page you can search and have a pagination
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.Result = async (req, res) => {
  let watches;
  try {
    watches = await fetchWatches(req.query);
  } catch (err) {
    if (!err.response){
      errorHandler.handleServerError()
      return res.redirect("/error500");
    }
  }

  try {
    res.render("../views/pages/result", {
      lst: watches.data.articles,
      search: false,
      connect: await getFav(req.cookies.Token),
      error: null,
    });
  } catch (err) {
    errorHandler.setError(`Aucune montre trouvé pour la recherche ${req.query.search}`,404)
    res.render("../views/pages/result", {
      lst: null,
      search: true,
      error: true,
      connect: await getFav(req.cookies.Token),
      message: errorHandler.getError().message,
    });
  }
  errorHandler.resetError();
};

/**
 * Render the brand page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.Marque = async (req, res) => {
  const connect = await getFav(req.cookies.Token);
  try {
    const response = await axios.get(`${url}/marque`);
    res.render("../views/pages/marque", {
      marque: response.data.marque,
      connect,
    });
  } catch (err) {
    errorHandler.handleServerError();
    res.redirect("/error500");
  }
};

/**
 * Render the watch detail page.
 * On this page you can see a carousel, and other watches that can interest you
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.WatchDetail = async (req, res) => {
  const id = req.query.id;
  try {
    const [watchReq, colorReq, similarReq] = await Promise.all([
      axios.get(`${url}/article/${id}`),
      axios.get(`${url}/color/${id}`),
      axios.get(`${url}/similar/${id}`)
    ]);

    const like = await getFavId(req.cookies.Token, watchReq.data.article.Id);
    const connect = await getFav(req.cookies.Token);

    res.render("../views/pages/detail", {
      watch: watchReq.data.article,
      color: colorReq.data.articlesId,
      similar: similarReq.data.articles,
      like,
      connect,
    });
  } catch (err) {
    errorHandler.handleRequestError(err);
    res.redirect("/error500");
  }
};

/**
 * Render the login page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.Login = async (req, res) => {
  res.render("../views/pages/login", {
    error: errorHandler.getError(),
    connect: await getFav(req.cookies.Token),
  });
  errorHandler.resetError();
};

/**
 * Render the create account page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.CreateAccount = async (req, res) => {
  res.render("../views/pages/create-account", {
    error: errorHandler.getError(),
    connect: await getFav(req.cookies.Token),
  });
  errorHandler.resetError();
};

/**
 * Handle login form submission.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.LoginTreatment = async (req, res) => {
  const { name, password, remember } = req.body;
  if (!name) {
    errorHandler.setError("The username/Email field must be filled", 401);
    return res.redirect("/login");
  }

  const { username, email } = isValidEmail(name) ? { email: name } : { username: name };
  try {
    const response = await axios.post(`${url}/login`, {username, password, email, remember});

    if (response.status === 200) {
      res.cookie("Token", response.data.Token, {
        maxAge: remember ? 365 * 24 * 60 * 60 * 1000 : 24 * 60 * 60 * 1000,
        httpOnly: true,
        secure: false,
        sameSite: "Lax",
      });
      return res.redirect("/Index");
    } else {
      errorHandler.setError(response.data.message, response.data.status);
    }
  } catch (err) {
    errorHandler.handleRequestError(err);
  }
  res.redirect("/login");
};

/**
 * Handle register form submission.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.RegisterTreatment = async (req, res) => {
  const { username, password, email } = req.body;

  try {
    const response = await axios.post(`${url}/register`, { username, password, email });
    if (response.data.status === 201) {
      return res.redirect("/Index");
    } else {
      errorHandler.setError(response.data.message, response.data.status);
    }
  } catch (err) {
    errorHandler.handleRequestError(err);
  }
  res.redirect("/create-account");
};

/**
 * Render the forgot password page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.forgotPasswordGet = async (req, res) => {
  res.render("../views/pages/forgotPassword", {
    send: null,
    connect: await getFav(req.cookies.Token),
  });
};

/**
 * Handle forgot password form submission.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.forgotPasswordPost = async (req, res) => {
  const { email } = req.body;
  if (!isValidEmail(email)) {
    return res.render("../views/pages/forgotPassword", { send: false });
  }
  const connect= await getFav(req.cookies.Token)
  try {
    const response = await axios.post(`${url}/forgotPassword`, { email });
    res.render("../views/pages/forgotPassword", {
      send: response.status === 200,
      connect
    });
  } catch (err) {
    res.render("../views/pages/forgotPassword", {
      send: false,
      connect
    });
  }
};

/**
 * Render the reset password page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.resetPasswordGet = async (req, res) => {
  res.render("../views/pages/resetPassword", {
    token : req.query.token ,
    connect: await getFav(req.cookies.Token),
  });
};

/**
 * Handle reset password form submission.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.resetPasswordPost = async (req, res) => {
  const token = req.params.token;
  const { password } = req.body;

  try {
    await axios.post(`${url}/resetPassword`, { password },
        {headers:
              { Authorization: token,
                "Content-Type": "application/json"
              }
        });
    res.redirect("/Index");
  } catch (err) {
    errorHandler.handleRequestError(err);
    res.redirect("/resetPassword");
  }
};

/**
 * Render the user page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.User = async (req, res) => {
  const token = req.cookies.Token;
  try {
    const [user, commande, fav] = await Promise.all([
      axios.get(`${url}/user`, { headers: { Authorization: token, "Content-Type": "application/json" } }),
      axios.get(`${url}/commande`, { headers: { Authorization: token, "Content-Type": "application/json" } }),
      getFav(token),
    ]);

    res.render("../views/pages/user", {
      fav: fav.data ? fav.data.Favoris : null,
      commande,
      connect: fav,
      user: user.data,
    });
  } catch (err) {
    errorHandler.handleRequestError(err);
    res.redirect("/login");
  }
};

/**
 * Toggle favorite status for a watch.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.AjoutFav = async (req, res) => {
  const id = req.params.id;
  const token = req.cookies.Token;
  const headers = { Authorization: token, "Content-Type": "application/json" };

  try {
    const isFav = await getFavId(token, id);
    await (
        isFav
        ? axios.delete(`${url}/fav/${id}`, { headers })
        : axios.get(`${url}/fav/${id}`, { headers })
    )

  } catch (err) {
    errorHandler.handleRequestError(err);
    res.redirect("/error500");
    return;
  }
  res.redirect("back");
};

/**
 * Handle user logout.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.Logout = async (req, res) => {
  res.clearCookie("Token");
  res.redirect("/index");
};

/**
 * Handle search form submission.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.SearchTreatment = (req, res) => {
  const { search } = req.body;
  res.redirect(`/result?search=${search}`);
};

/**
 * Handle payment processing.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
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
    await axios.post("https://challenge-js.ynovaix.com/payment", { card, payment_intent },
        { headers:
              { Authorization: "2f107ff8-9f12-4d22-92ec-cc2f553b67d3",
                "Content-Type": "application/json"
              }
        });

    res.render("../views/pages/kichta", { price });
  } catch (err) {
    errorHandler.handleRequestError(err);
    res.redirect("/basket");
  }
};

/**
 * Render the error page.
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 */
exports.Error = (req, res) => {
  const error = errorHandler.getError();
  errorHandler.setError(error.message || "Nous n'avons pas trouvé la page que vous cherchez", error.status || 404)
  res.render("../views/pages/error", error);
  errorHandler.resetError();
};

/**
 * Get the favorites of the user by ID.
 * @param {string} token - User token.
 * @param {string} id - Favorite ID.
 * @returns {Promise<boolean|null>} Returns true if the favorite exists, false otherwise, null if not connected.
 */
async function getFavId(token, id) {
  try {
    const response = await axios.get(`${url}/fav`, {
      headers: {
        Authorization: token,
        "Content-Type": "application/json"
      }
    });
    return response.data.Favoris.some(fav => fav.Id == id);
  } catch (e) {
    try {
      return e.response.data.status ? false : null;
    }catch {
      return null;
    }
  }
}

/**
 * Get all the favorites of the user.
 * @param {string} token - User token.
 * @returns {Promise<axios.AxiosResponse<any>|boolean|null>} Returns all favorites, false if none, null if not connected.
 */
async function getFav(token) {
  try {
    return await axios.get(`${url}/fav`, {
      headers: {
        Authorization: token,
        "Content-Type": "application/json"
      }
    });
  } catch (e) {
    try {
      return e.response.data.status ? false : null;
    }catch {
      return null;
    }
  }
}

/**
 * Check if a string is a valid email.
 * @param {string} email - The string to check.
 * @returns {boolean} True if the string is a valid email, false otherwise.
 */
function isValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

/**
 * Fetch watches based on query parameters.
 * @param {Object} query - The query parameters.
 * @returns {Promise<axios.AxiosResponse<any>|null>} The response from the server.
 */
async function fetchWatches(query) {
  const baseUrl = url + (query.search ? `/search?search=${query.search}` : "/articles");
  const offsetParam = `&offset=${query.offset || 0}`;
  const searchParam = query.search ? `&search=${query.search}` : "";
  try {
    if (query.next) {
      return axios.get(`${query.next}${offsetParam}${searchParam}`);
    } else if (query.previous) {
      return axios.get(`${query.previous}${offsetParam}${searchParam}`);
    } else {
      return axios.get(baseUrl);
    }
  }catch (e) {
    return null
  }
}


