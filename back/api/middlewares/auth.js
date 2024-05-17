require("dotenv").config()
const api_key = process.env.API_KEY;

function validateToken(req, res, next) {
    const token = req.get('Authorization');//Récupere le token

    if (!token) return res.status(401).send("Unauthorized")//S'il y en a pas
    else if (token !== api_key) return res.status(403).send("Forbidden")//S'il n'est pas bon
    else return next();//S'il est bon (next = passe au middleware suivant)
}

module.exports = validateToken;