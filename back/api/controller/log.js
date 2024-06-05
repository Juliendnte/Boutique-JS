const crypto = require('crypto');
const log = require("../models/logModel");
const jwt = require('jsonwebtoken');
require("dotenv").config();

const jwtkey = process.env.JWT_KEY
const pepper = process.env.PEPPER//Difference entre pepper et salt et que le salt est dans la bdd et le pepper en local . Les deux servent a modifiée le mdp
const hashPassword = (password, salt) => {
    const hash = crypto.createHmac('sha512', salt);//Je set le hash a sha512 avec mon salt
    hash.update(password + pepper);//Je rajoute mon pepper au hashage du mdp
    const hashedPassword = hash.digest('hex');
    return {salt, hashedPassword};
};

class UserController {
    static async Register(req, res) {
        const { username, email, password } = req.body;
        if (!isValidEmail(email)){
            res.status(401).send({
                message: 'Email invalid',
                status: 401
            })
        }
        const Password  = hashPassword(password, crypto.randomBytes(16).toString('hex'));//hash mon password
        try{
            await log.register({username, email, Password});
            res.status(201).json({
                message : `User registered successfully`,
                status: 201
            })
        }catch (err){
            res.status(500).send({
                message:err,
                status:500
            })
        }
    }

    static async Login(req, res) {
        const { email, username , password ,remember} = req.body;
        try{
            let user
            if (username)
                user = await log.login(null,username);
            else if (isValidEmail(email))
                user = await log.login(email);
            else{
                return res.status(401).json({
                    message:`Invalid username, email or password`,
                    status: 401
                });
            }
            if (!user){
                return res.status(401).json({
                    message:`Invalid username, email or password`,
                    status: 401
                });
            }
            const hashedPassword = hashPassword(password, user.Salt);//Récupere le password hashé
            if (hashedPassword.hashedPassword === user.Pwd) {//Test s'il est egale au password de l'utilisateur a l'email donné par l'utilisateur
                const Token = jwt.sign({ Sub: user.Id }, jwtkey, { expiresIn: remember ? '365j':'24h' });//Me passe un token pendant 24h et le régle avec le jwtkey
                res.status(200).json({ Token });//Je renvoie un nouveau token a chaque login
            } else {
                return res.status(401).json({
                    message:`Invalid username, email or password`,
                    status: 401
                });
            }
        }catch (err){
            res.status(500).json({
                message:err,
                status:500
            });
        }
    }

    static async getUser(req, res) {
        res.status(200).json({
            message: 'User successfully found',
            status: 200,
            user: req.user
        })
    }
}


function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

module.exports = UserController;