//Importation des modules
const express = require("express");
const routeur = express.Router();
const controllerArticle = require("../controller/article");
const middleware = {
    validateToken : require("../middlewares/auth"),
    articleExists : require("../middlewares/articleExist"),
    bodyParser : require("../middlewares/bodyParser"),
}


//Configuration des routes CRUD
routeur.get("/article", controllerArticle.getArticles);
routeur.get("/article/:id",middleware.articleExists , controllerArticle.getArticle);
routeur.post("/article",[middleware.validateToken, middleware.bodyParser] ,controllerArticle.postArticle);
routeur.put("/article/:id",[middleware.validateToken, middleware.articleExists, middleware.bodyParser] ,controllerArticle.putArticle);
routeur.patch("/article/:id",[middleware.validateToken, middleware.articleExists, middleware.bodyParser] ,controllerArticle.patchArticle);
routeur.delete("/article/:id",[middleware.validateToken, middleware.articleExists] ,controllerArticle.deleteArticle);

//Exportation des routes
module.exports = routeur;