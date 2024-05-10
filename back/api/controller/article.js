const article = require("../models/articleModel");
require('dotenv').config();
const baseUrl = process.env.BASE_URL;

exports.getArticles = async (req, res) =>{
    try {
        const articles = await article.getAllArticle(req.query);

        if (!articles){
            return res.status(404).json({
                message: `Articles not found`,
                status:404
            });
        }else{
            const offset = parseInt(req.query.offset) || 0;
            const limit = parseInt(req.query.limit) || 6;
            const href = baseUrl+"/article"
            return res.status(200).json({
                message: `Articles successfully found`,
                status: 200,
                articles: {
                    href,
                    offset,
                    limit,
                    next:`${href}?limit=${limit}&offset=${offset + limit}` ,
                    previous: `${href}?limit=${limit}&offset=${Math.max(0, offset - limit)}`,
                    total: Object.entries(articles).length,
                    items: articles
                }
            })
        }
    }catch (err){
        res.status(500).json({
            message:err.sqlMessage,
            status:500
        });
    }
}

exports.getArticle = async (req , res) =>{
    //const link = process.env.BASE_URL;
    const articleById = req.article;
    //articleById.Photo = `${link}/images/${articleById.Photo}`;

    return res.status(200).json({
        message: `Article with id ${req.params.id} successfully found`,
        status: 200,
        user: articleById
    })
};

exports.postArticle = async (req,res)=>{
    const { Name, Description, Price, Reduction, Stock } = req.body;

    if (!Name || !Description || !Price || !Reduction || !Stock) {
        return res.status(400).json({
            message: "Tous les champs (Name, Description, Price, Reduction, Stock) sont requis.",
            status:400
        });
    }
    try{
        const NewArticle = await article.createArticle({
            Name,
            Description,
            Price,
            Reduction,
            Stock
        })

        return res.status(201).json({
            message: `Article successfully create`,
            status: 201,
            user: NewArticle
        });
    }catch (err){
        res.status(500).json({
            message:err.sqlMessage,
            status:500
        });
    }
}

exports.putArticle = async (req,res)=>{
    const id  = req.params.id;
    const { Name, Description, Price, Reduction, Stock } = req.body;

    if (!Name || !Description || !Price || !Reduction || !Stock) {
        return res.status(400).json({
            message: "Tous les champs (Name, Description, Price, Reduction, Stock) sont requis.",
            status:400
        });
    }

    try {
        await article.updatePutArticle(id,{
            Name,
            Description,
            Price,
            Reduction,
            Stock
        });

        return res.status(200).json({
            message: `Article with id ${id} successfully updated`,
            status: 200,
        });

    }catch (err){
        res.status(500).json({
            message:err.sqlMessage,
            status:500
        })
    }
}

exports.patchArticle = async (req,res) =>{
    const id  = req.params.id;
    const body = req.body;
    if (!body || !Object.keys(body).some(key => ['Name', 'Description', 'Price', 'Reduction', 'Stock'].includes(key))) {
        return res.status(400).json({
            message: "Au moins un des champs (Name, Description, Price, Reduction, Stock) doit être modifié",
        });
    }
    try{
        await article.updatePatchArticle(id, body);
        return res.status(200).json({
            message: `Article with id ${id} successfully updated`,
            status: 200,
        });
    }catch (err){
        res.status(500).json({
            message:err.sqlMessage,
            status:500
        })
    }
}

exports.deleteArticle = async (req,res)=>{
    const id = req.params.id;
    try {
        await article.deleteArticle(id);
        return res.status(200).json({
            message: `Article with id ${id} successfully delete`,
            status: 200
        })

    }catch (err){
        res.status(500).json({
            message:err.sqlMessage,
            status:500
        });
    }
}

