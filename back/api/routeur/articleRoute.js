//Importation des modules
const express = require("express");
const routeur = express.Router();//Configure le module pour faire des routes
const controllerArticle = require("../controller/article");//Appels des controllers avec dedans les fonctions des calls d'api
//Objet avec tous les middleware
const middleware = {
    validateToken : require("../middlewares/auth"),//Middleware vérifiant si l'utilisateur au token spécifiée a le droit d'accéder
    articleExists : require("../middlewares/articleExist")//Middleware verifiant si la donnée a l'id spécifiée existe
}

//Configuration des routes CRUD
//Get sert a lire des valeurs
//Post sert a envoyer le corp de sa requête pour créer une nouvelle donnée
//Put sert a modifier la donnée a l'id spécifiée en envoyant tous les attributs de la donnée dans le corp de la requête
//Patch sert a modifier la donnée a l'id spécifiée en envoyant seulement l'attribut(s) modifiées
//Delete sert a supprimer la donné a l'id spécifiée
routeur.get("/articles", controllerArticle.getArticles);
routeur.get("/article/:id",middleware.articleExists , controllerArticle.getArticle);
routeur.post("/article",middleware.validateToken ,controllerArticle.postArticle);
routeur.put("/article/:id",[middleware.validateToken, middleware.articleExists] ,controllerArticle.putArticle);
routeur.patch("/article/:id",[middleware.validateToken, middleware.articleExists] ,controllerArticle.patchArticle);
routeur.delete("/article/:id",[middleware.validateToken, middleware.articleExists] ,controllerArticle.deleteArticle);

//Exportation des routes
module.exports = routeur;