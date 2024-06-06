const url = "http://localhost:4000";
const axios = require("axios");

exports.Index = (req, res) => {
  res.render("../views/pages/index");
};

exports.Result = async (req, res) => {
  let watches;
  if (req.query.next) {
    watches = await axios.get(req.query.next + "&offset=" + req.query.offset);
  } else if (req.query.previous) {
    watches = await axios.get(
      req.query.previous + "&offset=" + req.query.offset
    );
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

exports.WatchDetail = async (req, res) => {
  let colorReq;
  let watchReq;
  let similarReq;
  watchReq = await axios.get(url + "/article/" + req.query.id);
  colorReq = await axios.get(url + "/color/" + req.query.id);
  similarReq = await axios.get(url + "/similar/" + req.query.id);
  console.log(watchReq.data.article);
  console.log(colorReq.data.articlesId);
  console.log(similarReq.data.articles);
  res.render("../views/pages/detail", {
    watch: watchReq.data.article,
    color: colorReq.data.articlesId,
    similar: similarReq.data.articles,
  });
};
