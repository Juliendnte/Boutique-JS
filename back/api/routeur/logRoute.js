const express = require("express");
const routeur = express.Router();
const controllerLog = require("../controller/log");
const middleware = {
    validateToken : require("../middlewares/auth") ,
    articleExists: require("../middlewares/articleExist")
};

routeur.post("/login", controllerLog.Login);
routeur.post("/register", controllerLog.Register);

module.exports = routeur;