const express = require("express");
const app = express();
app.use(express.json());//Lire le body sous format JSON
app.use(express.urlencoded({ extended: true }));//Lire un formulaire
module.exports = app;