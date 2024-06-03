const article = require("../models/articleModel");
require("dotenv").config();
const fs = require("fs");

const baseUrl = process.env.BASE_URL;
const pagination = 12;

exports.getArticles = async (req, res) =>{
    try {
        const offset = parseInt(req.query.offset) || 0;//S'il a déjà set l'offset sinon c'est 0
        const limit = parseInt(req.query.limit) || pagination;
        const href = baseUrl + "/articles" + buildQueryWithoutLimitOffset(req.query); // href avec query mais sans limit ou offset

        req.query.limit = limit;
        req.query.offset = offset;

        const articles = await article.getAllArticle(req.query);

        for (const art of articles) {
            const photos = await article.getImages(art.Id, true);
            art.Images = photos.map(photo => `${baseUrl}/assets/${photo.URL}`);
        }

        const total = Object.entries(articles).length;//Pour savoir j'ai combien d'article
        if (!articles || total === 0) {
            return res.status(404).json({
                message: `Articles not found`,
                status: 404
            });
        }
        const last_page = Math.ceil(article.total / limit)
        const current_page = Math.ceil(offset / limit) + 1;
        const next = article.total - limit <= offset ? null : href.includes("?") ? `${href}&limit=${limit}&offset=${offset + limit}` : `${href}?limit=${limit}&offset=${offset + limit}`;//Si article.total et total sont égaux alors pas de suivant
        const previous = offset ?  href.includes("?") ? `${href}&limit=${limit}&offset=${offset - limit}`:`${href}?limit=${limit}&offset=${offset - limit}` : null;//Si l'offset est différent de 0 pagination sinon y en a pas

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
                last_page,
                current_page,
                items: articles
            }
        });
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
        articleById.img = img.map(image => `${baseUrl}/assets/${image.URL}`);//Met le chemin dans le json

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

exports.patchArticle = async (req, res) => {
  const id = req.params.id;
  const body = req.body;

  //Check si une clé du body appartient a cette liste
  if (
    !body || !Object.keys(body).some((key) =>
      [
          "Model", "Ref", "Price", "Dimension",
          "Waterproof", "Movement", "Complications",
           "Availability", "Reduction", "Stock", "Description"
      ].includes(key))) {
    return res.status(400).json({
      message:
        "Au moins un des champs (Model, Ref, Price,Dimension, Waterproof, Movement,Complications, Availability, Description) sont requis.",
      status: 400,
    });
  }

  try {
    await article.updatePatchArticle(id, body);

    return res.status(200).json({
      message: `Article with id ${id} successfully updated`,
      status: 200,
    });
  } catch (err) {
    res.status(500).json({
      message: err,
      status: 500,
    });
  }
};

exports.search = async (req,res)=>{
    const search = req.query;

    try {
        const offset = parseInt(req.query.offset) || 0;//S'il a déjà set l'offset sinon c'est 0
        const limit = parseInt(req.query.limit) || pagination;
        const href = baseUrl + "/search" + buildQueryWithoutLimitOffset(req.query); // href avec query mais sans limit ou offset

        req.query.limit = limit;
        req.query.offset = offset;
        const articles = await article.search(search);
        for (const art of articles) {
            const photos = await article.getImages(art.Id, true);
            art.Images = photos.map(photo => `${baseUrl}/assets/${photo.URL}`);
        }
        const total = Object.entries(articles).length;
        const last_page = Math.ceil(article.total / limit)

        if (!articles || total === 0) {
            return res.status(404).json({
                message: `Articles not found`,
                status: 404
            });
        }

        const next = article.total - limit <= offset ? null : href.includes("?") ? `${href}&limit=${limit}&offset=${offset + limit}` : `${href}?limit=${limit}&offset=${offset + limit}`;//Si article.total et total sont égaux alors pas de suivant
        const previous = offset ?  href.includes("?") ? `${href}&limit=${limit}&offset=${offset - limit}`:`${href}?limit=${limit}&offset=${offset - limit}` : null;//Si l'offset est différent de 0 pagination sinon y en a pas

        res.status(200).json({
            message: 'Article found with search '+search.search,
            status: 200,
            articles: {
                href,
                offset,
                limit,
                next,
                previous,
                total,
                last_page,
                items: articles
            }
        })
    }catch (err){
        res.status(500).json({
            message:err,
            status:500
        });
    }
}

