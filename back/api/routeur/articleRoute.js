//Importation des modules
const express = require("express");
const routeur = express.Router();//Configure le module pour faire des routes
const controllerArticle = require("../controller/article");
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
routeur.patch("/article/:id",[middleware.validateToken, middleware.articleExists] ,controllerArticle.patchArticle);
routeur.get("/fav",middleware.validateToken,controllerArticle.getAllFav)
routeur.post("/fav/:id",[middleware.validateToken,middleware.articleExists], controllerArticle.postFavoris)
routeur.delete("/fav/:id",[middleware.validateToken,middleware.articleExists])
routeur.get("/commande", middleware.validateToken, controllerArticle.getAllCommande)
routeur.post("/commande/:id",[middleware.validateToken,middleware.articleExists],controllerArticle.postComande);
routeur.get("/search",controllerArticle.search)
routeur.get("/similar/:id", middleware.articleExists, controllerArticle.getArticleSimilar)

//Exportation des routes
module.exports = routeur;