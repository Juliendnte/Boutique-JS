const connection = require("../config/authBDD")//Pour se connecter a la base de données

class ArticleModel{
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

    static getAllArticle(query){
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM article `

            //S'il y a quelque chose dans la query
            if (!(Object.entries(query).length === 0)){
                const values = [];

                /*
                Un objet marche comme une map en clé valeur
                Name: Julien
                la clé est Name et la valeur Julien
                Ici je met la clé dans la requête sql, la valeur dans une liste qui remplacera les ?
                Et j'ai un index pour mettre un WHERE si il y a une query autre que limit ou offset
                Ma fonction ne marche que si le limit et offset sont a la fin comme en sql
                Voir le cours de Cyril sur moodle si pas compris
                 */
                Object.entries(query).forEach(([key, value], index) => {
                    if (key.toLowerCase() === "limit" || key.toLowerCase() === "offset"){
                        sql += `${key} ? `;
                        values.push(parseInt(value));
                    }else{
                        sql += index ===0 ? "WHERE ": "AND "
                        sql += `${key}=? `;
                        values.push(value);
                    }
                });
                connection.query(sql,values, (err, results)=> err ? reject(err) : resolve(results));
            }else{
                connection.query(sql, (err, results)=> err ? reject(err) : resolve(results));
            }

        });
    }

    static createArticle(newArticle){
        //newArticle est le json de l'article que l'on veut ajoutée
        return new Promise((resolve, reject) => {
            //dans les parenthèse ce sont les valeurs qu'un article doit avoir
            const sql = `INSERT INTO article (Marque, Model, Ref, Price,Fab, Dimension, Matiere, Color, Waterproof, Movement,Complications,Bracelet, Color_Bracelet, Availability, Reduction, Stock, Description) VALUES (?,?,?,?,?,?,?,?, ?, ?, ?, ?,?,?,?,?)`;
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

    static getImages(id){
        return new Promise((resolve, reject) => {
            //Je selectionne l'url de la photo , je suis positionné dans la article, je fait une jointure entre l'Id de mon article et l'id article de ma photo,
            //Quand l'id de l'article est égale a la valeur envoyé
            const sql = `SELECT photo.URL FROM article LEFT JOIN photo ON article.Id = photo.Id_Article WHERE article.Id = ?;`;

            connection.query(sql, id, (err, results)=> err ? reject(err) : resolve(results));
        });
    }
}

module.exports = ArticleModel;