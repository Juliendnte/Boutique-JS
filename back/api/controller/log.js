const crypto = require('crypto');
const log = require("../models/logModel");
const jwt = require('jsonwebtoken');
require("dotenv").config();

const jwtkey = process.env.JWT_KEY
const pepper = process.env.PEPPER
const hashPassword = (password, salt) => {
    const hash = crypto.createHmac('sha512', salt);
    hash.update(password + pepper);
    const value = hash.digest('hex');
    return {
        salt: salt,
        hashedPassword: value
    };
};

exports.Register = async (req, res) =>{
    const { username, email, password } = req.body;
    const salt = crypto.randomBytes(16).toString('hex')
    const hashedPassword  = hashPassword(password, salt);
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
        const hashedPassword = hashPassword(password, user.Salt);
        if (hashedPassword === user.Pwd) {
            const accessToken = jwt.sign({ email: user.Email }, jwtkey, { expiresIn: '24h' });
            res.status(200).json({ accessToken });
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