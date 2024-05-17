const express = require("express");
const routeur = express.Router();
const controllerLog = require("../controller/log");

routeur.post("/login", controllerLog.Login);
routeur.post("/register", controllerLog.Register);

module.exports = routeur;