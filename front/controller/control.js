const url = "http://localhost:4000";
const axios = require("axios");
const nodemailer = require('nodemailer');

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

function isValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}