const article = require("../models/articleModel");
require('dotenv').config();
const baseUrl = process.env.BASE_URL;

exports.getArticles = async (req, res) =>{
    try {
        const articles = await article.getAllArticle(req.query);
        articles.forEach((article) => {
           article.Image_URL = `${baseUrl}/asset/${article.Image_URL}`;
        });
        const offset = parseInt(req.query.offset) || 0;
        const limit = parseInt(req.query.limit) || 6;
        const href = baseUrl+"/articles";
        const total = Object.entries(articles).length;

        const next = article.total === total ? null :  `${href}?limit=${limit}&offset=${offset + limit}`;
        const previous = offset ? `${href}?limit=${limit}&offset=${offset}` : null;

        if (!articles || total === 0){
            return res.status(404).json({
                message: `Articles not found`,
                status: 404
            });
        }else {
            return res.status(200).json({
                message: `Articles successfully found`,
                status: 200,
                articles: {
                    href,
                    offset,
                    limit,
                    next,
                    previous,
                    total,
                    items: articles
                }
            });
        }
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        });
    }
}

exports.getArticle = async (req , res) =>{
    const articleById = req.article;
    try {
        const img = await article.getImages(articleById.Id);
        articleById.img = img.map(image => `${baseUrl}/asset/${image.URL}`);

        return res.status(200).json({
            message: `Article with id ${req.params.id} successfully found`,
            status: 200,
            article: articleById
        })
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        })
    }
};

exports.postArticle = async (req,res)=>{
    const { Marque, Model, Ref, Price,Fab, Dimension, Matiere, Color, Waterproof, Movement,Complications,Bracelet, Color_Bracelet, Availability, Reduction, Stock, Description} = req.body;

    if (!Marque || !Model  || !Ref || !Price || !Fab || !Dimension || !Matiere || !Color || !Waterproof || !Movement || !Complications || !Bracelet || !Color_Bracelet || !Availability || !Description) {
        return res.status(400).json({
            message: "Tous les champs (Marque, Model, Ref, Price,Fab, Dimension, Matiere, Color, Waterproof, Movement,Complications,Bracelet, Color_Bracelet, Availability, Description) sont requis.",
            status:400
        });
    }

    try{
        const NewArticle = await article.createArticle({
            Marque,
            Model,
            Ref,
            Price,
            Fab,
            Dimension,
            Matiere,
            Color,
            Waterproof,
            Movement,
            Complications,
            Bracelet,
            Color_Bracelet,
            Availability,
            Reduction,
            Stock,
            Description
        });

        return res.status(201).json({
            message: `Article successfully create`,
            status: 201,
            NewArticle
        });
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        });
    }
}

exports.putArticle = async (req,res)=>{
    const id  = req.params.id;
    const { Marque, Model, Ref, Price,Fab, Dimension, Matiere, Color, Waterproof, Movement,Complications,Bracelet, Color_Bracelet, Availability, Reduction, Stock, Description} = req.body;

    if (!Marque || !Model  || !Ref || !Price || !Fab || !Dimension || !Matiere || !Color || !Waterproof || !Movement || !Complications || !Bracelet || !Color_Bracelet || !Availability || !Description) {
        return res.status(400).json({
            message: "Tous les champs (Marque, Model, Ref, Price,Fab, Dimension, Matiere, Color, Waterproof, Movement,Complications,Bracelet, Color_Bracelet, Availability, Description) sont requis.",
            status:400
        });
    }

    try {
        await article.updatePutArticle(id,{
            Marque,
            Model,
            Ref,
            Price,
            Fab,
            Dimension,
            Matiere,
            Color,
            Waterproof,
            Movement,
            Complications,
            Bracelet,
            Color_Bracelet,
            Availability,
            Reduction,
            Stock,
            Description
        });

        return res.status(200).json({
            message: `Article with id ${id} successfully updated`,
            status: 200,
        });
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        });
    }
}

exports.patchArticle = async (req,res) =>{
    const id  = req.params.id;
    const body = req.body;

    //Check si une clé du body appartient a cette liste
    if (!body || !Object.keys(body).some(key => ['Marque', 'Model', 'Ref', 'Price','Fab', 'Dimension', 'Matiere', 'Color', 'Waterproof', 'Movement','Complications','Bracelet', 'Color_Bracelet', 'Availability', 'Reduction', 'Stock', 'Description'].includes(key))) {
        return res.status(400).json({
            message: "Tous les champs (Marque, Model, Ref, Price,Fab, Dimension, Matiere, Color, Waterproof, Movement,Complications,Bracelet, Color_Bracelet, Availability, Description) sont requis.",
            status:400
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
            message:err,
            status:500
        });
    }
}

exports.deleteArticle = async (req,res)=>{
    const id = req.params.id;

    try {
        await article.deleteArticle(id);

        return res.status(200).json({
            message: `Article with id ${id} successfully delete`,
            status: 200
        });
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        });
    }
}