exports.getAllFav = async (req, res) => {
  const userID = req.user.Id; //Pris du middleware auth
  try {
    const Favoris = await article.getAllFav(userID); //Récupère tous les favoris a l'id de l'user
    if (!Favoris) {
      return res.status(404).json({
        message: `None favori were found to the user at id ${userID}`,
        status: 404,
      });
    }
    return res.status(200).json({
      message: "Favorite articles by user",
      status: 200,
      Favoris,
    });
  } catch (err) {
    res.status(500).json({
      message: err,
      status: 500,
    });
  }
};

exports.getAllCommande = async (req, res) => {
  const userID = req.user.Id;
  try {
    const Commande = await article.getAllCommande(userID);
    if (!Commande) {
      return res.status(404).json({
        message: `None command were found to the user at id ${userID}`,
        status: 404,
      });
    }
    return res.status(200).json({
      message: "Command articles by user",
      status: 200,
      Commande,
    });
  } catch (err) {
    res.status(500).json({
      message: err,
      status: 500,
    });
  }
};

exports.postFavoris = async (req, res) => {
  const userID = req.user.Id;
  const articleID = req.params.id;
  try {
    await article.postFav(userID, articleID); //L'user met en favoris l'article
    res.status(200).json({
      message: `Article ${articleID} successfully been add in favoris`,
      status: 200,
    });
  } catch (err) {
    res.status(500).json({
      message: err,
      status: 500,
    });
  }
};

exports.postComande = async (req, res) => {
  const userID = req.user.Id;
  const articleID = req.params.id;
  try {
    const stock = (await article.getArticleById(articleID)).Stock;
    if (stock > 0) {
      await article.updatePatchArticle(articleID, {
        Stock: stock - 1,
      });
    } else {
      return res.status(409).json({
        message: "No stock for article " + articleID,
        status: 409,
      });
    }
    await article.postCommande(userID, articleID); //L'user a mit dans l'historique de commande

    res.status(200).json({
      message: `Command ${articleID} successfully been add to command`,
      status: 200,
    });
  } catch (err) {
    res.status(500).json({
      message: err,
      status: 500,
    });
  }
};

exports.deleteFavoris = async (req, res) => {
  const userID = req.user.Id;
  const articleId = req.params.id;
  try {
    await article.deleteFav(userID, articleId);
    res.status(200).json({
      message: `Article with id ${articleId} successfully been deleted from favoris`,
      status: 200,
    });
  } catch (err) {
    res.status(500).json({
      message: err,
      status: 500,
    });
  }
};

exports.getArticleSimilar = async (req, res) => {
    const id = req.params.id;
    const limit = parseInt(req.query.limit) || 5;
    try{
        const articles = await article.getArticleSimilaire(id,limit);
        for (const art of articles) {
            const photos = await article.getImages(art.Id, true);
            art.Images = photos.map(photo => `${baseUrl}/assets/${photo.URL}`);
        }
        res.status(200).json({
            message: `Similar articles for id ${id} `,
            status: 200,
            articles
        })
    }catch (err){
        res.status(500).json({
            message: err,
            status: 500
        })
    }
}

function buildQueryWithoutLimitOffset(query) {
    const filteredQuery = Object.entries(query)
        .filter(([key]) => key.toLowerCase() !== 'limit' && key.toLowerCase() !== 'offset')
        .map(([key, value]) => `${encodeURIComponent(key)}=${encodeURIComponent(value)}`)
        .join('&');

    return filteredQuery ? `?${filteredQuery}` : '';
}
