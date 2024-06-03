const url = "http://localhost:4000";
const axios = require("axios");

exports.Index = (req, res) => {
  res.render("../views/pages/index");
};

exports.Result = async (req, res) => {
  let watches;
  if (req.query.next) {
    watches = await axios.get(req.query.next+"&offset="+req.query.offset);
  } else if (req.query.previous) {
    watches = await axios.get(req.query.previous+"&offset="+req.query.offset);
  } else {
    watches = await axios.get(url + "/articles");
  }
  res.render("../views/pages/result", {
    lst: watches.data.articles,
  });
};

exports.Login = (req, res) => {
  res.render("../views/pages/login");
};

exports.CreateAccount = (req, res) => {
  res.render("../views/pages/create-account");
};
