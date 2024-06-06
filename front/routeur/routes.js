const express = require("express");
const routeur = express.Router();
const controller = require("../controller/control");

routeur.get("/index", controller.Index);
routeur.get("/result", controller.Result);
routeur.get("/login", controller.Login);
routeur.get("/create-account", controller.CreateAccount);
routeur.get("/detail", controller.WatchDetail);

module.exports = routeur;
