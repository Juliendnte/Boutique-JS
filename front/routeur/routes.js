const express = require("express");
const routeur = express.Router();
const controller = require("../controller/control");

routeur.get("/index", controller.Index);

module.exports = routeur;
