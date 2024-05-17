-- Insertion des fausses données dans la table `article`
INSERT INTO `article` (`Marque`, `Model`, `Ref`, `Price`,`Fab`, `Dimension`, `Matiere`, `Color`, `Waterproof`, `Movement`,`Complications`,`Bracelet`, `Color_Bracelet`, `Availability`, `Reduction`, `Stock`, `Description`) VALUES
-- 1
    ("A. Lange & Sohne", "1815 Chronograph", "402.026", 53650, "Allemagne", "39mm", "Or blanc","Argent", "30m", "Montre à remontage manuel", "Chronographe , Heures et minutes , Secondes", "Alligator", "Noir",DEFAULT,NULL, 3,
    "Montre à remontage manuel A. Lange & Sohne 1815 Chronograph (402026) d'occasion, dotée d'un boîtier en or blanc 18 carats de 39,5 mm entourant un cadran argenté sur un tout nouveau bracelet en alligator noir avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir." );

-- Insertion des fausses données dans la table `photo`
INSERT INTO `photo` (`URL`, `Id_Article`) VALUES
    ('montres/a._lange_&_söhne/1815/or_blanc/img_1.avif', 1),
    ('montres/a._lange_&_söhne/1815/or_blanc/img_2.avif', 1),
    ('montres/a._lange_&_söhne/1815/or_blanc/img_3.avif', 1),
    ('montres/a._lange_&_söhne/1815/or_blanc/img_4.avif', 1),
    ('montres/a._lange_&_söhne/1815/or_blanc/img_5.avif', 1);
                                              
