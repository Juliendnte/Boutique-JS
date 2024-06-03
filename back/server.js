"use strict";

//importation des modules
const app = require("./api/app");
require('dotenv').config(); //require('dotenv') est pour récupérer les fichiers .env et le .configure prend les variables et va les mettres dans process.env

//Port et nom domaine de l'api ce sont des valeurs du .env
const port = process.env.PORT || 4000;//Si process.env.PORT est vide il prend la valeur 4000
const host = process.env.HOST || 'localhost';

//lancement de l'api
try {
    app.listen(port, host, () => console.log(`Server listening on ${process.env.BASE_URL}`));
}catch(err){
    console.error(err);
}