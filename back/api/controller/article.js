const article = require("../models/articleModel");
require('dotenv').config();

exports.getArticles = async (req, res) =>{
    try {
        const articles = await user.getAllArticle();
        console.log(articles)
        if (!articles){
            return res.status(404).json({
                message: `Articles not found`
            });
        }else{
            return res.status(200).json({
                message: `Articles successfully found`,
                articles
            })
        }
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        });
    }
}
/*
Pourquoi ne pas faire une seul fonction dynamique ou je met juste en paramètre la requête sql??
 */
exports.getArticle = async (req , res) =>{
    const id = req.params.id;
    const link = process.env.BASE_URL;
    try {
        const articleById = await article.getArticleById(id);
        articleById.Photo = `${link}/images/${articleById.Photo}`;
        if (!articleById){
            return res.status(404).json({
                message: `Article with id ${id} not found`
            });
        }else{
            return res.status(200).json({
                message: `Article with id ${id} successfully found`,
                user: articleById
            })
        }
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        });
    }
};

exports.postArticle = (req,res)=>{

}

exports.putArticle = (req,res)=>{

}


exports.deleteArticle = async (req,res)=>{
    const id = req.params.id;
    try {
        await article.deleteArticle(id);
        return res.status(200).json({
            message: `Article with id ${id} successfully delete`,
        })
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        });
    }
}

