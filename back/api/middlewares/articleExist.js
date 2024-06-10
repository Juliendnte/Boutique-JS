const article = require("../models/articleModel");

//Middleware pour savoir si la donnée est l'id envoyée
const articleExists = async (req, res, next) => {
  const id = req.params.id; //Récupere l'id

  if (/[a-zA-Z ]/.test(id)) {
    return res.status(404).json({
      message: `Article with id ${id} not found`,
      status: 404,
    });
  }
  try {
    const articleById = await article.getArticleById(id); //Récupere la donnée a l'id envoyée

    if (!articleById) {
      //S'il est vide error 404
      return res.status(404).json({
        message: `Article with id ${id} not found`,
        status: 404,
      });
    }

    req.article = articleById; //Pour accéder dans le controller a la donnée séléctionner et pas rappeller la fonction
    next(); //Passe au middleware suivant
  } catch (err) {
    res.status(500).json({
      message: err,
      status: 500,
    });
  }
};

module.exports = articleExists;
