"use strict";

//Importation des modules
const express = require('express');
const cors = require("cors");
const path = require("path");

// Crée une application Express
const app = express();
app.use(cors());
app.use("/asset", express.static(path.join(__dirname,"./")));
//Applique une limite de requête pour toutes les routes
const rateLimit = require("./middlewares/rate-limit");
app.use(rateLimit);

const route = require("./routeur/articleRoute");
app.use(route);

module.exports = app;