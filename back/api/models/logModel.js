const connection = require("../config/authBDD")

class logModel{

    static login(email){
        return new Promise((resolve,reject)=>{
            const sql =`SELECT * FROM users WHERE Email = ?`;//Car email unique
            connection.query(sql,email, (err, results)=> err ? reject(err) : resolve(results[0]));
        });
    }

    static register(user){
        return new Promise((resolve,reject)=>{
            const sql = `INSERT INTO users (Name, Email, Pwd, Salt)VALUES(?,?,?,?)`;
            connection.query(sql,[user.username,user.email, user.hashedPassword, user.salt], (err, results)=> err ? reject(err) : resolve(results[0]));

        });
    }

    static getAllFav(id){
        return new Promise((resolve,reject)=>{
            const sql = `SELECT a.* FROM favoris f JOIN article a ON f.Id_article = a.Id WHERE f.Id_user = ?;`
            connection.query(sql, id, (err, results)=> err ? reject(err) : resolve(results[0]));
        })
    }

    static getAllCommande(id){
        return new Promise((resolve,reject)=>{
            const sql = `SELECT a.* FROM commande c JOIN article a ON c.Id_article = a.Id WHERE c.Id_user = ?;`
            connection.query(sql, id, (err, results)=> err ? reject(err) : resolve(results[0]));
        })
    }

    static postFav(userId, articleId){
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO favoris (Id_user,Id_article) VALUES(?,?)`;
            connection.query(sql,[userId,articleId],(err,results)=> err ? reject(err) : resolve(results[0]));
        })
    }

    static postCommande(userId, articleId, comment){
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO commande (Id_user,Id_article) VALUES(?,?)`;
            connection.query(sql, [userId, articleId],(err,results)=> err ? reject(err) : resolve(results[0]));
        })
    }
}

module.exports = logModel;