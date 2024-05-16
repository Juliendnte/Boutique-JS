"use strict";

//Importation des modules
const express = require("express");
const cors = require("cors");//Middleware qui permet d'autoriser les requêtes HTTP d'origine différente du serveur
const path = require("path");//Pour travailler avec les chemins des fichiers

// Crée une application Express
const app = express();
app.use(cors());
app.use("/asset", express.static(path.join(__dirname, "./")));
/*
Configure votre application Express pour servir des fichiers statiques à partir du répertoire courant.
Lorsque le serveur reçoit une requête commençant par /asset, il recherche le fichier correspondant dans le répertoire spécifié et le renvoie au client.
Maintenant votre dossier asset est accessible depuis l'extérieur
 */
//Lire le body sous format JSON
app.use(express.json());
//Lire un formulaire
app.use(express.urlencoded({ extended: true }));

//Middleware qui applique une limite de requête pour toutes les routes
//Doit être faite obligatoirement au dessus des routes pour qu'elles soit affectés
const rateLimit = require("./middlewares/rate-limit");
app.use(rateLimit);

//Appel du routeur
const route = require("./routeur/articleRoute");
app.use(route);

module.exports = app;
