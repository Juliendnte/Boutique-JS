const jwt = require('jsonwebtoken');
require("dotenv").config();
const jwt_key = process.env.JWT_KEY;

function validateToken(req, res, next) {
    const token = req.get('Authorization');//Récupere le token

    if (!token) return res.status(401).send("Unauthorized")//S'il y en a pas
    jwt.verify(token, jwt_key, (err, user) => {
        if (err) {
            return res.status(403).send("Forbidden");
        }
        req.user = user;
        next();
    });
}

module.exports = validateToken;