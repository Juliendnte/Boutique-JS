require("dotenv").config();
const article = require("../models/articleModel");

const baseUrl = process.env.BASE_URL;
const pagination = 12;
const listValueArticle = ["marque.label","model","ref","fabrication.label","dimension","matiere.label","color.label","movement.label","complications","waterproof", "bracelet.label","color_bracelet.label","availability", "price","reduction", "stock","limit", "offset"];

function buildQueryWithoutLimitOffset(query) {
  const filteredQuery = Object.entries(query).filter(([key]) => key.toLowerCase() !== "limit" && key.toLowerCase() !== "offset"
    ).map(([key, value]) =>`${encodeURIComponent(key)}=${encodeURIComponent(value)}`
    ).join("&");
  return filteredQuery ? `?${filteredQuery}` : "";
}

class ArticleController {
  static async getArticles(req, res) {
    if (Object.keys(req.query).length && !Object.keys(req.query).every((key) => listValueArticle.includes(key.toLowerCase()))) {
      return res.status(401).send({
        message: "Erreur de query",
        status: 401,
      });
    }

    try {
      const offset = parseInt(req.query.offset) || 0; //S'il a déjà set l'offset sinon c'est 0
      const limit = parseInt(req.query.limit) || pagination;
      const href = baseUrl + "/articles" + buildQueryWithoutLimitOffset(req.query); // href avec query mais sans limit ou offset

      req.query.limit = limit;
      req.query.offset = offset;
      const articles = await  article.ArticleModel.getAllArticle(req.query);

      for (const art of articles) {
        const photos = await  article.ArticleModel.getImages(art.Id, true);
        art.Images = photos.map((photo) => `${baseUrl}/assets/${photo.URL}`);
      }

      const total = Object.entries(article.ArticleModel).length; //Pour savoir j'ai combien d'article
      if (!articles || total === 0) {
        return res.status(404).send({
          message: `Articles not found`,
          status: 404,
        });
      }
      const last_page = Math.ceil(article.ArticleModel.total / limit);
      const current_page = Math.ceil(offset / limit) + 1;
      const next =  article.ArticleModel.total - limit <= offset ? null : href.includes("?") ? `${href}&limit=${limit}&offset=${offset + limit}`: `${href}?limit=${limit}&offset=${offset + limit}`; //Si article.total et total sont égaux alors pas de suivant
      const previous = offset ? href.includes("?") ? `${href}&limit=${limit}&offset=${offset - limit}` : `${href}?limit=${limit}&offset=${offset - limit}` : null; //Si l'offset est différent de 0 pagination sinon y en a pas

      return res.status(200).send({
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
          items: articles,
        },
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async getArticle(req, res) {
    const articleById = req.article; //Grâce au middleware articleExists
    try {
      const img = await  article.ArticleModel.getImages(articleById.Id); //Prends toutes les images de l'article indiqué
      articleById.img = img.map((image) => `${baseUrl}/assets/${image.URL}`); //Met le chemin dans le send

      return res.status(200).send({
        message: `Article with id ${req.params.id} successfully found`,
        status: 200,
        article: articleById,
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async patchArticle(req, res) {
    const id = req.params.id;
    const body = req.body;

    //Check si une clé du body appartient a cette liste
    if (!body || !Object.keys(body).every((key) => ["price", "availability", "stock"].includes(key.toLowerCase()))) {
      return res.status(400).send({
        message: "Vous ne pouvez modifiés que un de ses champs [Price, Availability, Stock]",
        status: 400,
      });
    }

    try {
      await  article.ArticleModel.updatePatchArticle(id, body);

      return res.status(200).send({
        message: `Article with id ${id} successfully updated`,
        status: 200,
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async searchArticles(req, res) {
    const search = req.query.search;

    try {
      const offset = parseInt(req.query.offset) || 0; //S'il a déjà set l'offset sinon c'est 0
      const limit = parseInt(req.query.limit) || pagination;
      const href = baseUrl + "/search" + buildQueryWithoutLimitOffset(req.query); // href avec query mais sans limit ou offset

      req.query.limit = limit;
      req.query.offset = offset;

      const articles = await  article.ArticleModel.search({ search, limit, offset });

      for (const art of articles) {
        const photos = await  article.ArticleModel.getImages(art.Id, true);
        art.Images = photos.map((photo) => `${baseUrl}/assets/${photo.URL}`);
      }

      const total = Object.entries(article.ArticleModel).length; //Pour savoir j'ai combien d'article
      if (!articles || total === 0) {
        return res.status(404).send({
          message: `Articles not found`,
          status: 404,
        });
      }
      const last_page = Math.ceil(article.ArticleModel.total / limit);
      const current_page = Math.ceil(offset / limit) + 1;
      const next =  article.ArticleModel.total - limit <= offset ? null : href.includes("?") ? `${href}&limit=${limit}&offset=${offset + limit}`: `${href}?limit=${limit}&offset=${offset + limit}`; //Si article.total et total sont égaux alors pas de suivant
      const previous = offset ? href.includes("?") ? `${href}&limit=${limit}&offset=${offset - limit}` : `${href}?limit=${limit}&offset=${offset - limit}` : null; //Si l'offset est différent de 0 pagination sinon y en a pas

      res.status(200).send({
        message: "Article found with search " + search,
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
          items: articles,
        },
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async getArticleSimilar(req, res) {
    const id = req.params.id;
    const limit = parseInt(req.query.limit) || 10;
    try {
      const articles = await  article.ArticleModel.getArticleSimilaire(id, limit);
      for (const art of articles) {
        const photos = await  article.ArticleModel.getImages(art.Id, true);
        art.Images = photos.map((photo) => `${baseUrl}/assets/${photo.URL}`);
      }
      res.status(200).send({
        message: `Similar articles for id ${id} `,
        status: 200,
        articles,
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async getFav(req, res) {
    const userID = req.user.Sub; //Pris du middleware auth
    try {
      const Favoris = await  article.ArticleModel.getAllFav(userID); //Récupère tous les favoris a l'id de l'user
      if (!Favoris.length) {
        return res.status(404).send({
          message: `No favoris found`,
          status: 404,
        });
      }
      for (const art of Favoris) {
        const photos = await  article.ArticleModel.getImages(art.Id, true);
        art.Images = photos.map((photo) => `${baseUrl}/assets/${photo.URL}`);
      }
      return res.status(200).send({
        message: "Favorite articles by user",
        status: 200,
        Favoris,
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async getCommande(req, res) {
    const userID = req.user.Sub;

    try {
      const Commande = await  article.ArticleModel.getAllCommande(userID);
      if (!Commande) {
        return res.status(404).send({
          message: `No command were found to the user at id ${userID}`,
          status: 404,
        });
      }
      for (const art of Commande) {
        const photos = await  article.ArticleModel.getImages(art.Id, true);
        art.Images = photos.map((photo) => `${baseUrl}/assets/${photo.URL}`);
      }
      return res.status(200).send({
        message: "Command articles by user",
        status: 200,
        Commande,
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async addFav(req, res) {
    const userID = req.user.Sub;
    const id = req.params.id;

    try {
      await  article.ArticleModel.postFav(userID, id); //L'user met en favoris l'article
      res.status(201).send({
        message: `Article ${id} successfully been add in favoris`,
        status: 201,
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async postCommande(req, res) {
    const userID = req.user.Sub;
    let panier = req.body.panier; // Assurez-vous que panier est un objet JavaScript
    if (typeof panier === 'string') {
      panier = JSON.parse(panier); // Convertir la chaîne JSON en objet JavaScript si nécessaire
    }

    const articlesModifies = [];
    try {
      for (const watche of panier) {
        const art = await article.ArticleModel.getArticleById(watche.id);
        const stock = art.Stock;
        if (stock >= watche.nb) {
          await article.ArticleModel.updatePatchArticle(watche.id, {
            Stock: stock - watche.nb,
          });
          articlesModifies.push({Id: watche.id, nb: watche.nb});
          await article.ArticleModel.postCommande(userID, watche.id, watche.nb); //L'user a mit dans l'historique de commande
        } else {
          for (const watch of articlesModifies) {
            const art = await article.ArticleModel.getArticleById(watch.Id);
            const stock = art.Stock;
            await article.ArticleModel.updatePatchArticle(watch.Id, {
              Stock: stock + watch.nb, // Ajouter la quantité retirée
            });
            await article.ArticleModel.deleteCommande(userID, watch.Id);
          }
          return res.status(409).send({
            message: "Il n'y a plus de stock pour " + art.Model,
            status: 409,
          });
        }
      }

      res.status(200).send({
        message: `Command successfully been add to command`,
        status: 200,
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async deleteFav(req, res) {
    const userID = req.user.Sub;
    const articleId = req.params.id;
    try {
      await  article.ArticleModel.deleteFav(userID, articleId);
      res.status(200).send({
        message: `Article with id ${articleId} successfully been deleted from favoris`,
        status: 200,
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async getArticleColor(req, res) {
    const img = await  article.ArticleModel.getImages(req.article.Id);
    const match = img[0].URL.match(/^(.*\/)[^\/]*\/[^\/]*$/);
    let extractedPath;
    if (match) {
      extractedPath = match[1];
    } else {
      return res.status(404).send({
        message: "Error image path",
        status: 404,
      });
    }

    try {
      const articlesId = await  article.ArticleModel.getArticlesColor(extractedPath);

      res.status(200).send({
        message: "Article Color found",
        status: 200,
        articlesId,
      });
    } catch (err) {
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async getMarque(req, res){
    try{
      const marque = await  article.ArticleModel.getMarque();
      res.status(200).send({
        marque
      })
    }catch (err){
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }

  static async getArticlesId(req, res){
    try{
      let list = req.query.id;

      if (!list) {
        return res.status(400).send({ error: 'No list provided' });
      }

      // Gérer à la fois les cas de 'list=1&list=2&list=3' et 'list=1,2,3'
      if (!Array.isArray(list)) {
        list = list.split(',');
      }

      // Convertir les valeurs en entiers si nécessaire
      list = list.map(item => parseInt(item, 10));
      const listArticles = await  article.ArticleModel.getArticlesListId(list);
      for (const art of listArticles) {
        const photos = await  article.ArticleModel.getImages(art.Id, true);
        art.Images = photos.map((photo) => `${baseUrl}/assets/${photo.URL}`);
      }
      res.status(200).send({
        message : "Articles selectionned",
        status: 200,
        listArticles
      })
    }catch (err){
      res.status(500).send({
        message: err,
        status: 500,
      });
    }
  }
}

module.exports = ArticleController;
