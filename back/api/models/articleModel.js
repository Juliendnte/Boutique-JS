const connection = require("../config/authBDD")
const {resolve} = require("path");
const {reject} = require("nodemailer/.ncurc");
//Pour se connecter a la base de données

class ArticleModel{

    total = 0;

    static getArticleById(id){
        /*
         Les promesses permettent un chaînage fluide, une gestion centralisée des erreurs, et sont compatibles avec la syntaxe async/await.
         Cela conduit à un code plus propre, plus lisible et plus maintenable.
         */
        return new Promise((resolve, reject) => {
            const sql = `SELECT
                                     a.Id,
                                     a.Description,
                                     marque.Label AS marque,
                                     a.Model,
                                     a.Ref,
                                     fabrication.Label AS fab,
                                     a.Dimension,
                                     matiere.Label AS matiere,
                                     color.Label AS color,
                                     movement.Label AS movement,
                                     a.Complications,
                                     a.Waterproof,
                                     bracelet.Label AS bracelet,
                                     color_bracelet.Label AS color_Bracelet,
                                     a.Availability,
                                     a.Price,
                                     a.Reduction,
                                     a.Stock
                                FROM 
                                    article a
                                    LEFT JOIN marque ON a.Id_Marque = marque.Id
                                    LEFT JOIN fabrication ON a.Id_Fab = fabrication.Id
                                    LEFT JOIN matiere ON a.Id_Matiere = matiere.Id
                                    LEFT JOIN color ON a.Id_Color = color.Id
                                    LEFT JOIN movement ON a.Id_Movement = movement.Id
                                    LEFT JOIN bracelet ON a.Id_Bracelet = bracelet.Id
                                    LEFT JOIN color_bracelet ON a.Id_Color_Bracelet = color_bracelet.Id
                                WHERE 
                                    a.Id=?`//Le ? sert a contrer l'injection SQL
            //[id] va remplacert le ? s'il y a plus que un ? il va remplacer dans l'ordre des variables dans cette liste
            connection.query(sql,[id], (err, results)=> err ? reject(err) : resolve(results[0]));
        });
    }

