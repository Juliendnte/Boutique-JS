-- Insertion des fausses données dans la table `tags`
INSERT INTO `tags` (`Label`) VALUES
                                 ('Clothing'),
                                 ('Electronics'),
                                 ('Books'),
                                 ('Home Decor'),
                                 ('Accessories');

-- Insertion des fausses données dans la table `article`
INSERT INTO `article` (`Name`, `Description`, `Price`, `Reduction`, `Stock`) VALUES
                                                                                 ('T-shirt', 'Comfortable cotton t-shirt', 20, NULL, 100),
                                                                                 ('Smartphone', 'High-performance smartphone', 500, 50, 50),
                                                                                 ('Novel', 'Bestselling fiction novel', 15, 10, 200),
                                                                                 ('Wall Clock', 'Vintage style wall clock', 30, NULL, 50),
                                                                                 ('Sunglasses', 'UV protection sunglasses', 25, 5, 80);

-- Insertion des fausses données dans la table `have`
INSERT INTO `have` (`Id_Article`, `Id_Tag`) VALUES
                                                (1, 1),
                                                (1, 5),
                                                (2, 2),
                                                (3, 3),
                                                (4, 4),
                                                (5, 5);

-- Insertion des fausses données dans la table `photo`
INSERT INTO `photo` (`URL`, `Id_Article`) VALUES
                                              ('tshirt.jpg', 1),
                                              ('smartphone.jpg', 2),
                                              ('novel.jpg', 3),
                                              ('clock.jpg', 4),
                                              ('sunglasses.jpg', 5);

