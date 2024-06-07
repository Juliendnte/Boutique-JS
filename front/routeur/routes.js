const express = require("express");
const routeur = express.Router();
const controller = require("../controller/control");

routeur.get("/index", controller.Index);
routeur.get("/result", controller.Result);
routeur.get("/login", controller.Login);
routeur.get("/create-account", controller.CreateAccount);
routeur.post("/treatment/login");
routeur.post("/treatment/register");
routeur.get("/detail", controller.WatchDetail);
routeur.post("/search", controller.SearchTreatment);
routeur.get("/forgotPassword", controller.forgotPasswordGet)
routeur.post("/forgotPassword", controller.forgotPasswordPost)
routeur.get("/resetPassword", controller.resetPasswordGet);
routeur.post("/resetPassword/:token", controller.resetPasswordPost);
/*
routeur.get("/basket");
routeur.get("/user");
routeur.get("/marque");
*/

module.exports = routeur;
