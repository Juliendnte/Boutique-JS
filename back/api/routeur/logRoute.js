const express = require("express");
const routeur = express.Router();
const controllerLog = require("../controller/log");
const middleware = {
    validateToken : require("../middlewares/auth") ,
    articleExists: require("../middlewares/articleExist")
};

routeur.post("/login", controllerLog.Login);
routeur.post("/register", controllerLog.Register);
routeur.get("/fav",middleware.validateToken,controllerLog.getAllFav)
routeur.post("/fav/:id",[middleware.validateToken,middleware.articleExists], controllerLog.postFavoris)
routeur.get("/commande", middleware.validateToken, controllerLog.getAllCommande)
routeur.post("/commande/:id",[middleware.validateToken,middleware.articleExists],controllerLog.postComande);

module.exports = routeur;