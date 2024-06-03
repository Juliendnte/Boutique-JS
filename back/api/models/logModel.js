const connection = require("../config/authBDD")

class logModel{

    static login (email = null,username = null){
        return new Promise((resolve,reject)=>{
            let sql = ``
            if(email) {
                sql = `SELECT *
                       FROM users
                       WHERE Email = ?`;//Car email unique
                connection.query(sql,email, (err, results)=> err ? reject(err) : resolve(results[0]));
            }else {
                sql = `SELECT *
                       FROM users
                       WHERE Name = ?`;
                connection.query(sql,username, (err, results)=> err ? reject(err) : resolve(results[0]));
            }
        });
    }

    static register(user){
        return new Promise((resolve,reject)=>{
            const sql = `INSERT INTO users (Name, Email, Pwd, Salt, Adresse)VALUES(?,?,?,?,DEFAULT)`;
            connection.query(sql,[user.username,user.email, user.hashedPassword.hashedPassword, user.hashedPassword.salt], (err, results)=> err ? reject(err) : resolve(results[0]));
        });
    }
}

module.exports = logModel;