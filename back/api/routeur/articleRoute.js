//Importation des modules
const express = require("express");
const routeur = express.Router();
const controllerArticle = require("../controller/article");
const validateToken = require("../middlewares/auth");

//Configuration des routes CRUD
routeur.get("/article", validateToken, controllerArticle.getArticles);
routeur.get("/article/:id",validateToken , controllerArticle.getArticle);
routeur.post("/article",validateToken ,controllerArticle.postArticle);
routeur.put("/article/:id",validateToken ,controllerArticle.putArticle);
routeur.delete("/article/:id",validateToken ,controllerArticle.deleteArticle);

//Exportation des routes
module.exports = routeur;