    static getAllArticle(query) {
        return new Promise(async (resolve, reject) => {
            // Requête SQL de base pour récupérer tous les articles avec la première image
            let sql = `
                SELECT
                    a.Id,
                    marque.Label AS marqueLabel,
                    a.Model,
                    a.Availability,
                    a.Price,
                    a.Reduction,
                    a.Stock
                FROM
                    article a
                    LEFT JOIN marque ON a.Id_Marque = marque.Id
                    LEFT JOIN fabrication ON a.Id_Fab = fabrication.Id
                    LEFT JOIN matiere ON a.Id_Matiere = matiere.Id
                    LEFT JOIN color ON a.Id_Color = color.Id
                    LEFT JOIN movement ON a.Id_Movement = movement.Id
                    LEFT JOIN bracelet ON a.Id_Bracelet = bracelet.Id
                    LEFT JOIN color_bracelet ON a.Id_Color_Bracelet = color_bracelet.Id
            `;

            const values = [];
            let whereClauses = [];
            let limitClause = "";
            let offsetClause = "";

            // Construire les clauses WHERE, LIMIT et OFFSET
            Object.entries(query).forEach(([key, value]) => {
                if (key.toLowerCase() === "limit") {
                    limitClause = ` LIMIT ?`;
                    values.push(parseInt(value));
                } else if (key.toLowerCase() === "offset") {
                    offsetClause = ` OFFSET ?`;
                    values.push(parseInt(value));
                } else {
                    const valuesArray = value.split(',');
                    const placeholders = valuesArray.map(() => '?').join(',');
                    whereClauses.push(valuesArray.length > 1 ? `${key} IN (${placeholders})` : `${key} = ?`);
                    values.push(...valuesArray);
                }
            });

            // Ajouter les clauses WHERE à la requête SQL
            if (whereClauses.length > 0) {
                sql += ' WHERE ' + whereClauses.join(' AND ');
            }

            // Utilise la même requête sans limit ni offset
            this.total = (await this.getTotal(sql, values.slice(0, values.length - (limitClause ? 1 : 0) - (offsetClause ? 1 : 0)))).total;

            // Ajouter limit et offset à la requête principale
            sql += limitClause + offsetClause;

            // Exécuter la requête avec les valeurs
            connection.query(sql, values, (err, results) => err ? reject(err) : resolve(results));
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

    static search(query){
        return new Promise(async (resolve,reject)=>{
            const searchParam = `%${query.search}%`;
            let values = [searchParam, searchParam, searchParam, query.limit, query.offset]
            let sql = `
                        SELECT
                            a.Id,
                            marque.Label AS marqueLabel,
                            a.Model,
                            a.Availability,
                            a.Price,
                            a.Reduction,
                            a.Stock
                        FROM
                           article a
                           LEFT JOIN marque ON a.Id_Marque = marque.Id
                           LEFT JOIN fabrication ON a.Id_Fab = fabrication.Id
                           LEFT JOIN matiere ON a.Id_Matiere = matiere.Id
                           LEFT JOIN color ON a.Id_Color = color.Id
                           LEFT JOIN movement ON a.Id_Movement = movement.Id
                           LEFT JOIN bracelet ON a.Id_Bracelet = bracelet.Id
                           LEFT JOIN color_bracelet ON a.Id_Color_Bracelet = color_bracelet.Id  
                        WHERE
                           (marque.Label LIKE ? OR a.Model LIKE ? OR a.Ref LIKE ?)`;
            this.total = (await this.getTotal(sql, values.slice(0, values.length - 2))).total;
            sql += " LIMIT ? OFFSET ? "

            connection.query(sql,values,(err,results)=> err ? reject(err) : resolve(results));
        });
    }

    static getAllFav(id){
        return new Promise((resolve,reject)=>{
            const sql = `SELECT a.* FROM favoris f JOIN article a ON f.Id_article = a.Id WHERE f.Id_user = ?;`
            connection.query(sql, id, (err, results)=> err ? reject(err) : resolve(results));
        })
    }

    static getAllCommande(id){
        return new Promise((resolve,reject)=>{
            const sql = `SELECT a.* FROM commande c JOIN article a ON c.Id_article = a.Id WHERE c.Id_user = ?;`
            connection.query(sql, id, (err, results)=> err ? reject(err) : resolve(results));
        })
    }

    static postFav(userId, articleId){
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO favoris (Id_user, Id_article) VALUES(?,?)`;
            connection.query(sql,[userId, articleId],(err,results)=> err ? reject(err) : resolve(results[0]));
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

    static getImages(id, test= false){
        return new Promise((resolve, reject) => {
            //Je selectionne l'url de la photo , je suis positionné dans la article, je fait une jointure entre l'Id de mon article et l'id article de ma photo,
            //Quand l'id de l'article est égale a la valeur envoyé
            let sql = `SELECT photo.URL FROM article LEFT JOIN photo ON article.Id = photo.Id_Article WHERE article.Id = ?`;
            if (test){
                sql += " LIMIT 2 OFFSET 0"
            }
            connection.query(sql, id, (err, results)=> err ? reject(err) : resolve(results));
        });
    }

    static getTotal(sql, values) {
        return new Promise((resolve, reject) => {
            const countSql = `SELECT COUNT(*) AS total FROM (${sql}) AS subquery`;
            connection.query(countSql, values, (err, results) => err ? reject(err) : resolve(results[0]));
        });
    }

    static getArticleSimilaire(id,limit) {
        return new Promise((resolve, reject) => {
            const sql = `
                            SELECT
                                a.Id,
                                marque.Label AS marqueLabel,
                                a.Model,
                                a.Availability,
                                a.Price,
                                a.Reduction,
                                a.Stock,
                                (
                                    (a.Dimension = b.Dimension) +
                                    (a.Id_Matiere = b.Id_Matiere) +
                                    (a.Id_Color = b.Id_Color) +
                                    (a.Id_Movement = b.Id_Movement) +
                                    (a.Complications = b.Complications) +
                                    (a.Waterproof = b.Waterproof) +
                                    (a.Id_Bracelet = b.Id_Bracelet) +
                                    (a.Id_Color_Bracelet = b.Id_Color_Bracelet) +
                                    (1 - ABS(a.Price - b.Price) / GREATEST(a.Price, b.Price))
                                ) AS similarity_score
                            FROM 
                                article a
                                LEFT JOIN marque ON a.Id_Marque = marque.Id
                                JOIN article b ON a.Id <> b.Id
                            WHERE b.Id = ?
                            ORDER BY similarity_score DESC
                            LIMIT ?`;
            connection.query(sql, [id, limit], (err, results) => err ? reject(err) : resolve(results));
        });
    }

    static getArticlesColor(path){
        return new Promise((resolve, reject) => {
            path += "%";
            const sql = `
                WITH RankedPhotos AS (
                    SELECT
                        p.Id_Article,
                        p.URL,
                        ROW_NUMBER() OVER (PARTITION BY p.Id_Article ORDER BY p.URL) AS rn
                    FROM
                        photo p
                    WHERE
                        p.URL LIKE ?
                )
                SELECT
                    Id_Article AS Id,
                    URL
                FROM
                    RankedPhotos
                WHERE
                    rn = 1;

            `
            connection.query(sql,path,(err, results)=> err ? reject(err) : resolve(results));
        })
    }

    static getMarque(){
        return new Promise((resolve, reject) => {
            const sql = `SELECT Label FROM marque`
            connection.query(sql, (err, results)=> err ? reject(err) : resolve(results));
        });
    }
}

module.exports = ArticleModel;