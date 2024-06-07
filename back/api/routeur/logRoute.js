const express = require("express");
const routeur = express.Router();
const UserController = require("../controller/log");
const middleware = {
    validateToken : require("../middlewares/auth")
};

routeur.post("/login", UserController.Login);
routeur.post("/register", UserController.Register);
routeur.post("/forgetPassword", UserController.ForgotPassword)
routeur.post("/resetPassword", middleware.validateToken, UserController.ResetPassword);
routeur.get("/user", middleware.validateToken, UserController.getUser)

module.exports = routeur;