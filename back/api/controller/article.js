const article = require("../models/articleModel");
require('dotenv').config();

const baseUrl = process.env.BASE_URL;

exports.getArticles = async (req, res) =>{
    try {
        const articles = await article.getAllArticle(req.query);

        const offset = parseInt(req.query.offset) || 0;//S'il a déjà set l'offset sinon c'est 0
        const limit = parseInt(req.query.limit) || 6;//S'il a déjà set la limit sinon c'est 6
        const href = baseUrl+"/articles";//http://localhost:4000/articles
        const total = Object.entries(articles).length;//Pour savoir j'ai combien d'article

        const next = article.total === total ? null :  `${href}?limit=${limit}&offset=${offset + limit}`;//Si article.total et total sont égaux alors pas de suivant
        /*
        La différence entre article.total et total est que
        article.total est le total des articles avec la query mais sans le limit et offset ex le total de /articles?name=julien
        total est le total des article avec la query y compris les limit et offset ex le total de /articles?name=julien&offset=0&limit=6
         */
        const previous = offset ? `${href}?limit=${limit}&offset=${offset}` : null;//Si l'offset est différent de 0 pagination sinon y en a pas

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
    const articleById = req.article;//Grâce au middleware articleExists
    try {
        const img = await article.getImages(articleById.Id);//Prends toutes les images de l'article indiqué
        articleById.img = img.map(image => `${baseUrl}/asset/${image.URL}`);//Met le chemin dans le json

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
    const { Marque, Model, Ref, Price, Fab, Dimension, Matiere, Color, Waterproof, Movement,Complications,Bracelet, Color_Bracelet, Availability, Reduction, Stock, Description} = req.body;

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
            message: "Au moins un des champs (Marque, Model, Ref, Price,Fab, Dimension, Matiere, Color, Waterproof, Movement,Complications,Bracelet, Color_Bracelet, Availability, Description) sont requis.",
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

