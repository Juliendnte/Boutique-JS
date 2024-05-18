const crypto = require('crypto');
const log = require("../models/logModel");
const jwt = require('jsonwebtoken');
require("dotenv").config();

const jwtkey = process.env.JWT_KEY
const pepper = process.env.PEPPER//Difference entre pepper et salt et que le salt est dans la bdd et le pepper en local . Les deux servent a modifiée le mdp
const hashPassword = (password, salt) => {
    const hash = crypto.createHmac('sha512', salt);//Je set le hash a sha512 avec mon salt
    hash.update(password + pepper);//Je rajoute mon pepper au hashage du mdp
    const value = hash.digest('hex');
    return {
        salt: salt,
        hashedPassword: value
    };
};

exports.Register = async (req, res) =>{
    const { username, email, password } = req.body;
    const salt = crypto.randomBytes(16).toString('hex')//Prend un salt bien chiant
    const hashedPassword  = hashPassword(password, salt);//hash mon password
    try{
        await log.register({username, email, hashedPassword, salt});
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

exports.Login = async (req, res) =>{
    const { email, password } = req.body;
    try{
        const user = await log.login(email);
        if (!user){
            return res.status(401).json({
                message:`Invalid username or password`,
                status: 401
            });
        }
        const hashedPassword = hashPassword(password, user.Salt);//Récupere le password hashé
        if (hashedPassword === user.Pwd) {//Test s'il est egale au password de l'utilisateur a l'email donné par l'utilisateur
            const Token = jwt.sign({ email: user.Email }, jwtkey, { expiresIn: '24h' });//Me passe un token pendant 24h et le régle avec le jwtkey
            res.status(200).json({ Token });//Je renvoie un nouveau token a chaque login
        } else {
            return res.status(401).json({
                message:`Invalid username or password`,
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

exports.getAllFav = async (req,res)=>{
    const user = req.user;//Pris du middleware auth
    try{
        const Favoris = await log.getAllFav(user.Id);//Récupère tous les favoris a l'id de l'user
        if (!Favoris){
            return res.status(404).json({
                message:`None favori were found to the user at id ${user.Id}`,
                status: 404
            })
        }
        return res.status(200).json({
            message : "Favorite articles by user",
            status: 200,
            Favoris
        })
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        })
    }
}

exports.getAllCommande = async (req,res)=>{
    const userID = req.user.Id;
    try{
        const Commande = await log.getAllCommande(userID);
        if (!Commande){
            return res.status(404).json({
                message:`None command were found to the user at id ${userID}`,
                status: 404
            })
        }
        return res.status(200).json({
            message : "Command articles by user",
            status: 200,
            Commande
        })
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        })
    }
}

exports.postFavoris = async (req,res) =>{
    const userID = req.user.Id;
    const articleID = req.params.id;
    try{
        await log.postFav(userID, articleID);//L'user met en favoris l'article
        res.status(200).json({
            message : "Article successfully been in favoris",
            status: 200
        })
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        })
    }
}

exports.postComande = async (req,res) =>{
    const userID = req.user.Id;
    const articleID = req.params.id;
    try{
        await log.postCommande(userID, articleID);//L'user a mit dans l'historique de commande
        res.status(200).json({
            message : "Command successfully registered",
            status: 200
        })
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        })
    }
}