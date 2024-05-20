const connection = require("../config/authBDD")
//Pour se connecter a la base de données

class ArticleModel{

    total = 0;

    static getArticleById(id){
        /*
         Les promesses permettent un chaînage fluide, une gestion centralisée des erreurs, et sont compatibles avec la syntaxe async/await.
         Cela conduit à un code plus propre, plus lisible et plus maintenable.
         */
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM article WHERE Id=?`//Le ? sert a contrer l'injection SQL
            //[id] va remplacert le ? s'il y a plus que un ? il va remplacer dans l'ordre des variables dans cette liste
            connection.query(sql,[id], (err, results)=> err ? reject(err) : resolve(results[0]));
        });
    }

    static getAllArticle(query) {
        return new Promise(async (resolve, reject) => {
            // Requête SQL de base pour récupérer tous les articles avec la première image
            let sql = `SELECT a.*, p.URL AS Image_URL FROM article a LEFT JOIN (SELECT Id_Article, MIN(Id) AS Min_Id FROM photo GROUP BY Id_Article) mp ON a.Id = mp.Id_Article LEFT JOIN photo p ON mp.Min_Id = p.Id`;

            const values = [];
            let whereClauses = [];
            let limitClause = "";
            let offsetClause = "";

            // S'il y a quelque chose dans la query
            if (Object.entries(query).length > 0) {
                Object.entries(query).forEach(([key, value]) => {
                    if (key.toLowerCase() === "limit") {
                        // Gérer limit
                        limitClause = ` LIMIT ?`;
                        values.push(parseInt(value));
                    } else if (key.toLowerCase() === "offset") {
                        // Gérer offset
                        offsetClause = ` OFFSET ?`;
                        values.push(parseInt(value));
                    } else {
                        // Gérer les autres clés
                        const valuesArray = value.split(',');
                        const placeholders = valuesArray.map(() => '?').join(',');

                        if (valuesArray.length > 1) {
                            whereClauses.push(`${key} IN (${placeholders})`);
                        } else {
                            whereClauses.push(`${key} = ?`);
                        }

                        values.push(...valuesArray);
                    }
                });

                if (whereClauses.length > 0) {
                    sql += ' WHERE ' + whereClauses.join(' AND ');
                }
            }

            // Obtenir le total des articles sans limit et offset
            if (!this.total) {
                 // Utilise la même requête sans limit ni offset
                this.total = await this.getTotal(sql, values.slice(0, values.length - (limitClause ? 1 : 0) - (offsetClause ? 1 : 0)));
            }

            // Ajouter limit et offset à la requête principale
            sql += limitClause + offsetClause;

            // Exécuter la requête avec les valeurs
            connection.query(sql, values, (err, results) => err ? reject(err) : resolve(results));
        });
    }

    static createArticle(newArticle){
        //newArticle est le json de l'article que l'on veut ajoutée
        return new Promise((resolve, reject) => {
            //dans les parenthèse ce sont les valeurs qu'un article doit avoir
            const sql = `INSERT INTO article (Marque, Model, Ref, Price,Fab, Dimension, Matiere, Color, Waterproof, Movement,Complications,Bracelet, Color_Bracelet, Availability, Reduction, Stock, Description) VALUES (?,?,?,?,?,?,?,?, ?, ?,?,?, ?, ?,?,?,?)`;
            connection.query(sql, [newArticle.Marque, newArticle.Model, newArticle.Ref, newArticle.Price, newArticle.Fab, newArticle.Dimension, newArticle.Matiere, newArticle.Color, newArticle.Waterproof, newArticle.Movement,newArticle.Complications,newArticle.Bracelet, newArticle.Color_Bracelet, newArticle.Availability, newArticle.Reduction, newArticle.Stock, newArticle.Description], (err, results)=> err ? reject(err) : resolve(results[0]));
        });
    }

    static updatePutArticle(id, updateArticle){
        return new Promise((resolve, reject) => {
            //Faire attention a l'ordre ici
            const sql = `UPDATE article SET Marque=?, Model=?, Ref=?, Price=? ,Fab=? , Dimension=? , Matiere=? , Color=?, Waterproof=?, Movement=?,Complications=?,Bracelet=?, Color_Bracelet=?, Availability=?, Reduction=?, Stock=?, Description=? WHERE id=?`;
            const values =  [updateArticle.Marque, updateArticle.Model, updateArticle.Ref, updateArticle.Price, updateArticle.Fab, updateArticle.Dimension, updateArticle.Matiere, updateArticle.Color, updateArticle.Waterproof, updateArticle.Movement,updateArticle.Complications,updateArticle.Bracelet, updateArticle.Color_Bracelet, updateArticle.Availability, updateArticle.Reduction, updateArticle.Stock, updateArticle.Description, id];

            connection.query(sql, values, (err, results) => err ? reject(err) : resolve(results[0]));
        });
    }

    static updatePatchArticle(id, updateArticle){
        return new Promise((resolve, reject) => {
            let sql = `UPDATE article SET `;
            const values = [];

            /*
            entries est l'objet en liste de liste
            [
                ["Name","Julien],
                ["Project","Boutique"]
            ]
             */
            Object.entries(updateArticle).forEach(([key, value], index, entries) => {
                sql += `${key}=?`;
                values.push(value);
                if (index < entries.length - 1) {
                    sql += `, `;
                }
            });
            sql += ` WHERE id=?`;
            values.push(id);

            connection.query(sql, values, (err, results) => err ? reject(err) : resolve(results[0]));
        });
    }

    static deleteArticle(id){
        return new Promise((resolve, reject) => {
            const sql = `DELETE FROM article WHERE Id=?`

            connection.query(sql,id, (err,results)=> err ? reject(err) : resolve(results[0]))
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

    static postCommande(userId, articleId){
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO commande (Id_user,Id_article) VALUES(?,?)`;
            connection.query(sql, [userId, articleId],(err,results)=> err ? reject(err) : resolve(results[0]));
        })
    }

    static deleteFav(userID, articleId){
        return new Promise((resolve, reject) => {
            const sql = `DELETE FROM favoris WHERE Id_user=? AND Id_article=?`;

            connection.query(sql, [userID,articleId], (err, results)=> err ? reject(err) : resolve(results[0]));
        })
    }

    static deleteCommande(userID, articleId){
        return new Promise((resolve, reject) => {
            const sql = `DELETE FROM commande WHERE Id_user=? AND Id_article=?`;

            connection.query(sql, [userID,articleId], (err, results)=> err ? reject(err) : resolve(results[0]));
        })
    }

    static getImages(id, test= false){
        return new Promise((resolve, reject) => {
            //Je selectionne l'url de la photo , je suis positionné dans la article, je fait une jointure entre l'Id de mon article et l'id article de ma photo,
            //Quand l'id de l'article est égale a la valeur envoyé
            let sql = `SELECT photo.URL FROM article LEFT JOIN photo ON article.Id = photo.Id_Article WHERE article.Id = ?`;
            if (test){
                sql += " LIMIT 1 OFFSET 0;"
            }

            connection.query(sql, id, (err, results)=> err ? reject(err) : resolve(results));
        });
    }

    static async getTotal(sql, values) {
        return new Promise((resolve, reject) => {
            const countSql = `SELECT COUNT(*) AS total FROM (${sql}) AS subquery`;
            connection.query(countSql, values, (err, results) => err ? reject(err) : resolve(results[0]));
        });
    }
}

module.exports = ArticleModel;