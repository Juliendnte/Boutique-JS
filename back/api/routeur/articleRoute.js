//Importation des modules
const express = require("express");
const routeur = express.Router();
const controllerArticle = require("../controller/article");
const validateToken = require("../middlewares/auth");

//Configuration des routes CRUD
routeur.get("/user", validateToken, controllerArticle.getUsers);
routeur.get("/user/:id",validateToken , controllerArticle.getUser);
routeur.post("/user",validateToken ,controllerArticle.postUser);
routeur.put("/user/:id",validateToken ,controllerArticle.putUser);
routeur.delete("/user/:id",validateToken ,controllerArticle.deleteUser);

//Exportation des routes
module.exports = routeur;