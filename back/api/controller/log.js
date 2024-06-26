const crypto = require('crypto');
const log = require("../models/logModel");
const jwt = require('jsonwebtoken');
const nodemailer = require("nodemailer")
require("dotenv").config();



const jwtkey = process.env.JWT_KEY
const pepper = process.env.PEPPER//Difference entre pepper et salt et que le salt est dans la bdd et le pepper en local . Les deux servent a modifiée le mdp
const hashPassword = (password, salt) => {
    const hash = crypto.createHmac('sha512', salt);//Je set le hash a sha512 avec mon salt
    hash.update(password + pepper);//Je rajoute mon pepper au hashage du mdp
    const hashedPassword = hash.digest('hex');
    return {salt, hashedPassword};
};
const transporter = nodemailer.createTransport({
    service: 'gmail',
    host: 'smtp.gmail.com',
    auth: {
        user: process.env.EMAIL,
        pass: process.env.PASSWORD
    }
});


class UserController {
    static async Register(req, res) {
        const { username, email, password } = req.body;
        if (!isValidEmail(email)){
            res.status(401).send({
                message: 'Email invalid',
                status: 401
            })
            return
        }else if (!username){
            res.status(401).send({
                message: 'Username invalid',
                status: 401
            })
        }
        const Password  = hashPassword(password, crypto.randomBytes(16).toString('hex'));//hash mon password
        try{
            await log.register({username, email, Password});
            res.status(201).send({
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
            if (isValidEmail(email))
                user = await log.login(email);
            else if (username)
                user = await log.login(null,username);
            else{
                return res.status(401).send({
                    message:`Invalid username, email or password`,
                    status: 401
                });
            }
            if (!user){
                return res.status(401).send({
                    message:`Invalid username, email or password`,
                    status: 401
                });
            }
            const hashedPassword = hashPassword(password, user.Salt);//Récupere le password hashé
            if (hashedPassword.hashedPassword === user.Pwd) {//Test s'il est egale au password de l'utilisateur a l'email donné par l'utilisateur
                const Token = jwt.sign({ Sub: user.Id }, jwtkey, { expiresIn: remember ? '365d':'24h' });//Me passe un token pendant 24h et le régle avec le jwtkey
                res.status(200).send({ Token });//Je renvoie un nouveau token a chaque login
            } else {
                return res.status(401).send({
                    message:`Invalid username, email or password`,
                    status: 401
                });
            }
        }catch (err){
            res.status(500).send({
                message:err,
                status:500
            });
        }
    }

    static async getUser(req, res) {
        try {
            const user = await log.getUserById(req.user.Sub);
            if (!user){
                res.status(404).send({
                    message: 'User not found',
                    status: 404
                })
            }else{
                res.status(200).send({
                    message: 'User successfully found',
                    status: 200,
                    user
                })
            }
        }catch (err){
            res.status(500).send({
                message : err,
                status: 500
            })
        }
    }

    static async ForgotPassword(req, res) {
        const { email } = req.body;
        try{
            const user = await log.getUserByEmail(email);
            if (!user) {
                return res.status(400).send({
                    message:'No user with that email',
                    status: 400
                });
            }
            const token = jwt.sign({ Sub: user.Id }, jwtkey, { expiresIn: '1h' });
            const resetURL = `http://localhost:3000/resetPassword?token=${token}`;

            await transporter.sendMail({
                from: process.env.EMAIL,
                to: user.Email,
                subject: '[Horo-Haven] Réinitialisation du mot de passe',
                html: `<p>Bonjour ${user.Name},</p>
                <p>Vous avez demandé à réinitialiser votre mot de passe.</p>
                <p>Cliquez sur ce <a href="${resetURL}">lien</a> pour réinitialiser votre mot de passe.</p>
                <p>Si vous n'avez pas fait cette demande, veuillez ignorer cet e-mail.</p>`
            });

            res.status(200).send({
                message: 'Password reset link has been sent to your email',
                status: 200
            });
        }catch (err){
            res.status(500).send({
                message:err,
                status:500
            });
        }
    }

    static async ResetPassword(req, res) {
        const { password } = req.body;
        try{
            const Password  = hashPassword(password, crypto.randomBytes(16).toString('hex'));//hash mon password
            await log.setPassword(Password, req.user.Sub)
            res.status(200).send({
                message : `Password updated successfully`,
                status: 200
            })
        }catch (err){
            res.status(500).send({
                message:err,
                status: 500
            })
        }
    }
}

function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

module.exports = UserController;