const mysql = require("mysql2");//Faire attention de bien install mysql2 est pas mysql simple
require('dotenv').config();

//Prend les données du .env et se connecte a l'utilisateur et va a la base de données choisie
const connection = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || "root",
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    connectionLimit: 10
});

connection.connect((err)=>{
    if (err) console.error(err);
    else console.log("Connection etablished");
});

module.exports = connection;