# HoroHaven Boutique

## Description

HoroHaven Boutique est un site e-commerce de montres développé avec Node.js, EJS et une base de données en MySQL. Le projet est divisé en deux serveurs : un serveur backend pour l'API et un serveur frontend pour l'interface utilisateur.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- [Node.js](https://nodejs.org/)
- [phpMyAdmin](https://www.phpmyadmin.net/)

## Installation

Suivez ces étapes pour installer et configurer le projet :

### 1. Cloner le dépôt

Clonez le dépôt depuis GitHub :

```bash
git clone https://github.com/Juliendnte/Boutique-JS.git
cd boutique-js
```

2. Installer les dépendances

Installez les dépendances nécessaires pour les serveurs backend et frontend :
Backend

```bash
cd back
npm install nodemon
```
Frontend

```bash
cd ../front
npm install nodemon
```

3. Configurer les variables d'environnement

Dans le dossier back , copiez le fichier .env.example et renommez-le .env :

```bash
cp .env.example .env
```

Modifiez les valeurs dans les fichiers .env avec vos informations :

Exemple de configuration .env pour le backend :

```dotenv
DB_HOST='localhost'
DB_USER='your_database_user'
DB_PASSWORD='your_database_password'
DB_DATABASE='your_database_name'

HOST='localhost'
BASE_URL='http://localhost:4000'
JWT_KEY='your_jwt_key'
PEPPER='your_pepper'
PORT='4000'
EMAIL='horohavenboutique@gmail.com'
E_PASSWORD='qetn odkh zqav kugv '
```

4. Configurer la base de données

Créez la base de données dans phpMyAdmin et importez les fichiers SQL :

    Ouvrez phpMyAdmin et créez une nouvelle base de données nommée your_database_name (ex: boutiquejs).
    Importez le fichier migration.sql depuis le dossier scriptsql.
    Importez le fichier insertion.sql depuis le dossier scriptsql.

5. Démarrer les serveurs

Démarrez les serveurs backend et frontend :
Démarrer le serveur backend :

```bash
cd back
npm start
```

Démarrer le serveur frontend :

```bash
cd ../front
npm start
```

6. Accéder à l'application

Ouvrez votre navigateur et accédez à l'URL suivante :

http://localhost:3000/index

Fonctionnalités

    Gestion des utilisateurs : Inscription, connexion et gestion des profils utilisateur.
    Catalogue de produits : Affichage des montres disponibles, recherche et filtrage.
    Panier et commande : Ajouter des produits au panier, passer des commandes et gérer les paiements.
    Administration : Interface pour gérer les produits, les catégories et les commandes.

Structure du projet

Le projet est divisé en deux parties principales :

Backend

    Technologies utilisées : Node.js, Express.js, MySQL.
    Rôles : Gestion des API, authentification, communication avec la base de données.
    Dépendances clés :
        cors
        dotenv
        express
        express-rate-limit
        jsonwebtoken
        mysql2
        nodemailer
        path

Arborescence des fichiers du backend :

```
back/
├── api/
│   ├─── assets/
│   │   └── montres/
│   │       │...
│   ├── config/
│   │   └── authBDD.js
│   ├── controller/
│   │   ├── artilce.js
│   │   └── log.js
│   ├── middlewares/
│   │   ├── articleExist.js
│   │   ├── auth.js
│   │   └── rate-limit.js
│   ├── models/
│   │   ├── articleModel.js
│   │   └── logModel.js
│   ├── routes/
│   │   ├── articleRoute.js
│   │   └── logRoute.js
│   └── scriptSQL/
│       ├── insertion/
│       │   └── insertion.sql
│       └──migration/
│           └── migration.sql
├── node_modules/
│   │...
├── .env
├── .env.example
├── package.json
├── package-lock.json
└── server.js
```

Frontend

    Technologies utilisées : EJS, CSS, JavaScript.
    Rôles : Rendu des vues, interactions utilisateur, communication avec le backend.
    Dépendances clés :
        axios
        body-parser
        cookie-parser
        cors
        express
        swiper

Arborescence des fichiers du frontend :

```
front/
├── assets/
│   ├── css/
│   │   │...
│   ├── font/
│   │   │...
│   ├── img/
│   │   │...
│   ├── js/
│   │   │...
│   └── video/
│       │...
├── controller/
│   ├── control.js
│   └── ErrorHandle.js
├── routeur/
│   └── route.js
├── views/
│   ├── partials/
│   │   │...
│   └── admin.ejs
│       │...
├── main.js
├── package.json
└── package-lock.json
```
Utilisation

Utilisateurs

    Inscription : Les utilisateurs peuvent s'inscrire en fournissant leur nom, email et mot de passe.
    Connexion : Les utilisateurs peuvent se connecter avec leur email et mot de passe.
    Profil : Les utilisateurs peuvent consulter et mettre à jour leurs informations de profil.

Produits

    Catalogue : Tous les produits disponibles sont listés sur la page principale.
    Détails du produit : Les utilisateurs peuvent cliquer sur un produit pour voir plus de détails.
    Recherche et filtrage : Les utilisateurs peuvent rechercher et filtrer les produits par différentes catégories.

Panier et Commandes

    Ajout au panier : Les utilisateurs peuvent ajouter des produits à leur panier.
    Passer commande : Les utilisateurs peuvent passer une commande avec les produits dans leur panier.
    Historique des commandes : Les utilisateurs peuvent consulter l'historique de leurs commandes.


Pour toute question ou suggestion, veuillez contacter :

    Email : horohavenboutique@gmail.com

Merci d'avoir utilisé HoroHaven Boutique !