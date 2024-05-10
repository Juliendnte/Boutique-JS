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

    static getAllArticle(query){
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM article`
            if (!(Object.entries(query).length === 0)){
                const values = [];
                sql += " WHERE "
                Object.entries(query).forEach(([key, value], index, entries) => {
                    sql += `${key}=?`;
                    values.push(value);
                    if (index < entries.length - 1) {
                        sql += `, `;
                    }
                });
                console.log(sql);
                console.log(values)
                connection.query(sql,values, (err, results)=> {
                    err ? reject(err) : resolve(results);
                });
            }else{
                connection.query(sql, (err, results)=> {
                    err ? reject(err) : resolve(results);
                });
            }

        });
    }

    static createArticle(newArticle){
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO article (Name, Description, Price, Reduction, Stock) VALUES (?, ?, ?, ?, ?)`;
            connection.query(sql, [newArticle.Name, newArticle.Description, newArticle.Price, newArticle.Reduction, newArticle.Stock], (err, results)=> {
                err ? reject(err) : resolve(results[0]);
            });
        });
    }

    static updatePutArticle(id, updateArticle){
        return new Promise((resolve, reject) => {
            const sql = `UPDATE article SET Name=?, Description=?, Price=?, Reduction=?, Stock=? WHERE id=?`;
            const values = [updateArticle.Name, updateArticle.Description, updateArticle.Price, updateArticle.Reduction, updateArticle.Stock, id];

            connection.query(sql, values, (err, results) => {
                err ? reject(err) : resolve(results[0]);
            });
        });
    }

    static updatePatchArticle(id, updateArticle){
        return new Promise((resolve, reject) => {
            let sql = `UPDATE article SET `;
            const values = [];
            Object.entries(updateArticle).forEach(([key, value], index, entries) => {
                sql += `${key}=?`;
                values.push(value);
                if (index < entries.length - 1) {
                    sql += `, `;
                }
            });
            sql += ` WHERE id=?`;
            values.push(id);

            connection.query(sql, values, (err, results) => {
                err ? reject(err) : resolve(results[0]);
            });
        })
    }

    static deleteArticle(id){
        return new Promise((resolve, reject) => {
            const sql = `DELETE FROM article WHERE Id=?`
            connection.query(sql,[id], (err,results)=> {
                err ? reject(err) : resolve(results[0]);
            })
        })
    }
}

module.exports = ArticleModel;