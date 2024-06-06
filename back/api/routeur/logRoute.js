const express = require("express");
const routeur = express.Router();
const UserController = require("../controller/log");
const middleware = {
    validateToken : require("../middlewares/auth")
};

routeur.post("/login", UserController.Login);
routeur.post("/register", UserController.Register);
routeur.get("/user", middleware.validateToken, UserController.getUser)

module.exports = routeur;