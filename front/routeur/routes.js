const express = require("express");
const routeur = express.Router();
const controller = require("../controller/control");

routeur.get("/index", controller.Index);
routeur.get("/result", controller.Result);
routeur.get("/detail", controller.WatchDetail);
routeur.get("/basket", controller.Basket);
routeur.get("/user", controller.User);
routeur.get("/marque", controller.Marque);
routeur.get("/mentionslegales", controller.MentionsLegales);

routeur.get("/login", controller.Login);
routeur.get("/create-account", controller.CreateAccount);
routeur.post("/treatment/login", controller.LoginTreatment);
routeur.post("/treatment/register", controller.RegisterTreatment);
routeur.get("/forgotPassword", controller.forgotPasswordGet);
routeur.post("/forgotPassword", controller.forgotPasswordPost);
routeur.get("/resetPassword", controller.resetPasswordGet);
routeur.post("/resetPassword/:token", controller.resetPasswordPost);
routeur.get("/logOut", controller.Logout);
routeur.get("/ajoutFav/:id", controller.AjoutFav);

routeur.post("/search", controller.SearchTreatment);
routeur.get("/confirmed", controller.Confirm);
routeur.post("/payement", controller.Payemenent);
routeur.get("/:blabla", controller.Error);

module.exports = routeur;
