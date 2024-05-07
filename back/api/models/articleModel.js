const connection = require("../config/authBDD")

class ArticleModel{
    static getArticleById(id){
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM article WHERE Id=?`
            connection.query(sql,[id], (err, results)=>{
                err ? reject(err) : resolve(results[0]);
            });
        });
    }

    static getAllArticle(){
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM article;`
            connection.query(sql, (err, results)=> {
                err ? reject(err) : resolve(results);
            });
        });
    }

    static createArticle(newArticle){
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO article (Name, Description, Price, Reduction, Stock) VALUES ?`;
            connection.query(sql, [newArticle.Name, newArticle.Description, newArticle.Price, newArticle.Reduction, newArticle.Stock], (err, results)=> {
                err ? reject(err) : resolve(results[0]);
            });
        });
    }

    static updateUser(id, updateArticle){
        return new Promise((resolve, reject) => {

        })
    }

    static deleteArticle(id){
        return new Promise((resolve, reject) => {
            const sql = `DELETE FROM article WHERE Id=?`
            connection.query(sql,[id], (err)=> {
                if (err) reject(err)
            })
        })
    }
}

module.exports = ArticleModel;