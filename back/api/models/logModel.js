const connection = require("../config/authBDD")

class logModel{

    static login(email){
        return new Promise((resolve,reject)=>{
            const sql =`SELECT * FROM users WHERE Email = ?`;
            connection.query(sql,email, (err, results)=> err ? reject(err) : resolve(results[0]));
        });
    }

    static register(user){
        return new Promise((resolve,reject)=>{
            const sql = `INSERT INTO users (Name, Email, Pwd, Salt)VALUES(?,?,?,?)`;
            connection.query(sql,[user.username,user.email, user.hashedPassword, user.salt], (err, results)=> err ? reject(err) : resolve(results[0]));

        });
    }
}

module.exports = logModel;