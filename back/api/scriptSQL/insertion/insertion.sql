INSERT INTO `color` (`Label`) VALUES
                                  ('Argent'),
                                  ('Bleu'),
                                  ('Noir'),
                                  ('Gris'),
                                  ('Champagne'),
                                  ('Blanc'),
                                  ('Diamant'),
                                  ('Rose'),
                                  ('Marron'),
                                  ('Multi-color'),
                                  ('Or jaune'),
                                  ('Ivoire'),
                                  ('Squelette'),
                                  ('Transparent');

INSERT INTO `marque` (`Label`) VALUES
                                   ('A. Lange & Sohne'),
                                   ('Audemars Piguet'),
                                   ('Breitling'),
                                   ('F.P. Journe'),
                                   ('H. Moser & Cie.'),
                                   ('Omega'),
                                   ('Patek Philippe'),
                                   ('Vacheron Constantin');

INSERT INTO `fabrication` (`Label`) VALUES
                                        ('Suisse'),
                                        ('Allemagne');

INSERT INTO `matiere` (`Label`) VALUES
                                    ('Or blanc'),
                                    ('Or jaune'),
                                    ('Or rose'),
                                    ('Platine'),
                                    ('Acier inoxydable'),
                                    ('Titane'),
                                    ('Tantale'),
                                    ('Aluminium'),
                                    ('Céramique');

INSERT INTO `movement` (`Label`) VALUES
                                     ('Montre à remontage manuel'),
                                     ('Automatique'),
                                     ('Quartz'),
                                     ('Mechanique (Automatique)');



INSERT INTO `bracelet` (`Label`) VALUES
                                     ('Alligator'),
                                     ('Caoutchouc')	,
                                     ('Cuir'),
                                     ('Tissé'),
                                     ('Acier inoxydable'),
                                     ('Or blanc'),
                                     ('Or rose'),
                                     ('Deux tons: Or rose/ Acier inoxydable'),
                                     ('Titane'),
                                     ('Platine'),
                                     ('Or jaune'),
                                     ('Satin');

INSERT INTO `color_bracelet` (`Label`) VALUES
                                 ('Noir'),
                                 ('Marron'),
                                 ('Bleu'),
                                 ('Bordeaux'),
                                 ('Gris'),
                                 ('Argent'),
                                 ('Or rose'),
                                 ('Deux tons: Rose/argent'),
                                 ('Tan'),
                                 ('Platine'),
                                 ('Or jaune');


INSERT INTO `article` (
    `Id_Marque`, `Model`, `Ref`, `Price`, `Id_Fab`, `Dimension`, `Id_Matiere`,
    `Id_Color`, `Waterproof`, `Id_Movement`, `Complications`, `Id_Bracelet`,
    `Id_Color_Bracelet`, `Availability`, `Reduction`, `Stock`, `Description`
) VALUES
    (1, "1815 Chronograph", "402.026", 53650, 2, "39mm", 1, 1, "30m", 1, "Chronographe, Heures et minutes, Secondes", 1, 1, DEFAULT, 5, 3,
    "Montre à remontage manuel A. Lange & Sohne 1815 Chronograph (402026) d'occasion, dotée d'un boîtier en or blanc 18 carats de 39,5 mm entourant un cadran argenté sur un tout nouveau bracelet en alligator noir avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir."),

    (1, "Tourbillon Pour Le Merite Limited Edition", "701.001", 242850, 2, "38mm", 2,1, "30m", 1, "Heures et minutes , Indicateur de réserve de marche , Secondes , Tourbillon", 1, 2,DEFAULT,NULL, 2,
    "Montre à remontage manuel A. Lange & Sohne Tourbillon Pour Le Merite Limited Edition (701001) d'occasion, dotée d'un boîtier en or jaune 18 carats de 38,5 mm entourant un cadran argenté sur un bracelet en alligator marron avec une boucle ardillon en or jaune 18 carats. Les fonctions comprennent les heures, les minutes, les secondes, l'indicateur de réserve de marche et le tourbillon. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

     (1, "1815 Rattrapante Calendrier Perpétuel", "421.032FE", 129000, 2, "41mm", 3,1, "30m", 1, "Calendrier , Chronographe , Date , Jour , Heures et minutes , Phase de lune , Indicateur de réserve de marche , Secondes", 1, 2,DEFAULT,NULL, 2,
    "Montre à remontage manuel A. Lange & Söhne 1815 Rattrapante Perpetual Calendar (421032FE) d'occasion, dotée d'un boîtier en or rose 18 carats de 41,9 mm entourant un cadran argenté sur un tout nouveau bracelet en alligator marron avec une boucle déployante en or rose 18 carats. Les fonctions comprennent les heures, les minutes, la petite seconde, le jour, la date, le mois, la phase de lune, le calendrier perpétuel et le chronographe à rattrapante. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


   (1, "Lange 1", "101.027", 56500, 2, "38mm", 1, 2, "50m", 1, "Date , Heures et minutes , Indicateur de réserve de marche , Secondes", 1, 2,DEFAULT,NULL, 1,
    "Montre à remontage manuel A. Lange & Sohne Lange 1 (101027) d'occasion, dotée d'un boîtier en or blanc 18 carats de 38,5 mm entourant un cadran bleu sur un tout nouveau bracelet en alligator marron avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes, les secondes, la date et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


   (1, "Lange 1", "101.022", 26550, 2, "38mm", 2,1, "30m", 1, "Date , Heures et minutes , Indicateur de réserve de marche , Secondes", 1, 1,DEFAULT,10, 2,
    "Montre à remontage manuel A.Lange & Sohne Lange 1 (101022) d'occasion, dotée d'un boîtier de 38 mm en or jaune 18 carats entourant un cadran argenté sur un bracelet en alligator noir avec une boucle ardillon en or jaune 18 carats. Les fonctions comprennent les heures, les minutes, la petite seconde, la date et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (1, "Grand Lange 1 Moonphase Lumen", "139.035F", 121400, 2, "41mm", 4,3, "30m", 1, "Date , Heures et minutes , Phase de lune , Indicateur de réserve de marche , Secondes", 1, 1,DEFAULT,NULL, 2,
    "Montre à remontage manuel A. Lange & Sohne Grand Lange 1 Moonphase Lumen (139035F) d'occasion, dotée d'un boîtier en platine de 41 mm entourant un cadran transparent noir sur un bracelet en alligator noir avec une boucle déployante en platine. Les fonctions comprennent les heures, les minutes, la petite seconde, la date, la phase de lune et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


   (1, "Langematik", "308.021", 17450, 2, "37mm", 2,1, "50m", 2, "Date , Heures et minutes , Secondes", 1, 1,DEFAULT,NULL, 3,
    "Montre automatique à remontage automatique A. Lange & Sohne Langematik (308021) d'occasion, dotée d'un boîtier en or jaune 18 carats de 37 mm entourant un cadran argenté sur un bracelet en alligator noir avec une boucle ardillon en or jaune 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


   (1, "Grosse Langematick Gangreserve Limited for Wempe", "304.047", 32600, 2, "40mm", 3,1, "30m", 2, "Date , Heures et minutes , Secondes", 1, 2,DEFAULT,5, 4,
    "Montre automatique à remontage automatique A. Lange & Sohne Grosse Langematick Gangreserve Limited pour Wempe (304047) d'occasion, dotée d'un boîtier en or rose 18 carats de 40,5 mm entourant un cadran argenté sur un tout nouveau bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions comprennent les heures, les minutes, la petite seconde et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


   (1, "Langematik Perpetual Calendar", "310.025E", 58650, 2, "38mm", 4,4, "30m", 2, "Date , Jour , Gmt/Heure mondiale , Heures et minutes , Phase de lune , Calendrier perpétuel , Secondes", 1, 1,DEFAULT,NULL, 5,
    "Montre automatique à remontage automatique A. Lange & Sohne Grosse Langematick Gangreserve Limited pour Wempe (304047) d'occasion, dotée d'un boîtier en or rose 18 carats de 40,5 mm entourant un cadran argenté sur un tout nouveau bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions comprennent les heures, les minutes, la petite seconde et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (1, "Richard Lange Tourbillon ""Pour le Merite"" ", "760.026F", 130550, 2, "41mm", 1,1, "30m", 1, "Heures et minutes , Secondes , Tourbillon", 1, 2,DEFAULT,NULL, 5,
    "Montre à remontage manuel A. Lange & Sohne Richard Lange Tourbillon ""Pour le Mérite"" (760026F) d'occasion, dotée d'un boîtier en or blanc 18 carats de 41,9 mm entourant un cadran argenté sur un bracelet en alligator marron avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde et le tourbillon. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (1, "Richard Lange Tourbillon ""Pour le Merite"" ", "760.032", 125300, 2, "41mm", 3,1, "30m", 1, "Heures et minutes , Secondes , Tourbillon", 1, 2,DEFAULT,NULL, 2,
    "Montre à remontage manuel A. Lange & Sohne Richard Lange Tourbillon Pour Le Merite (760032) d'occasion, dotée d'un boîtier en or rose 18 carats de 41,9 mm entourant un cadran argenté sur un tout nouveau bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, les secondes et le tourbillon. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (1, "Richard Lange Tourbillon ""Pour le Merite"" ", "760.025", 130750, 2, "41mm", 4,1, "50m", 1, "Heures et minutes , Secondes , Tourbillon", 1, 1,DEFAULT,5, 3,
    "Montre à remontage manuel A. Lange & Sohne Richard Lange Tourbillon ""Pour le Mérite"" (760025) d'occasion, dotée d'un boîtier en platine de 41,9 mm entourant un cadran argenté sur un bracelet en alligator noir avec une boucle déployante en platine. Les fonctions incluent les heures, les minutes, les secondes et le tourbillon. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (1, "Saxonia", "760.025", 130750, 2, "41mm", 1,2, "30m", 2, "Heures et minutes , Secondes", 1, 3,DEFAULT,NULL, 3,
    "Montre automatique à remontage automatique A. Lange & Sohne Saxonia (380028) d'occasion, dotée d'un boîtier en or blanc 18 carats de 38,5 mm entourant un cadran bleu sur un bracelet en alligator noir avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes et la petite seconde. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (1, "Saxonia", "309.021", 20600, 2, "40mm", 2,5, "30m", 2, "Date , Heures et minutes , Secondes", 1, 2,DEFAULT,NULL, 2,
    "Montre automatique à remontage automatique A. Lange & Sohne Grand Langematik (309021) d'occasion, dotée d'un boîtier en or jaune 18 carats de 40 mm entourant un cadran champagne clair sur un tout nouveau bracelet en alligator marron avec une boucle ardillon en or jaune 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (1, "Saxonia", "403.031", 102050, 2, "39mm", 3,3, "50m", 1, "Chronographe , Date , Heures et Minutes , Secondes , Tachymètre", 1, 4,DEFAULT,NULL, 1,
    "Montre à remontage manuel A. Lange & Sohne Datograph (403031) d'occasion, dotée d'un boîtier de 39 mm en or rose 18 carats entourant un cadran noir sur un tout nouveau bracelet en alligator bordeaux avec une boucle déployante en or rose 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (1, "Zeitwerk Date", "148.038", 101200, 2, "44mm", 1,4, "30m", 1, "Date , Heures et minutes , Indicateur de réserve de marche , Secondes", 1, 1,DEFAULT,NULL, 5,
    "Montre à remontage manuel A. Lange & Sohne Zeitwerk Date (148038) d'occasion, dotée d'un boîtier en or blanc 18 carats de 44,2 mm entourant un cadran gris sur un bracelet en alligator noir avec une boucle ardillon en or blanc 18 carats. Les fonctions comprennent les heures, les minutes, la petite seconde, la date et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (1, "Zeitwerk Minute Repeater", "147.025", 260650, 2, "44mm", 4,1, "30m", 1, "Date , Heures et minutes , Indicateur de réserve de marche , Secondes", 1, 1,DEFAULT,5, 5,
    "Montre à remontage manuel A. Lange & Sohne Zeitwerk Minute Repeater (147025) d'occasion, dotée d'un boîtier en platine de 44,2 mm entourant un cadran argenté sur un bracelet en alligator noir avec une boucle ardillon en platine. Les fonctions incluent les heures sautantes, les minutes, les secondes et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (2, "Code 11.59", "15210QT.OO.A064KB.01", 29900, 1, "41mm", 5,3, "30m", 2, "Date , Heures et minutes ,  Secondes", 2, 2,DEFAULT,NULL, 1,
    "Montre automatique à remontage automatique Audemars Piguet Code 11.59 (15210QTOOA064KB01) d'occasion, dotée d'un boîtier en acier inoxydable de 41 mm entourant un cadran beige fumé sur un bracelet recouvert de caoutchouc beige avec une boucle ardillon en acier inoxydable. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Code 11.59 Perpetual Calendar", "26394BC.OO.D027KB.01", 74450, 1, "41mm", 1,2, "20m", 2, "Date , Jour , Heures et minutes , Mois , Phase de lune , Calendrier perpétuel , Secondes", 3, 5,DEFAULT,NULL, 2,
    "Montre automatique à remontage automatique Audemars Piguet Code 11.59 à calendrier perpétuel (26394BCOOD027KB01) d'occasion, dotée d'un boîtier en or blanc 18 carats de 41 mm entourant un cadran aventurine bleu sur un bracelet en cuir gris à dos en caoutchouc avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes, la semaine, la date, le jour, le mois, la phase de lune et le calendrier perpétuel. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Code 11.59", "15210OR.OO.A028CR.01", 28050, 1, "41mm", 3,2, "30m", 2, "Heures et minutes , Secondes", 1, 3,DEFAULT,10, 2,
    "Montre automatique à remontage automatique Audemars Piguet Code 11.59 (15210OROOA028CR01) d'occasion, dotée d'un boîtier en or rose 18 carats de 41 mm entourant un cadran bleu laqué fumé sur un bracelet en alligator bleu avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Jules Audemars Grande Sonnerie Minute Repeater", "25750BA.OO.A002XX.01", 84050, 1, "39mm", 2,6, "Non précisé", 1, "Heures et Minutes , Secondes", 1, 1,DEFAULT,NULL, 3,
    "Montre à remontage manuel Audemars Piguet Jules Audemars Grande Sonnerie Répétition minutes (25750BAOOA002XX01) d'occasion, dotée d'un cadran en or jaune 18 carats de 39 mm entourant un cadran blanc sur un bracelet en alligator noir avec une boucle ardillon en or jaune 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde et la sonnerie. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Jules Audemars Chronometer", "26153OR.OO.D088CR.01", 68200, 1, "46mm", 3,3, "20m", 1, "Heures et Minutes , Secondes", 1, 2,DEFAULT,NULL, 1,
    "Montre à remontage manuel Audemars Piguet Jules Audemars Chronometer (26153OROOD088CR01) d'occasion, dotée d'un boîtier de 46 mm en or rose 18 carats entourant un cadran noir sur un bracelet en alligator marron avec une boucle déployante en or rose 18 carats. Les fonctions incluent les heures, les minutes et la petite seconde. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Jules Audemars Double X 6th Day Arnold Schwazeneggar", "25949IP/O/0001KE/01", 28000, 1, "48mm", 6,6, "50m", 2, "Chronographe , Heures et Minutes , Secondes", 4, 1,DEFAULT,NULL, 2,
    "Montre automatique à remontage automatique Audemars Piguet Jules Audemars Double X 6th Day Arnold Schwazeneggar (25949IPO0001KE01) d'occasion, dotée d'un boîtier en titane de 48 mm avec une lunette en platine entourant un cadran blanc sur un tout nouveau bracelet en kevlar noir avec une boucle ardillon en titane. Les fonctions incluent les heures, les minutes, la petite seconde et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Royal Oak", "15500ST.OO.1220ST.01", 43000, 1, "41mm", 5,2, "50m", 2, "Date , Heures et minutes , Secondes", 5, 6,DEFAULT,NULL, 10,
    "Montre automatique à remontage automatique Audemars Piguet Royal Oak (15500STOO1220ST01) d'occasion, dotée d'un boîtier en acier inoxydable de 41 mm entourant un cadran bleu grande tapisserie sur un bracelet en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Royal Oak Extra-Thin", "19433OL.MM.1220IR.01", 290000, 1, "39mm", 1,2, "50m", 2, "Heures et Minutes , Secondes , Date", 6, 6,DEFAULT,NULL, 1,
    "Montre automatique à remontage automatique Audemars Piguet Royal Oak Extra-Thin (15202BCZZ1241BC02) d'occasion, dotée d'un boîtier en or blanc 18 carats de 39 mm avec lunette et attaches en diamant entourant un cadran en diamant bleu sur un bracelet en diamant en or blanc 18 carats. Les fonctions incluent les heures et les minutes. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Royal Oak", "15413OR.YY.1220OR.01", 266450, 1, "41mm", 3,7, "30m", 2, "Heures et Minutes , Secondes , Date", 7, 7,DEFAULT,15, 2,
    "Montre automatique à remontage automatique Audemars Piguet Royal Oak (15413ORYY1220OR01) d'occasion, dotée d'un boîtier en or rose 18 carats de 41 mm avec une lunette baguette en saphir arc-en-ciel entourant un cadran en diamant sur un bracelet en or rose 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Royal Oak Offshore Chronograph", "26238ST.OO.2000ST.01", 44200, 1, "42mm", 5,2, "100m", 2, "Chronographe , Date , Heures et minutes , Secondes , Tachymètre", 5, 6,DEFAULT,NULL, 3,
    "Montre automatique à remontage automatique Audemars Piguet Royal Oak Offshore Chronograph (26238STOO2000ST01) d'occasion, dotée d'un boîtier en acier inoxydable de 42 mm entourant un cadran bleu petite tapisserie sur un bracelet en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Royal Oak Offshore Diver Limited Edition", "15720CN.OO.A002CA.01", 41400, 1, "42mm", 1,3, "300m", 2, "Date , Valve de libération d'hélium , Heures et minutes , Secondes", 2, 1,DEFAULT,NULL, 1,
    "Montre automatique à remontage automatique Audemars Piguet Royal Oak Offshore Diver Limited Edition (15720CNOOA002CA01) d'occasion, dotée d'un boîtier en or blanc 18 carats de 42 mm avec une lunette en céramique noire entourant un cadran Mega Tapiserrie noir sur un bracelet en caoutchouc noir avec une boucle ardillon en or blanc 18 carats . Les fonctions incluent les heures, les minutes, les secondes, la date et la valve de libération d'hélium. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (2, "Royal Oak Offshore Chronograph", "26238OR.OO.2000OR.01", 96000, 1, "42mm", 3,2, "100m", 2, "Chronographe , Date , Heures et minutes , Secondes , Tachymètre", 7, 7,DEFAULT,10, 2,
    "Montre automatique à remontage automatique Audemars Piguet Royal Oak Offshore Chronograph (26238OROO2000OR01) d'occasion, dotée d'un boîtier en or rose 18 carats de 42 mm entourant un cadran bleu petite tapisserie sur un bracelet en or rose 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (3, "Bentley", "A2536513/B954", 5050, 1, "48mm", 5,3, "100m", 2, "Chronographe , Date , Heures et Minutes , Secondes", 1, 1,DEFAULT,NULL, 5,
    "Montre automatique Breitling Bentley (A2536513B954) d'occasion, dotée d'un boîtier en acier inoxydable de 47,8 mm entourant un cadran noir sur un tout nouveau bracelet en alligator noir avec une boucle déployante en acier inoxydable. Les fonctions incluent les heures, les minutes, la petite seconde, la date et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (3, "Bentley GT", "K1336212/A576", 14900, 1, "46mm", 2,6, "100m", 2, "Chronographe , Date , Heures et minutes , Secondes , Règle à calcul", 3, 2,DEFAULT,NULL, 2,
    "Montre automatique à remontage automatique Breitling Bentley GT (K1336212A576) d'occasion, dotée d'un boîtier de 46 mm en or jaune 18 carats entourant un cadran blanc sur un bracelet en cuir marron avec une boucle ardillon en or jaune 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et la règle à calcul. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (3, "Super Chronomat B01", "UB0136251B1U1", 10100, 1, "44mm", 5,3, "200m", 2, "Chronographe , Date , Heures et minutes , Secondes , Tachymètre", 8, 8,DEFAULT,NULL, 2,
    "Montre automatique à remontage automatique Breitling Super Chronomat B01 (UB0136251B1U1) d'occasion, dotée d'un boîtier en acier inoxydable de 44 mm avec une lunette en or rose 18 carats et en céramique noire entourant un cadran noir sur un bracelet Rouleaux en acier inoxydable et or rose 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (3, "Chronomat B01", "RB0134101B1S1", 16350, 1, "42mm", 3,4, "200m", 2, "Chronographe, Date, Heures et Minutes, Secondes", 2, 1,DEFAULT,NULL, 1,
    "Montre automatique Breitling Chronomat B01 (RB0134101B1S1) d'occasion, dotée d'un boîtier en or rose 18 carats de 42 mm entourant un cadran gris sur un bracelet Diver Pro en caoutchouc noir avec une boucle déployante en or rose 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, la date et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (3, "Chrono-Matic 24 Limited Edition", "A2236013/B817", 3750, 1, "44mm", 5,3, "30m",2, "Heures et Minutes , Secondes , Chronographe , Date , Tachymètre", 5, 6,DEFAULT,NULL, 5,
    "Montre automatique à remontage automatique Breitling Chrono-Matic 24 Limited Edition (A2236013/B817) d'occasion, dotée d'un boîtier en acier inoxydable de 44 mm entourant un cadran noir sur un bracelet Pilot en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (3, "Chronomatic", "H2236012/B818", 10250, 1, "44mm", 3,3, "30m",2, "Chronographe , Date , Gmt/Heure mondiale , Heures et minutes , Secondes", 1, 2,DEFAULT,5, 1,
    "Montre automatique à remontage automatique Breitling Chronomatic (H2236012B818) d'occasion, dotée d'un boîtier en or rose 18 carats de 44 mm entourant un cadran noir sur un tout nouveau bracelet en alligator marron avec une boucle déployante en or rose 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe, l'heure GMT/mondiale. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (3, "Navitimer B01 Chronograph", "AB0138211B1A1", 6450, 1, "43mm", 5,3, "30m",2, "Chronographe , Date , Heures et minutes , Secondes , Règle à calcul", 5, 6,DEFAULT,NULL, 2,
    "Montre automatique Breitling Navitimer B01 Chronograph (AB0138211B1A1) d'occasion, dotée d'un boîtier en acier inoxydable de 43 mm entourant un cadran noir sur un bracelet Navitimer en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et la règle à calcul. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous  offrir. " ),


    (3, "Vintage Navitimer Chronograph", "K1332212", 12100, 1, "41mm", 2, 3, "30m", 2, "Chronographe, Date, Heures et minutes, Secondes, Règle à calcul", 1, 2, DEFAULT, NULL, 4,
    "Montre automatique à remontage automatique Breitling Vintage Navitimer Chronograph (K1332212) d'occasion, dotée d'un boîtier en or jaune 18 carats de 41 mm entourant un cadran noir sur un tout nouveau bracelet en alligator marron avec une boucle ardillon en or jaune 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et la règle à calcul. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (3, "Navitimer B01 Chronograph", "RB0127121G1P2", 16550, 1, "46mm", 3, 4, "30m", 2, "Heures et Minutes, Secondes, Chronographe, Date, Règle à calcul", 1, 2, DEFAULT, NULL, 5,
    "Montre automatique à remontage automatique Breitling Navitimer B01 (RB0127121G1P2) d'occasion, dotée d'un boîtier en or rose 18 carats de 46 mm entourant un cadran argenté sur un bracelet en alligator marron avec une boucle déployante en or rose 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et la règle à calcul. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (3, "Premier Day & Date", "A45340211G1P2", 3400, 1, "40mm", 5, 1, "100m", 2, "Date, Jour, Heures et Minutes, Secondes", 1, 2, DEFAULT, NULL, 3,
    "Montre automatique à remontage automatique Breitling Premier Day & Date (A45340211G1P2) d'occasion, dotée d'un boîtier en acier inoxydable de 40 mm entourant un cadran argenté sur un bracelet en alligator marron avec une boucle ardillon en acier inoxydable. Les fonctions incluent les heures, les minutes, les secondes, le jour et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (3, "Premier Automatic", "R37340351G1P1", 9250, 1, "40mm", 3, 1, "100m", 2, "Heures et Minutes, Secondes", 1, 2, DEFAULT, NULL, 6,
    "Montre automatique à remontage automatique Breitling Premier Automatic (R37340351G1P1) d'occasion, dotée d'un boîtier en or rose 18 carats de 40 mm entourant un cadran argenté sur un bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes et la petite seconde. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (3, "Transocean Chronograph", "AB015253/G724", 8150, 1, "43mm", 5, 1, "100m", 2, "Heures, Minutes, Secondes, Date, Chronographe", 3, 1, DEFAULT, NULL, 7,
    "Montre automatique à remontage automatique Breitling Transocean Chronograph (AB015253G724) d'occasion, dotée d'un boîtier en acier inoxydable de 43 mm avec une lunette en diamant entourant un cadran argenté sur un bracelet en cuir noir avec une boucle ardillon en acier inoxydable. Les fonctions incluent les heures, les minutes, la petite seconde, la date et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (3, "Transocean Chronograph", "RB0510U4/BB63", 11550, 1, "46mm", 2, 3, "100m", 2, "Chronographe, Date, Gmt/Heure mondiale, Heures et Minutes, Secondes", 1, 1, DEFAULT, NULL, 5,
    "Montre automatique à remontage automatique Breitling Transocean Unitime (RB0510U4BB63) d'occasion, dotée d'un boîtier de 46 mm en or rose 18 carats entourant un cadran noir « World » sur un tout nouveau bracelet en caoutchouc militaire anthracite avec une boucle déployante en or rose 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, le chronographe, la date et l'heure GMT/mondiale. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir." ),

    (4, "Chronometre Optimum Boutique", "CO BE G 40 A BK", 251850, 1, "40mm", 3, 3, "30m", 1, "Heures et minutes, Indicateur de réserve de marche, Secondes", 1, 1, DEFAULT, NULL, 3,
    "Montre à remontage manuel F.P. Journe Chronomètre Optimum Boutique d'occasion, dotée d'un boîtier de 40 mm en or rose 18 carats entourant un cadran noir sur un tout nouveau bracelet en alligator noir avec une boucle ardillon en or rose 18 carats. Les fonctions comprennent les heures, les minutes, la petite seconde et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Chronometre a Resonance", "BL RND PT 40 A BK", 220000, 1, "40mm", 4, 3, "30m", 1, "Gmt/Heure mondiale, Heures et minutes, Indicateur de réserve de marche, Secondes", 1, 5, DEFAULT, NULL, 4,
    "FP Journe Chronomètre d'occasion, une montre à remontage manuel Resonance, comprend un boîtier en platine de 40 mm entourant un cadran noir et argenté sur un bracelet en alligator gris avec une boucle ardillon en platine. Les fonctions incluent les heures, les minutes, la petite seconde, l'heure GMT/mondiale et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Quantieme Perpetual", "QP G 42 WHG", 102950, 1, "42mm", 3, 6, "30m", 2, "Date, Jour, Heures et Minutes, Mois, Indicateur de réserve de marche, Secondes", 3, 2, DEFAULT, NULL, 6,
    "Montre automatique à remontage automatique FP Journe Quantieme Perpetual d'occasion, dotée d'un boîtier de 42 mm en or rose 18 carats entourant un cadran guilloché blanc sur un bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, le jour, la date, le mois et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Octa Quantieme Perpetuel", "QP PT 42 A BLG", 130450, 1, "42mm", 4, 2, "30m", 2, "Date, Jour, Heures et Minutes, Mois, Calendrier perpétuel, Indicateur de réserve de marche, Secondes", 1, 3, DEFAULT, NULL, 7,
    "Montre automatique à remontage automatique FP Journe Octa Quantieme Perpetuel d'occasion, dotée d'un boîtier en platine de 42 mm entourant un cadran bleu sur un bracelet en alligator bleu avec une boucle ardillon en platine. Les fonctions incluent les heures, les minutes, les secondes, la date, le jour, le mois, le calendrier perpétuel et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Chronometre Bleu", "CSBLEU TA 39 A BL", 79050, 1, "39mm", 7, 2, "30m", 1, "Heures et minutes, Secondes", 1, 9, DEFAULT, 5, 4,
    "Montre à remontage manuel FP Journe Chronomètre Bleu d'occasion, dotée d'un boîtier en tantale de 39 mm entourant un cadran bleu chromé sur un tout nouveau bracelet en alligator beige avec une boucle ardillon en tantale. Les fonctions incluent les heures, les minutes et la petite seconde. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Linesport Centigraphe Sport", "L-CTS AL 42 D GR", 121450, 1, "42mm", 8, 4, "30m", 1, "Chronographe, Heures et Minutes, Secondes", 2, 1, DEFAULT, 5, 5,
    "Montre à remontage manuel FP Journe Linesport Centigraphe Sport d'occasion, dotée d'un boîtier en aluminium de 42 mm entourant un cadran gris sur un tout nouveau bracelet en caoutchouc noir avec une boucle déployante en aluminium. Les fonctions incluent les heures, les minutes, la petite seconde et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Sport Chronograph", "CR G 44 B GR", 121450, 1, "44mm", 3, 4, "30m", 1, "Chronographe, Heures et Minutes, Secondes", 7, 7, DEFAULT, NULL, 6,
    "Montre à remontage manuel FP Journe Sport Chronograph d'occasion, dotée d'un boîtier de 44 mm en or rose 18 carats entourant un cadran gris sur un bracelet en caoutchouc noir et en or rose 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, la petite seconde et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Chronographe Monopoussoir Rattrapante", "CRT TI 44 B GR", 88100, 1, "44mm", 6, 4, "30m", 1, "Chronographe, Date, Heures et minutes, Secondes", 9, 5, DEFAULT, NULL, 3,
    "Montre à remontage manuel FP Journe Chronographe Monopoussoir Rattrapante d'occasion, dotée d'un boîtier en titane de 44 mm entourant un cadran gris sur un bracelet en titane et caoutchouc noir avec une boucle déployante. Les fonctions incluent les heures, les minutes, la petite seconde, la date et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Octa Sport", "L-OSA AL 42 D GR", 55600, 1, "42mm", 8, 4, "30m", 2, "Date, Indicateur jour/nuit, Heures et minutes, Indicateur de réserve de marche, Secondes", 2, 1, DEFAULT, NULL, 5,
    "Montre automatique FP Journe Octa Sport d'occasion, dotée d'un boîtier en aluminium de 42 mm entourant un cadran gris sur un bracelet en caoutchouc noir avec une boucle déployante en aluminium. Les fonctions comprennent les heures, les minutes, la petite seconde, la date, l'indicateur jour/nuit et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Octa Calendrier", "O-OCA G 38 A SI", 249200, 1, "38mm", 3, 4, "30m", 2, "Date, Jour, Heures et minutes, Secondes", 1, 3, DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique FP Journe Octa Calendrier d'occasion, dotée d'un boîtier de 38 mm en or rose 18 carats entourant un cadran gris et argenté sur un bracelet en alligator bleu avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le jour et le mois. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Octa Calendrier", "O-OCA PT 38 A SI", 139150, 1, "38mm", 4, 4, "30m", 2, "Date, Jour, Heures et minutes, Mois, Secondes", 1, 1, DEFAULT, NULL, 4,
    "Montre automatique à remontage automatique FP Journe Octa Calendrier d'occasion, dotée d'un boîtier en platine de 38 mm entourant un cadran gris et argenté sur un bracelet en alligator noir avec une boucle ardillon en platine. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le jour et le mois. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Chronometre A Resonance", "S-RN G 40 A RG", 222950, 1, "40mm", 3, 8, "30m", 1, "Gmt/Heure mondiale, Heures et minutes, Indicateur de réserve de marche, Secondes", 1, 2, DEFAULT, NULL, 4,
     "Montre FP Journe Chronomètre d'occasion à remontage manuel Resonance, dotée d'un boîtier de 40 mm en or rose 18 carats entourant un cadran rose sur un bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, l'heure GMT/mondiale et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (4, "Tourbillon Souverain", "S-TN PT 40 B SI", 325600, 1, "40mm", 4, 4, "30m", 1, "Heures et minutes, Secondes, Tourbillon", 10, 10, DEFAULT, NULL,5,
    "Montre à remontage manuel FP Journe Tourbillon Souverain d'occasion, dotée d'un boîtier en platine de 40 mm entourant un cadran gris sur un tout nouveau bracelet avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes, le tourbillon. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir."),

    (5, "Endeavour Perpetual Calendar", "1341-0200", 23150, 1, "40mm", 1, 1, "30m", 1, "Date, Heures et minutes, Mois, Calendrier perpétuel, Indicateur de réserve de marche, Secondes", 1, 1, DEFAULT, NULL, 2,
    "Montre à remontage manuel H. Moser & Cie Endeavour Perpetual Calendar (13410200) d'occasion, dotée d'un boîtier en or blanc 18 carats de 40,8 mm entourant un cadran argenté sur un bracelet en alligator noir avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes, les secondes, la date, le mois, le calendrier perpétuel et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (5, "Endeavour Perpetual Calendar", "341.501.001", 25000, 1, "41mm", 3, 3, "50m", 1, "Heures et Minutes, Secondes, Date, Indicateur de réserve de marche", 1, 1, DEFAULT, NULL, 8,
    "Montre à remontage manuel H. Moser & Cie. Endeavour Perpetual Calendar (341501001) d'occasion, dotée d'un boîtier en or rose 18 carats de 40,8 mm entourant un cadran noir sur un tout nouveau bracelet en alligator noir avec une boucle déployante en or rose 18 carats. Les fonctions comprennent les heures, les minutes, la petite seconde, la date et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (5, "Endeavour Perpetual Calendar", "1341-0500", 19450, 1, "41mm", 6, 3, "30m", 1, "Date, Heures et Minutes, Mois, Calendrier perpétuel, Indicateur de réserve de marche, Secondes", 1, 1, DEFAULT, NULL, 1,
    "Montre manuelle H. Moser & Cie. Endeavour Perpetual Calendar (13410500) d'occasion, dotée d'un boîtier en titane à revêtement DLC noir de 40,8 mm entourant un cadran noir sur un bracelet en alligator noir avec une boucle ardillon en titane à revêtement DLC noir. Les fonctions comprennent les heures, les minutes, la petite seconde, la date et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (5, "Pioneer Tourbillon", "3804-1205", 37250, 1, "42mm", 5, 2, "120m", 2, "Heures et minutes, Secondes, Tourbillon", 5, 6, DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique H. Moser & Cie Pioneer Tourbillon (38041205) d'occasion, dotée d'un boîtier en acier inoxydable de 42,8 mm entourant un cadran de fumée bleu lagon sur un bracelet en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et le tourbillon. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (5, "Pioneer Perpetual Calendar", "3800-0900", 24150, 1, "42mm", 3, 4, "120m", 1, "Heures et Minutes, Secondes, Date, Indicateur de réserve de marche", 2, 1, DEFAULT, NULL, 1,
    "Montre à remontage manuel H. Moser & Cie. Pioneer Perpetual Calendar (38000900) d'occasion, dotée d'un boîtier en titane à revêtement DLC noir de 42,8 mm et d'un boîtier en or rose 18 carats entourant un cadran Fume ardoise sur un tout nouveau bracelet en caoutchouc noir mat avec un revêtement DLC noir boucle ardillon en titane. Les fonctions comprennent les heures, les minutes, la petite seconde, la date et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (5, "Pioneer S RB Limited Edition", "3200-0500", 15750, 1, "40mm", 6, 2, "120m", 2, "Heures et minutes, Secondes", 9, 5, DEFAULT, NULL, 3,
    "Montre automatique à remontage automatique H. Moser & Cie Pioneer S RB Limited Edition (32000500) d'occasion, dotée d'un boîtier en titane de 40 mm entourant un cadran bleu sur un bracelet en titane avec boucle déployante. Les fonctions incluent les heures, les minutes et les secondes. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (5, "Streamliner Tourbillon", "6804-1201", 69650, 1, "40mm", 5, 4, "120m", 2, "Heures et minutes, Tourbillon", 5, 6, DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique H. Moser & Cie. Streamliner Tourbillon (68041201) d'occasion, dotée d'un boîtier en acier inoxydable de 40 mm avec une lunette baguette en saphir arc-en-ciel entourant un cadran gris sur un bracelet en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes et le tourbillon. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (5, "Streamliner Tourbillon", "6804-0401", 102150, 1, "40mm", 3, 3, "120m", 2, "Heures et minutes, Secondes, Tourbillon", 7, 7, DEFAULT, 5, 3,
    "Montre automatique à remontage automatique H. Moser & Cie Streamliner Tourbillon (68040401) d'occasion, dotée d'un boîtier en or rose 18 carats de 40 mm entourant un cadran noir sur un bracelet en or rose 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et le tourbillon. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir."),


    (6, "Constellation Globemaster", "130.33.39.21.03.001", 6050, 1, "39mm", 5, 2, "100m", 2, "Date, Heures et minutes, Secondes", 1, 1, DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique Omega Constellation Globemaster (13033392103001) d'occasion, dotée d'un boîtier en acier inoxydable de 39 mm entourant un cadran bleu sur un tout nouveau bracelet en alligator noir avec une boucle déployante en acier inoxydable. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (6, "Constellation", "123.55.31.20.51.001", 8700, 1, "31mm", 1, 3, "100m", 2, "Date, Heures et Minutes, Secondes", 6, 6, DEFAULT, NULL, 3,
    "Montre automatique à remontage automatique Omega Constellation (12355312051001) d'occasion, dotée d'un boîtier en or blanc 18 carats de 31 mm avec une lunette en diamant entourant un cadran en diamant supernova noir sur un bracelet en or blanc 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (6, "Constellation", "123.53.35.60.63.001", 5050, 1, "35mm", 3, 9, "100m", 3, "Heures et Minutes, Secondes, Date", 1, 2, DEFAULT, NULL, 5,
    "Montre à quartz Omega Constellation (12353356063001) d'occasion, dotée d'un boîtier de 35 mm en or rose 18 carats entourant un cadran en diamant supernova marron sur un tout nouveau bracelet en alligator marron avec une boucle déployante en or rose 18 carats. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (6, "De Ville Prestige", "424.10.37.20.03.001", 2750, 1, "37mm", 5, 2, "30m", 2, "Date, Heures et minutes, Secondes", 5, 6, DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique Omega De Ville Prestige (42410372003001) d'occasion, dotée d'un boîtier en acier inoxydable de 36,8 mm entourant un cadran bleu sur un bracelet en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


   (6, "De Ville Tresor", "432.58.40.21.05.003", 8800, 1, "40mm", 3, 6, "30m", 1, "Date, Heures et Minutes, Secondes", 1, 2, DEFAULT, 5, 5,
    "Montre à remontage manuel Omega De Ville Tresor (43258402105003) d'occasion, dotée d'un boîtier en or rose 18 carats de 40 mm avec une lunette en diamant entourant un cadran en nacre blanche sur un tout nouveau bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (6, "Seamster 300 'Spectre' Limited Edition", "233.32.41.21.01.001", 11250, 1, "41mm", 5, 3, "300m", 2, "Antimagnétique, Heures et minutes, Secondes", 5, 6, DEFAULT, NULL, 4,
    "Montre automatique à remontage automatique Omega Seamster 300 'Spectre' d'occasion (23332412101001), dotée d'un boîtier en acier inoxydable de 41 mm avec une lunette en céramique noire entourant un cadran noir sur un bracelet en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et l'antimagnétique. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (6, "Seamaster Planet Ocean 600M 'Deep Black'", "215.63.46.22.01.001", 10200, 1, "45mm", 9, 3, "600m", 2, "Antimagnétique, Date, Gmt/Heure mondiale, Valve de libération d'hélium, Heures et minutes, Secondes", 1, 1, DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique Omega Seamaster Planet Ocean 600M 'Deep Black' (21563462201001) d'occasion, dotée d'un boîtier en céramique noire de 45,5 mm avec une lunette en or rose 18 carats entourant un cadran noir sur un bracelet noir avec un bracelet incrusté d'alligator avec une céramique noire et boucle déployante en titane. Les fonctions incluent les heures, les minutes, les secondes, la date, l'antimagnétique, l'heure gmt/mondiale et la valve de libération d'hélium. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (6, "Seamaster Aqua Terra 150M Chronometer", "220.92.43.22.99.001", 10700, 1, "43mm", 6, 4, "150m", 2, "Antimagnétique, Date, Gmt/Heure mondiale, Heures et minutes, Secondes", 2, 1, DEFAULT, NULL, 1,
    "Montre automatique à remontage automatique Omega Seamaster Aqua Terra 150M (22092432299001) d'occasion, dotée d'un boîtier en titane de 43 mm avec une lunette en céramique noire entourant un cadran pôle Nord noir et gris sur un bracelet en caoutchouc noir avec une boucle déployante en titane. Les fonctions incluent les heures, les minutes, les secondes, la date, l'antimagnétique et l'heure GMT/mondiale. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (6, "Speedmaster Professional Moonwatch Apollo Limited Edition", "311.30.42.30.99.001", 17450, 1, "42mm", 5, 3, "50m", 1, "Chronographe, Heures et minutes, Secondes, Tachymètre", 5, 6, DEFAULT, NULL, 3,
    "Montre à remontage manuel Omega Speedmaster Professional Moonwatch Apollo Limited Edition (31130423099001) d'occasion, dotée d'un boîtier en acier inoxydable de 42 mm entourant un cadran en météorite noire sur un bracelet en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, la petite seconde, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (6, "Speedmaster Moonwatch Chronograph", "311.63.44.51.99.001", 13100, 1, "44mm", 9, 3, "50m", 2, "Chronographe, Date, Heures et minutes, Secondes, Tachymètre", 1, 5, DEFAULT, NULL, 5,
    "Montre automatique à remontage automatique Omega Speedmaster Moonwatch (31163445199001) d'occasion, dotée d'un boîtier en céramique grise de 44,2 mm avec une lunette en or rose 18 carats entourant un cadran gris météorite sur un bracelet en alligator gris avec une boucle déployante en céramique et titane. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (6, "Speedmaster Anniversary Series Chronograph", "310.60.42.50.99.001", 46050, 1, "42mm", 2, 5, "50m", 1, "Antimagnétique, Chronographe, Heures et minutes, Secondes, Tachymètre", 11, 11, DEFAULT, NULL, 2,
    "Montre à remontage manuel Omega Speedmaster Anniversary Series Chronograph (31060425099001) d'occasion, dotée d'un boîtier en or jaune 18 carats de 42 mm avec une lunette en céramique rouge entourant un cadran en or sur un bracelet en or jaune 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes, l'antimagnétique, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir."),

    (7, "Aquanaut", "5060A-001", 48700, 1, "35mm", 5, 3, "120m", 2, "Date, Heures et minutes, Secondes", 2, 2, DEFAULT, NULL, 2,
    "Montre automatique Patek Philippe Aquanaut (5060A001) d'occasion, dotée d'un boîtier en acier inoxydable de 35 mm entourant un cadran noir en relief sur un bracelet en caoutchouc marron avec une boucle déployante en acier inoxydable. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Aquanaut", "5168G-001", 74550, 1, "42mm", 1, 2, "120m", 2, "Date, Heures et minutes, Secondes", 2, 3, DEFAULT, NULL, 1,
    "Montre automatique à remontage automatique Patek Philippe Aquanaut (5168G001) d'occasion, dotée d'un boîtier en or blanc 18 carats de 42,2 mm entourant un cadran en relief bleu sur un bracelet en caoutchouc bleu avec une boucle déployante en or blanc 18 carats. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Aquanaut", "5066/1J-001", 65500, 1, "36mm", 2, 3, "120m", 2, "Date, Heures et minutes, Secondes", 11, 11, DEFAULT, NULL, 3,
    "Montre automatique Patek Philippe Aquanaut (50661J001) d'occasion, dotée d'un boîtier en or jaune 18 carats de 36 mm entourant un cadran noir sur un bracelet en or jaune 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Calatrava", "5196G-001", 16700, 1, "37mm", 1, 1, "30m", 1, "Heures et minutes, Secondes", 1, 1, DEFAULT, NULL, 5,
    "Montre à remontage manuel Patek Philippe Calatrava (5196G001) d'occasion, dotée d'un boîtier en or blanc 18 carats de 37 mm entourant un cadran gris argenté sur un tout nouveau bracelet en alligator noir avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes et la petite seconde. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Calatrava", "3802/205", 14400, 1, "33mm", 2, 6, "30m", 2, "Heures et Minutes, Secondes, Date", 11, 11, DEFAULT, 10, 6,
    "Montre automatique à remontage automatique Patek Philippe Calatrava (3802205) d'occasion, dotée d'un boîtier en or jaune 18 carats de 33 mm avec une lunette cloutée entourant un cadran blanc sur un bracelet en or jaune 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Calatrava Pilot Travel Time", "5524R-001", 37250, 1, "42mm", 3, 9, "60m", 2, "Gmt/Heure mondiale, Heures et minutes, Secondes", 3, 2, DEFAULT, NULL, 3,
    "Montre automatique à remontage automatique Patek Philippe Calatrava Pilot Travel Time (5524R001) d'occasion, dotée d'un boîtier en or rose 18 carats de 42 mm entourant un cadran marron sur un bracelet en cuir marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, les secondes et l'heure gmt/mondiale. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Complications World Time", "5231G-001", 107250, 1, "38mm", 1, 10, "30m", 2, "GMT/Heure mondiale, Heures et Minutes", 1, 3, DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique Patek Philippe Complications World Time (5231G001) d'occasion, dotée d'un boîtier en or blanc 18 carats de 38,5 mm entourant un cadran central extérieur argenté en émail cloisonné grand feu sur un tout nouveau bracelet en alligator bleu marine avec une boucle déployante en or blanc 18 carats. Les fonctions incluent les heures, les minutes et l'heure mondiale. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "175th Anniversary Chronograph", "5975J-001", 54050, 1, "40mm", 2, 1, "50m", 2, "Chronographe, Heures et minutes, Secondes", 1, 2, DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique Patek Philippe 175e anniversaire (5975J001) d'occasion, dotée d'un boîtier de 40 mm en or jaune 18 carats entourant un cadran argenté sur un bracelet en alligator marron avec une boucle déployante Calatrava Cross 175e anniversaire en or jaune 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Complications Annual Calendar", "5396R-015", 60900, 1, "38mm", 3, 2, "30m", 2, "Indicateur 24 heures, Calendrier annuel, Date, Jour, Mois, Phase de lune, Heures et minutes, Secondes", 1, 3, DEFAULT, NULL, 3,
    "Montre automatique à remontage automatique Patek Philippe Complications Annual Calendar (5396R015) d'occasion, dotée d'un boîtier en or rose 18 carats de 38,5 mm entourant un cadran en diamant baguette bleu sunburst sur un bracelet en alligator bleu avec une boucle déployante Calatrava Cross en or rose 18 carats. Les fonctions comprennent les heures, les minutes, les secondes, la date, l'indicateur 24 heures, le calendrier annuel, le jour, le mois et la phase de lune. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Gondolo Serata", "4972G-001", 17450, 1, "27mm", 1, 6, "30m", 3, "Heures et minutes", 12, 3, DEFAULT, NULL, 2,
    "Montre à quartz Patek Philippe Gondolo Serata (4972G001) d'occasion, dotée d'un boîtier en or blanc 18 carats de 27,4 mm x 39,7 mm avec une lunette en diamant et des attaches entourant un cadran en nacre guillochée blanche sur un tout nouveau bracelet en satin bleu avec un or blanc 18 carats boucle ardillon. Les fonctions incluent les heures et les minutes. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Gondolo", "5100J-001", 27200, 1, "34x46mm", 2, 1, "30m", 1, "Heures et minutes, Indicateur de réserve de marche, Secondes", 1, 1, DEFAULT, NULL, 3,
    "Montre à remontage manuel Patek Philippe Gondolo (5100J001) d'occasion, dotée d'un boîtier en or jaune 18 carats de 34 mm x 46 mm entourant un cadran argenté sur un bracelet en alligator noir avec une boucle ardillon en or jaune 18 carats. Les fonctions comprennent les heures, les minutes, la petite seconde et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Gondolo", "5098P-001", 21600, 1, "32x42mm", 4, 1, "30m", 1, "Heures et minutes", 1, 1, DEFAULT, 15, 2,
    "Montre à remontage manuel Patek Philippe Gondolo (5098P001) d'occasion, dotée d'un boîtier en platine de 32 mm x 42 mm entourant un cadran argenté sur un tout nouveau bracelet en alligator noir avec une boucle ardillon en platine. Les fonctions incluent les heures et les minutes. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Grand Complications Perpetual Calendar Chronograph", "5270G-001", 115950, 1, "41mm", 1, 1, "30m", 1, "Chronographe , Date , Jour , Indicateur jour/nuit , Heures et minutes , Phase de lune , Calendrier perpétuel , Secondes", 1, 1,DEFAULT, NULL, 1,
    "Montre à remontage manuel Patek Philippe Grand Complications Perpetual Calendar Chronograph (5270G001) d'occasion, dotée d'un boîtier en or blanc 18 carats de 41 mm entourant un cadran argenté sur un bracelet en alligator noir avec une boucle déployante Calatrava Cross en or blanc 18 carats. Les fonctions comprennent les heures, les minutes, les secondes, la date, le chronographe, le jour, l'indicateur jour/nuit, la phase de lune et le calendrier perpétuel. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Grand Complications Minute Repeater Chronograph", "5208R-001", 1118600, 1, "42mm", 3, 3, "30m", 2, "Chronographe , Date , Jour , Indicateur jour/nuit , Heures et minutes , Répétition minutes , Mois , Phase de lune , Calendrier perpétuel , Secondes", 1, 1,DEFAULT, NULL, 1,
    "Montre automatique à remontage automatique Patek Philippe Grand Complications Chronographe à répétition minutes (5208R001) d'occasion, dotée d'un boîtier en or rose 18 carats de 42 mm entourant un cadran soleillé noir ébène sur un bracelet en alligator noir avec une boucle déployante en or rose 18 carats. Les fonctions comprennent les heures, les minutes, la petite seconde, la date, le chronographe, le jour, l'indicateur jour/nuit, la répétition minutes, le mois, la phase de lune et le calendrier perpétuel. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Grand Complications Sky Moon Tourbillon", "5002P-001", 2034850, 1, "42mm", 4, 1, "30m", 1, "Heures et Minutes , Secondes , Date , Jour , GMT/Heure Mondiale , Mois , Phase de Lune , Tourbillon", 1, 1,DEFAULT, NULL, 1,
    "Montre à remontage manuel Patek Philippe Grand Complications Sky Moon Tourbillon (5002P001) d'occasion, dotée d'un boîtier en platine de 42,80 mm entourant des cadrans argentés et bleus sur un tout nouveau bracelet en alligator noir avec une boucle déployante Calatrava Cross en platine. Les fonctions comprennent les heures, les minutes, les secondes, le jour, la date, le mois, la phase de lune, le GMT, le tourbillon et l'indicateur des années bissextiles. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Nautilus Moonphase", "5712/1A-001", 100900, 1, "40mm", 5, 2, "60m", 2, "Date , Heures et minutes , Phase de lune , Indicateur de réserve de marche , Secondes", 5, 6, DEFAULT, NULL, 3,
    "Montre automatique à remontage automatique Patek Philippe Nautilus Moonphase (57121A001) d'occasion, dotée d'un boîtier en acier inoxydable de 40 mm entourant un cadran noir et bleu sur un bracelet en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes, la date, la phase de lune et l'indicateur de réserve de marche. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Nautilus", "3800/5", 79550, 1, "37mm", 2, 11, "120m", 2, "Heures et Minutes , Secondes", 11, 11, DEFAULT, NULL, 3,
    "Montre automatique à remontage automatique Patek Philippe Nautilus (38005) d'occasion, dotée d'un boîtier en or jaune 18 carats de 37,5 mm avec une lunette en diamant entourant un cadran en or jaune sur un bracelet en or jaune 18 carats avec une boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et les dates. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (7, "Nautilus Chronograph", "5980R-001", 113000, 1, "40mm", 3, 9, "120m", 2, "Chronographe , Date , Heures et minutes , Secondes", 3, 2,DEFAULT, NULL, 3,
    "Montre automatique à remontage automatique Patek Philippe Nautilus Chronograph (5980R001) d'occasion, dotée d'un boîtier en or rose 18 carats de 40,5 mm entourant un cadran noir-marron sur un bracelet en cuir marron avec une boucle déployante en or rose 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, la date et un chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir."),

    (8, "Fiftysix", "4600E/000A-B487", 13000, 1, "40mm", 5, 2, "30m", 2, "Date , Heures et minutes , Secondes", 1, 3,DEFAULT, NULL, 4,
    "Montre automatique à remontage automatique Vacheron Constantin Fiftysix (4600E000AB487) d'occasion, dotée d'un boîtier en acier inoxydable de 40 mm entourant un cadran bleu sur un tout nouveau bracelet en alligator bleu marine avec une boucle déployante en acier inoxydable. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (8, "Fiftysix Complete Calendar", "4000E/000R-B438", 33500, 1, "40mm", 3, 1, "30m", 2, "Date , Jour , Heures et minutes , Mois , Phase de lune , Secondes", 1, 2,DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique Vacheron Constantin Fiftysix Complete Calendar (4000E000RB438) d'occasion, dotée d'un boîtier de 40 mm en or rose 18 carats entourant un cadran argenté sur un bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, les secondes, la date, le jour, le mois et la phase de lune. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (8, "Historiques Triple Calendrier 1942", "3110V/000A-B425", 16800, 1, "40mm", 5, 12, "30m", 1, "Calendrier , Date , Jour , Heures et minutes , Mois , Secondes", 1, 1,DEFAULT, NULL, 1,
    "Montre à remontage manuel Vacheron Constantin Historiques Triple Calendrier 1942 (3110V000AB425) d'occasion, dotée d'un boîtier en acier inoxydable de 40 mm entourant un cadran ivoire sur un tout nouveau bracelet en alligator noir avec une boucle ardillon en acier inoxydable. Les fonctions incluent les heures, les minutes, la petite seconde, la date, le jour et le mois. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (8, "Historiques Cornes de Vache 1955", "5000H/000R-B059", 46800, 1, "38mm", 3, 6, "30m", 1, "Chronographe , Heures et minutes , Secondes", 3, 2,DEFAULT, NULL, 3,
    "Montre à remontage manuel Vacheron Constantin Historiques Cornes de Vache 1955 (5000H000RB059) d'occasion, dotée d'un boîtier en or rose 18 carats de 38,5 mm entourant un cadran argenté sur un tout nouveau bracelet en cuir marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (8, "Historiques Cornes De Vache 1955", "5000H/000P-B058", 51500, 1, "38mm", 4, 1, "150m", 1, "Chronographe , Heures et Minutes , Secondes , Tachymètre", 1, 3,DEFAULT, NULL, 2,
    "Montre à remontage manuel Vacheron Constantin Historiques Cornes De Vache 1955 (5000H000PB058) d'occasion, dotée d'un boîtier en platine de 38,5 mm entourant un cadran argenté sur un bracelet en alligator bleu marine avec une boucle ardillon en platine. Les fonctions incluent les heures, les minutes, la petite seconde, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (8, "Malte", "42008/000G-8979", 12800, 1, "35x392mm", 1, 1, "50m", 2, "Date , Jour , Heures et Minutes , Secondes", 1, 1,DEFAULT, NULL, 3,
    "Montre automatique à remontage automatique Vacheron Constantin Malte (42008000G8979) d'occasion, dotée d'un boîtier en or blanc 18 carats de 35,6 mm x 39,5 mm entourant un cadran argenté sur un tout nouveau bracelet en alligator noir avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, le jour et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),


    (8, "Malte", "82230/000R-9963", 18500, 1, "36mm", 3, 1, "50m", 1, "Heure seulement , Heures et minutes , Secondes", 1, 1,DEFAULT, NULL, 4,
    "Montre à remontage manuel Vacheron Constantin Malte (82230000R9963) d'occasion, dotée d'un boîtier en or rose 18 carats de 36,7 mm x 42 mm entourant un cadran argenté sur un bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes et la petite seconde. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Malte Tonneau Tourbillon Openworked", "30067/000P-8953", 83900, 1, "36mm", 4, 13, "30m", 1, "Date , Heures et minutes , Secondes , Tourbillon", 1, 1,DEFAULT, NULL, 2,
    "Montre à remontage manuel Vacheron Constantin Malte Tonneau Tourbillon ajouré (30067000P8953) d'occasion, dotée d'un boîtier en platine de 36 mm entourant un cadran squelette sur un bracelet en alligator noir avec une boucle ardillon en platine. Les fonctions incluent les heures, les minutes, les secondes, la date et le tourbillon. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Metiers dArt Les Masques China Mask Limited Edition", "86070/000J-9400", 67250, 1, "40mm", 2, 14, "30m", 4, "Heures et Minutes , Secondes , Jour et Date , Minutes sautées", 1, 2, DEFAULT, NULL, 1,
    "Montre automatique à remontage automatique Vacheron Constantin Metiers dArt Les Masques China Mask Limited Edition (86070000J9400) d'occasion, dotée d'un boîtier en or jaune 18 carats de 40 mm entourant un cadran squeletté violet sur un bracelet en alligator marron avec une boucle déployante en or jaune 18 carats. Les fonctions incluent les heures, les minutes sautantes, le jour et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Metiers D'Art 'Nightingale'", "33222/000R-9517", 30850, 1, "40mm", 3, 3, "30m", 1, "Heures et Minutes , Secondes", 1, 1, DEFAULT, 5, 1,
    "Montre à remontage manuel Vacheron Constantin Metiers D'Art 'Nightingale' (33222000R9517) d'occasion, dotée d'un boîtier en or rose 18 carats de 40 mm entourant un cadran squelette en émail noir sur un tout nouveau bracelet en alligator noir avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures et les minutes. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Metiers dArt Les Masques Mexico Mask Limited Edition", "86070/000P-9401", 67050, 1, "40mm", 4, 14, "30m",4, "Heures et Minutes , Secondes , Jour et Date , Minutes sautées", 1, 2, DEFAULT, NULL, 1,
    "Montre automatique à remontage automatique Vacheron Constantin Metiers dArt Les Masques Mexico Mask Limited Edition (86070000P9401) d'occasion, dotée d'un boîtier en platine de 40 mm entourant un cadran squeletté gris sur un bracelet en alligator marron avec une boucle déployante en platine. Les fonctions incluent les heures, les minutes sautantes, le jour et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Overseas", "4500V/110A-B483", 23850, 1, "41mm", 5, 3, "150m", 2, "Date , Heures et Minutes , Secondes", 5, 6, DEFAULT, NULL, 5,
    "Montre automatique à remontage automatique Vacheron Constantin Overseas (4500V110AB483) d'occasion, dotée d'un boîtier en acier inoxydable de 41 mm entourant un cadran noir sur un bracelet en acier inoxydable avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Overseas Chronograph", "49140/423J-8791", 46350, 1, "40mm", 2, 1, "150m", 2, "Heures et Minutes , Secondes , Chronographe , Date", 11, 11,DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique Vacheron Constantin Overseas Chronograph (49140423J8791) d'occasion, dotée d'un boîtier en or jaune 18 carats de 40 mm entourant un cadran argenté sur un bracelet en or jaune 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, la petite seconde, la date et le chronographe. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Overseas", "4500V/110R-B705", 64400, 1, "41mm", 3, 2, "150m", 2, "Date , Heures et Minutes , Secondes", 7, 7,DEFAULT, NULL, 2,
    "Montre automatique à remontage automatique Vacheron Constantin Overseas (4500V110RB705) d'occasion, dotée d'un boîtier en or rose 18 carats de 41 mm entourant un cadran bleu sur un bracelet en or rose 18 carats avec boucle déployante. Les fonctions incluent les heures, les minutes, les secondes et la date. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Patrimony Traditionnelle Chronograph", "47192/000G-9504", 32200, 1, "42mm", 1, 1, "30m", 1, "Chronographe , Heures et Minutes , Secondes", 1, 1,DEFAULT, NULL, 1,
    "Montre à remontage manuel Vacheron Constantin Patrimony Traditionnelle Chronographe (47192000G9504) d'occasion, dotée d'un boîtier en or blanc 18 carats de 42 mm entourant un cadran argenté sur un tout nouveau bracelet en alligator noir avec une boucle déployante en or blanc 18 carats. Les fonctions incluent les heures, les minutes, la petite seconde, le chronographe et le tachymètre. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Patrimony", "81180/000R-9159", 13850, 1, "40mm", 3, 1, "30m", 1, "heures et minutes", 1, 1, DEFAULT, NULL, 2,
    "Montre à remontage manuel Vacheron Constantin Patrimony (81180000R9159) d'occasion, dotée d'un boîtier en or rose 18 carats de 40 mm entourant un cadran argenté sur un bracelet en alligator noir avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures et les minutes. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Patrimony Grand Taille", "81180/000P-9539", 22200, 1, "40mm", 4, 4, "50m", 1, "heures et minutes", 1, 1, DEFAULT, NULL, 3,
    "Montre à remontage manuel Vacheron Constantin Patrimony Grande Taille (81180000P9539) d'occasion, dotée d'un boîtier en platine de 40 mm entourant un cadran gris sur un tout nouveau bracelet en alligator noir avec une boucle ardillon en platine. Les fonctions incluent les heures et les minutes. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),



    (8, "Traditionnelle Complete Calendar Openface", "4020T/000G-B655", 42200, 1, "41mm", 1, 14, "30m", 2, "Date , Jour , Heures et minutes , Mois , Phase de lune", 1, 5,DEFAULT, NULL, 1,
    "Montre automatique à remontage automatique Vacheron Constantin Traditionnelle à calendrier complet Openface (4020T000GB655) d'occasion, dotée d'un boîtier en or blanc 18 carats de 41 mm entourant un cadran squelette gris sur un bracelet en alligator gris avec une boucle ardillon en or blanc 18 carats. Les fonctions incluent les heures, les minutes, la date, le jour, le mois et les phases de lune. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir. " ),

    (8, "Traditionnelle Complete Calendar Openface", "4020T/000R-B654", 44400, 1, "41mm", 3, 14, "30m", 2, "Date , Jour , Heures et minutes , Mois , Phase de lune", 1, 2,DEFAULT, 10, 1,
    "Montre automatique à remontage automatique Vacheron Constantin Traditionnelle à calendrier complet Openface (4020T000RB654) d'occasion, dotée d'un boîtier en or rose 18 carats de 41 mm entourant un cadran squelette gris sur un bracelet en alligator marron avec une boucle ardillon en or rose 18 carats. Les fonctions incluent les heures, les minutes, les secondes, la date, le jour, le mois et la phase de lune. Cette montre est soigneusement sélectionnée et méticuleusement expertisée par nos maîtres horlogers Horo Haven, garantissant ainsi son authenticité et sa qualité irréprochable. Livrée avec ses papiers d'origine, chaque pièce incarne l'exclusivité et l'élégance intemporelle que seul Horo Haven peut vous offrir.");


INSERT INTO `photo` (`URL`, `Id_Article`) VALUES
                                              ('montres/a._lange_&_söhne/1815/or_blanc/img_1.avif', 1),
                                              ('montres/a._lange_&_söhne/1815/or_blanc/img_2.avif', 1),
                                              ('montres/a._lange_&_söhne/1815/or_blanc/img_3.avif', 1),
                                              ('montres/a._lange_&_söhne/1815/or_blanc/img_4.avif', 1),
                                              ('montres/a._lange_&_söhne/1815/or_blanc/img_5.avif', 1),

                                              ('montres/a._lange_&_söhne/1815/or_jaune/img_1.avif', 2),
                                              ('montres/a._lange_&_söhne/1815/or_jaune/img_2.avif', 2),
                                              ('montres/a._lange_&_söhne/1815/or_jaune/img_3.avif', 2),
                                              ('montres/a._lange_&_söhne/1815/or_jaune/img_4.avif', 2),
                                              ('montres/a._lange_&_söhne/1815/or_jaune/img_5.avif', 2),

                                              ('montres/a._lange_&_söhne/1815/or_rose/img_1.avif', 3),
                                              ('montres/a._lange_&_söhne/1815/or_rose/img_2.avif', 3),
                                              ('montres/a._lange_&_söhne/1815/or_rose/img_3.avif', 3),
                                              ('montres/a._lange_&_söhne/1815/or_rose/img_4.avif', 3),
                                              ('montres/a._lange_&_söhne/1815/or_rose/img_5.avif', 3),

                                              ('montres/a._lange_&_söhne/lange_1/or_blanc/img_1.avif', 4),
                                              ('montres/a._lange_&_söhne/lange_1/or_blanc/img_2.avif', 4),
                                              ('montres/a._lange_&_söhne/lange_1/or_blanc/img_3.avif', 4),
                                              ('montres/a._lange_&_söhne/lange_1/or_blanc/img_4.avif', 4),
                                              ('montres/a._lange_&_söhne/lange_1/or_blanc/img_5.avif', 4),

                                              ('montres/a._lange_&_söhne/lange_1/or_jaune/img_1.avif', 5),
                                              ('montres/a._lange_&_söhne/lange_1/or_jaune/img_2.avif', 5),
                                              ('montres/a._lange_&_söhne/lange_1/or_jaune/img_3.avif', 5),
                                              ('montres/a._lange_&_söhne/lange_1/or_jaune/img_4.avif', 5),
                                              ('montres/a._lange_&_söhne/lange_1/or_jaune/img_5.avif', 5),

                                              ('montres/a._lange_&_söhne/lange_1/platine/img_1.avif', 6),
                                              ('montres/a._lange_&_söhne/lange_1/platine/img_2.avif', 6),
                                              ('montres/a._lange_&_söhne/lange_1/platine/img_3.avif', 6),
                                              ('montres/a._lange_&_söhne/lange_1/platine/img_4.avif', 6),
                                              ('montres/a._lange_&_söhne/lange_1/platine/img_5.avif', 6),

                                              ('montres/a._lange_&_söhne/langematik/or_jaune/img_1.avif', 7),
                                              ('montres/a._lange_&_söhne/langematik/or_jaune/img_2.avif', 7),
                                              ('montres/a._lange_&_söhne/langematik/or_jaune/img_3.avif', 7),
                                              ('montres/a._lange_&_söhne/langematik/or_jaune/img_4.avif', 7),
                                              ('montres/a._lange_&_söhne/langematik/or_jaune/img_5.avif', 7),

                                              ('montres/a._lange_&_söhne/langematik/or_rose/img_1.avif', 8),
                                              ('montres/a._lange_&_söhne/langematik/or_rose/img_2.avif', 8),
                                              ('montres/a._lange_&_söhne/langematik/or_rose/img_3.avif', 8),
                                              ('montres/a._lange_&_söhne/langematik/or_rose/img_4.avif', 8),
                                              ('montres/a._lange_&_söhne/langematik/or_rose/img_5.avif', 8),

                                              ('montres/a._lange_&_söhne/langematik/platine/img_1.avif', 9),
                                              ('montres/a._lange_&_söhne/langematik/platine/img_2.avif', 9),
                                              ('montres/a._lange_&_söhne/langematik/platine/img_3.avif', 9),
                                              ('montres/a._lange_&_söhne/langematik/platine/img_4.avif', 9),
                                              ('montres/a._lange_&_söhne/langematik/platine/img_5.avif', 9),

                                              ('montres/a._lange_&_söhne/richard_lange/or_blanc/img_1.avif', 10),
                                              ('montres/a._lange_&_söhne/richard_lange/or_blanc/img_2.avif', 10),
                                              ('montres/a._lange_&_söhne/richard_lange/or_blanc/img_3.avif', 10),
                                              ('montres/a._lange_&_söhne/richard_lange/or_blanc/img_4.avif', 10),
                                              ('montres/a._lange_&_söhne/richard_lange/or_blanc/img_5.avif', 10),

                                              ('montres/a._lange_&_söhne/richard_lange/or_rose/img_1.avif', 11),
                                              ('montres/a._lange_&_söhne/richard_lange/or_rose/img_2.avif', 11),
                                              ('montres/a._lange_&_söhne/richard_lange/or_rose/img_3.avif', 11),
                                              ('montres/a._lange_&_söhne/richard_lange/or_rose/img_4.avif', 11),
                                              ('montres/a._lange_&_söhne/richard_lange/or_rose/img_5.avif', 11),

                                              ('montres/a._lange_&_söhne/richard_lange/platine/img_1.avif', 12),
                                              ('montres/a._lange_&_söhne/richard_lange/platine/img_2.avif', 12),
                                              ('montres/a._lange_&_söhne/richard_lange/platine/img_3.avif', 12),
                                              ('montres/a._lange_&_söhne/richard_lange/platine/img_4.avif', 12),
                                              ('montres/a._lange_&_söhne/richard_lange/platine/img_5.avif', 12),

                                              ('montres/a._lange_&_söhne/saxonia/or_blanc/img_1.avif', 13),
                                              ('montres/a._lange_&_söhne/saxonia/or_blanc/img_2.avif', 13),
                                              ('montres/a._lange_&_söhne/saxonia/or_blanc/img_3.avif', 13),
                                              ('montres/a._lange_&_söhne/saxonia/or_blanc/img_4.avif', 13),
                                              ('montres/a._lange_&_söhne/saxonia/or_blanc/img_5.avif', 13),

                                              ('montres/a._lange_&_söhne/saxonia/or_jaune/img_1.avif', 14),
                                              ('montres/a._lange_&_söhne/saxonia/or_jaune/img_2.avif', 14),
                                              ('montres/a._lange_&_söhne/saxonia/or_jaune/img_3.avif', 14),
                                              ('montres/a._lange_&_söhne/saxonia/or_jaune/img_4.avif', 14),
                                              ('montres/a._lange_&_söhne/saxonia/or_jaune/img_5.avif', 14),

                                              ('montres/a._lange_&_söhne/saxonia/or_rose/img_1.avif', 15),
                                              ('montres/a._lange_&_söhne/saxonia/or_rose/img_2.avif', 15),
                                              ('montres/a._lange_&_söhne/saxonia/or_rose/img_3.avif', 15),
                                              ('montres/a._lange_&_söhne/saxonia/or_rose/img_4.avif', 15),
                                              ('montres/a._lange_&_söhne/saxonia/or_rose/img_5.avif', 15),

                                              ('montres/a._lange_&_söhne/zeitwerk/or_blanc/img_1.avif', 16),
                                              ('montres/a._lange_&_söhne/zeitwerk/or_blanc/img_2.avif', 16),
                                              ('montres/a._lange_&_söhne/zeitwerk/or_blanc/img_3.avif', 16),
                                              ('montres/a._lange_&_söhne/zeitwerk/or_blanc/img_4.avif', 16),
                                              ('montres/a._lange_&_söhne/zeitwerk/or_blanc/img_5.avif', 16),

                                              ('montres/a._lange_&_söhne/zeitwerk/platine/img_1.avif', 17),
                                              ('montres/a._lange_&_söhne/zeitwerk/platine/img_2.avif', 17),
                                              ('montres/a._lange_&_söhne/zeitwerk/platine/img_3.avif', 17),
                                              ('montres/a._lange_&_söhne/zeitwerk/platine/img_4.avif', 17),
                                              ('montres/a._lange_&_söhne/zeitwerk/platine/img_5.avif', 17),

                                              ('montres/audemars_piguet/code_11.59/acier_inoxydable/img_1.avif', 18),
                                              ('montres/audemars_piguet/code_11.59/acier_inoxydable/img_2.avif', 18),
                                              ('montres/audemars_piguet/code_11.59/acier_inoxydable/img_3.avif', 18),
                                              ('montres/audemars_piguet/code_11.59/acier_inoxydable/img_4.avif', 18),
                                              ('montres/audemars_piguet/code_11.59/acier_inoxydable/img_5.avif', 18),

                                              ('montres/audemars_piguet/code_11.59/or_blanc/img_1.avif', 19),
                                              ('montres/audemars_piguet/code_11.59/or_blanc/img_2.avif', 19),
                                              ('montres/audemars_piguet/code_11.59/or_blanc/img_3.avif', 19),
                                              ('montres/audemars_piguet/code_11.59/or_blanc/img_4.avif', 19),
                                              ('montres/audemars_piguet/code_11.59/or_blanc/img_5.avif', 19),

                                              ('montres/audemars_piguet/code_11.59/or_rose/img_1.avif', 20),
                                              ('montres/audemars_piguet/code_11.59/or_rose/img_2.avif', 20),
                                              ('montres/audemars_piguet/code_11.59/or_rose/img_3.avif', 20),
                                              ('montres/audemars_piguet/code_11.59/or_rose/img_4.avif', 20),
                                              ('montres/audemars_piguet/code_11.59/or_rose/img_5.avif', 20),

                                              ('montres/audemars_piguet/jules_audemars/or_jaune/img_1.avif', 21),
                                              ('montres/audemars_piguet/jules_audemars/or_jaune/img_2.avif', 21),
                                              ('montres/audemars_piguet/jules_audemars/or_jaune/img_3.avif', 21),
                                              ('montres/audemars_piguet/jules_audemars/or_jaune/img_4.avif', 21),

                                              ('montres/audemars_piguet/jules_audemars/or_rose/img_1.avif', 22),
                                              ('montres/audemars_piguet/jules_audemars/or_rose/img_2.avif', 22),
                                              ('montres/audemars_piguet/jules_audemars/or_rose/img_3.avif', 22),
                                              ('montres/audemars_piguet/jules_audemars/or_rose/img_4.avif', 22),
                                              ('montres/audemars_piguet/jules_audemars/or_rose/img_5.avif', 22),

                                              ('montres/audemars_piguet/jules_audemars/titane/img_1.avif', 23),
                                              ('montres/audemars_piguet/jules_audemars/titane/img_2.avif', 23),
                                              ('montres/audemars_piguet/jules_audemars/titane/img_3.avif', 23),
                                              ('montres/audemars_piguet/jules_audemars/titane/img_4.avif', 23),

                                              ('montres/audemars_piguet/royal_oak/acier_inoxydable/img_1.avif', 24),
                                              ('montres/audemars_piguet/royal_oak/acier_inoxydable/img_2.avif', 24),
                                              ('montres/audemars_piguet/royal_oak/acier_inoxydable/img_3.avif', 24),
                                              ('montres/audemars_piguet/royal_oak/acier_inoxydable/img_4.avif', 24),
                                              ('montres/audemars_piguet/royal_oak/acier_inoxydable/img_5.avif', 24),

                                              ('montres/audemars_piguet/royal_oak/or_blanc/img_1.avif', 25),
                                              ('montres/audemars_piguet/royal_oak/or_blanc/img_2.avif', 25),
                                              ('montres/audemars_piguet/royal_oak/or_blanc/img_3.avif', 25),
                                              ('montres/audemars_piguet/royal_oak/or_blanc/img_4.avif', 25),
                                              ('montres/audemars_piguet/royal_oak/or_blanc/img_5.avif', 25),

                                              ('montres/audemars_piguet/royal_oak/or_rose/img_1.avif', 26),
                                              ('montres/audemars_piguet/royal_oak/or_rose/img_2.avif', 26),
                                              ('montres/audemars_piguet/royal_oak/or_rose/img_3.avif', 26),
                                              ('montres/audemars_piguet/royal_oak/or_rose/img_4.avif', 26),
                                              ('montres/audemars_piguet/royal_oak/or_rose/img_5.avif', 26),

                                              ('montres/audemars_piguet/royal_oak_offshore/acier_inoxydable/img_1.avif', 27),
                                              ('montres/audemars_piguet/royal_oak_offshore/acier_inoxydable/img_2.avif', 27),
                                              ('montres/audemars_piguet/royal_oak_offshore/acier_inoxydable/img_3.avif', 27),
                                              ('montres/audemars_piguet/royal_oak_offshore/acier_inoxydable/img_4.avif', 27),
                                              ('montres/audemars_piguet/royal_oak_offshore/acier_inoxydable/img_5.avif', 27),

                                              ('montres/audemars_piguet/royal_oak_offshore/or_blanc/img_1.avif', 28),
                                              ('montres/audemars_piguet/royal_oak_offshore/or_blanc/img_2.avif', 28),
                                              ('montres/audemars_piguet/royal_oak_offshore/or_blanc/img_3.avif', 28),
                                              ('montres/audemars_piguet/royal_oak_offshore/or_blanc/img_4.avif', 28),
                                              ('montres/audemars_piguet/royal_oak_offshore/or_blanc/img_5.avif', 28),

                                              ('montres/audemars_piguet/royal_oak_offshore/or_rose/img_1.avif', 29),
                                              ('montres/audemars_piguet/royal_oak_offshore/or_rose/img_2.avif', 29),
                                              ('montres/audemars_piguet/royal_oak_offshore/or_rose/img_3.avif', 29),
                                              ('montres/audemars_piguet/royal_oak_offshore/or_rose/img_4.avif', 29),
                                              ('montres/audemars_piguet/royal_oak_offshore/or_rose/img_5.avif', 29),

                                              ('montres/breitling/bentley/acier_inoxydable/img_1.avif', 30),
                                              ('montres/breitling/bentley/acier_inoxydable/img_2.avif', 30),
                                              ('montres/breitling/bentley/acier_inoxydable/img_3.avif', 30),
                                              ('montres/breitling/bentley/acier_inoxydable/img_4.avif', 30),

                                              ('montres/breitling/bentley/or_jaune/img_1.avif', 31),
                                              ('montres/breitling/bentley/or_jaune/img_2.avif', 31),
                                              ('montres/breitling/bentley/or_jaune/img_3.avif', 31),
                                              ('montres/breitling/bentley/or_jaune/img_4.avif', 31),

                                              ('montres/breitling/chronomat/acier_inoxydable/img_1.avif', 32),
                                              ('montres/breitling/chronomat/acier_inoxydable/img_2.avif', 32),
                                              ('montres/breitling/chronomat/acier_inoxydable/img_3.avif', 32),
                                              ('montres/breitling/chronomat/acier_inoxydable/img_4.avif', 32),
                                              ('montres/breitling/chronomat/acier_inoxydable/img_5.avif', 32),

                                              ('montres/breitling/chronomat/or_rose/img_1.avif', 33),
                                              ('montres/breitling/chronomat/or_rose/img_2.avif', 33),
                                              ('montres/breitling/chronomat/or_rose/img_3.avif', 33),
                                              ('montres/breitling/chronomat/or_rose/img_4.avif', 33),
                                              ('montres/breitling/chronomat/or_rose/img_5.avif', 33),

                                              ('montres/breitling/chrono-matic/acier_inoxydable/img_1.avif', 34),
                                              ('montres/breitling/chrono-matic/acier_inoxydable/img_2.avif', 34),
                                              ('montres/breitling/chrono-matic/acier_inoxydable/img_3.avif', 34),
                                              ('montres/breitling/chrono-matic/acier_inoxydable/img_4.avif', 34),

                                              ('montres/breitling/chrono-matic/or_rose/img_1.avif', 35),
                                              ('montres/breitling/chrono-matic/or_rose/img_2.avif', 35),
                                              ('montres/breitling/chrono-matic/or_rose/img_3.avif', 35),
                                              ('montres/breitling/chrono-matic/or_rose/img_4.avif', 35),

                                              ('montres/breitling/navitimer/acier_inoxydable/img_1.avif', 36),
                                              ('montres/breitling/navitimer/acier_inoxydable/img_2.avif', 36),
                                              ('montres/breitling/navitimer/acier_inoxydable/img_3.avif', 36),
                                              ('montres/breitling/navitimer/acier_inoxydable/img_4.avif', 36),
                                              ('montres/breitling/navitimer/acier_inoxydable/img_5.avif', 36),

                                              ('montres/breitling/navitimer/or_jaune/img_1.avif', 37),
                                              ('montres/breitling/navitimer/or_jaune/img_2.avif', 37),
                                              ('montres/breitling/navitimer/or_jaune/img_3.avif', 37),
                                              ('montres/breitling/navitimer/or_jaune/img_4.avif', 37),

                                              ('montres/breitling/navitimer/or_rose/img_1.avif', 38),
                                              ('montres/breitling/navitimer/or_rose/img_2.avif', 38),
                                              ('montres/breitling/navitimer/or_rose/img_3.avif', 38),
                                              ('montres/breitling/navitimer/or_rose/img_4.avif', 38),
                                              ('montres/breitling/navitimer/or_rose/img_5.avif', 38),

                                              ('montres/breitling/premier/acier_inoxydable/img_1.avif', 39),
                                              ('montres/breitling/premier/acier_inoxydable/img_2.avif', 39),
                                              ('montres/breitling/premier/acier_inoxydable/img_3.avif', 39),
                                              ('montres/breitling/premier/acier_inoxydable/img_4.avif', 39),

                                              ('montres/breitling/premier/or_rose/img_1.avif', 40),
                                              ('montres/breitling/premier/or_rose/img_2.avif', 40),
                                              ('montres/breitling/premier/or_rose/img_3.avif', 40),
                                              ('montres/breitling/premier/or_rose/img_4.avif', 40),

                                              ('montres/breitling/transocean/acier_inoxydable/img_1.avif', 41),
                                              ('montres/breitling/transocean/acier_inoxydable/img_2.avif', 41),
                                              ('montres/breitling/transocean/acier_inoxydable/img_3.avif', 41),
                                              ('montres/breitling/transocean/acier_inoxydable/img_4.avif', 41),
                                              ('montres/breitling/transocean/acier_inoxydable/img_5.avif', 41),

                                              ('montres/breitling/transocean/or_rose/img_1.avif', 42),
                                              ('montres/breitling/transocean/or_rose/img_2.avif', 42),
                                              ('montres/breitling/transocean/or_rose/img_3.avif', 42),
                                              ('montres/breitling/transocean/or_rose/img_4.avif', 42),

                                              ('montres/f.p._journe/boutique/or_rose/img_1.avif', 43),
                                              ('montres/f.p._journe/boutique/or_rose/img_2.avif', 43),
                                              ('montres/f.p._journe/boutique/or_rose/img_3.avif', 43),
                                              ('montres/f.p._journe/boutique/or_rose/img_4.avif', 43),
                                              ('montres/f.p._journe/boutique/or_rose/img_5.avif', 43),

                                              ('montres/f.p._journe/boutique/platine/img_1.avif', 44),
                                              ('montres/f.p._journe/boutique/platine/img_2.avif', 44),
                                              ('montres/f.p._journe/boutique/platine/img_3.avif', 44),
                                              ('montres/f.p._journe/boutique/platine/img_4.avif', 44),
                                              ('montres/f.p._journe/boutique/platine/img_5.avif', 44),

                                              ('montres/f.p._journe/classique/or_rose/img_1.avif', 45),
                                              ('montres/f.p._journe/classique/or_rose/img_2.avif', 45),
                                              ('montres/f.p._journe/classique/or_rose/img_3.avif', 45),
                                              ('montres/f.p._journe/classique/or_rose/img_4.avif', 45),
                                              ('montres/f.p._journe/classique/or_rose/img_5.avif', 45),

                                              ('montres/f.p._journe/classique/platine/img_1.avif', 46),
                                              ('montres/f.p._journe/classique/platine/img_2.avif', 46),
                                              ('montres/f.p._journe/classique/platine/img_3.avif', 46),
                                              ('montres/f.p._journe/classique/platine/img_4.avif', 46),
                                              ('montres/f.p._journe/classique/platine/img_5.avif', 46),

                                              ('montres/f.p._journe/classique/tantale/img_1.avif', 47),
                                              ('montres/f.p._journe/classique/tantale/img_2.avif', 47),
                                              ('montres/f.p._journe/classique/tantale/img_3.avif', 47),
                                              ('montres/f.p._journe/classique/tantale/img_4.avif', 47),
                                              ('montres/f.p._journe/classique/tantale/img_5.avif', 47),

                                              ('montres/f.p._journe/linesport/aluminium/img_1.avif', 48),
                                              ('montres/f.p._journe/linesport/aluminium/img_2.avif', 48),
                                              ('montres/f.p._journe/linesport/aluminium/img_3.avif', 48),
                                              ('montres/f.p._journe/linesport/aluminium/img_4.avif', 48),
                                              ('montres/f.p._journe/linesport/aluminium/img_5.avif', 48),

                                              ('montres/f.p._journe/linesport/or_rose/img_1.avif', 49),
                                              ('montres/f.p._journe/linesport/or_rose/img_2.avif', 49),
                                              ('montres/f.p._journe/linesport/or_rose/img_3.avif', 49),
                                              ('montres/f.p._journe/linesport/or_rose/img_4.avif', 49),
                                              ('montres/f.p._journe/linesport/or_rose/img_5.avif', 49),

                                              ('montres/f.p._journe/linesport/titane/img_1.avif', 50),
                                              ('montres/f.p._journe/linesport/titane/img_2.avif', 50),
                                              ('montres/f.p._journe/linesport/titane/img_3.avif', 50),
                                              ('montres/f.p._journe/linesport/titane/img_4.avif', 50),
                                              ('montres/f.p._journe/linesport/titane/img_5.avif', 50),

                                              ('montres/f.p._journe/octa/aluminium/img_1.avif', 51),
                                              ('montres/f.p._journe/octa/aluminium/img_2.avif', 51),
                                              ('montres/f.p._journe/octa/aluminium/img_3.avif', 51),
                                              ('montres/f.p._journe/octa/aluminium/img_4.avif', 51),
                                              ('montres/f.p._journe/octa/aluminium/img_5.avif', 51),
                                              ('montres/f.p._journe/octa/aluminium/img_6.avif', 51),

                                              ('montres/f.p._journe/octa/or_rose/img_1.avif', 52),
                                              ('montres/f.p._journe/octa/or_rose/img_2.avif', 52),
                                              ('montres/f.p._journe/octa/or_rose/img_3.avif', 52),
                                              ('montres/f.p._journe/octa/or_rose/img_4.avif', 52),
                                              ('montres/f.p._journe/octa/or_rose/img_5.avif', 52),

                                              ('montres/f.p._journe/octa/platine/img_1.avif', 53),
                                              ('montres/f.p._journe/octa/platine/img_2.avif', 53),
                                              ('montres/f.p._journe/octa/platine/img_3.avif', 53),
                                              ('montres/f.p._journe/octa/platine/img_4.avif', 53),
                                              ('montres/f.p._journe/octa/platine/img_5.avif', 53),

                                              ('montres/f.p._journe/souveraine/or_rose/img_1.avif', 54),
                                              ('montres/f.p._journe/souveraine/or_rose/img_2.avif', 54),
                                              ('montres/f.p._journe/souveraine/or_rose/img_3.avif', 54),
                                              ('montres/f.p._journe/souveraine/or_rose/img_4.avif', 54),
                                              ('montres/f.p._journe/souveraine/or_rose/img_5.avif', 54),

                                              ('montres/f.p._journe/souveraine/platine/img_1.avif', 55),
                                              ('montres/f.p._journe/souveraine/platine/img_2.avif', 55),
                                              ('montres/f.p._journe/souveraine/platine/img_3.avif', 55),
                                              ('montres/f.p._journe/souveraine/platine/img_4.avif', 55),
                                              ('montres/f.p._journe/souveraine/platine/img_5.avif', 55),

                                              ('montres/h._moser_&_cie/endeavour/or_blanc/img_1.avif', 56),
                                              ('montres/h._moser_&_cie/endeavour/or_blanc/img_2.avif', 56),
                                              ('montres/h._moser_&_cie/endeavour/or_blanc/img_3.avif', 56),
                                              ('montres/h._moser_&_cie/endeavour/or_blanc/img_4.avif', 56),
                                              ('montres/h._moser_&_cie/endeavour/or_blanc/img_5.avif', 56),

                                              ('montres/h._moser_&_cie/endeavour/or_rose/img_1.avif', 57),
                                              ('montres/h._moser_&_cie/endeavour/or_rose/img_2.avif', 57),
                                              ('montres/h._moser_&_cie/endeavour/or_rose/img_3.avif', 57),
                                              ('montres/h._moser_&_cie/endeavour/or_rose/img_4.avif', 57),
                                              ('montres/h._moser_&_cie/endeavour/or_rose/img_5.avif', 57),

                                              ('montres/h._moser_&_cie/endeavour/titane/img_1.avif', 58),
                                              ('montres/h._moser_&_cie/endeavour/titane/img_2.avif', 58),
                                              ('montres/h._moser_&_cie/endeavour/titane/img_3.avif', 58),
                                              ('montres/h._moser_&_cie/endeavour/titane/img_4.avif', 58),
                                              ('montres/h._moser_&_cie/endeavour/titane/img_5.avif', 58),

                                              ('montres/h._moser_&_cie/pioneer/acier_inoxydable/img_1.avif', 59),
                                              ('montres/h._moser_&_cie/pioneer/acier_inoxydable/img_2.avif', 59),
                                              ('montres/h._moser_&_cie/pioneer/acier_inoxydable/img_3.avif', 59),
                                              ('montres/h._moser_&_cie/pioneer/acier_inoxydable/img_4.avif', 59),
                                              ('montres/h._moser_&_cie/pioneer/acier_inoxydable/img_5.avif', 59),

                                              ('montres/h._moser_&_cie/pioneer/or_rose/img_1.avif', 60),
                                              ('montres/h._moser_&_cie/pioneer/or_rose/img_2.avif', 60),
                                              ('montres/h._moser_&_cie/pioneer/or_rose/img_3.avif', 60),
                                              ('montres/h._moser_&_cie/pioneer/or_rose/img_4.avif', 60),
                                              ('montres/h._moser_&_cie/pioneer/or_rose/img_5.avif', 60),

                                              ('montres/h._moser_&_cie/pioneer/titane/img_1.avif', 61),
                                              ('montres/h._moser_&_cie/pioneer/titane/img_2.avif', 61),
                                              ('montres/h._moser_&_cie/pioneer/titane/img_3.avif', 61),
                                              ('montres/h._moser_&_cie/pioneer/titane/img_4.avif', 61),
                                              ('montres/h._moser_&_cie/pioneer/titane/img_5.avif', 61),

                                              ('montres/h._moser_&_cie/streamliner/acier_inoxydable/img_1.avif', 62),
                                              ('montres/h._moser_&_cie/streamliner/acier_inoxydable/img_2.avif', 62),
                                              ('montres/h._moser_&_cie/streamliner/acier_inoxydable/img_3.avif', 62),
                                              ('montres/h._moser_&_cie/streamliner/acier_inoxydable/img_4.avif', 62),
                                              ('montres/h._moser_&_cie/streamliner/acier_inoxydable/img_5.avif', 62),

                                              ('montres/h._moser_&_cie/streamliner/or_rose/img_1.avif', 63),
                                              ('montres/h._moser_&_cie/streamliner/or_rose/img_2.avif', 63),
                                              ('montres/h._moser_&_cie/streamliner/or_rose/img_3.avif', 63),
                                              ('montres/h._moser_&_cie/streamliner/or_rose/img_4.avif', 63),
                                              ('montres/h._moser_&_cie/streamliner/or_rose/img_5.avif', 63),

                                              ('montres/omega/constellation/acier_inoxydable/img_1.avif', 64),
                                              ('montres/omega/constellation/acier_inoxydable/img_2.avif', 64),
                                              ('montres/omega/constellation/acier_inoxydable/img_3.avif', 64),
                                              ('montres/omega/constellation/acier_inoxydable/img_4.avif', 64),
                                              ('montres/omega/constellation/acier_inoxydable/img_5.avif', 64),

                                              ('montres/omega/constellation/or_blanc/img_1.avif', 65),
                                              ('montres/omega/constellation/or_blanc/img_2.avif', 65),
                                              ('montres/omega/constellation/or_blanc/img_3.avif', 65),
                                              ('montres/omega/constellation/or_blanc/img_4.avif', 65),
                                              ('montres/omega/constellation/or_blanc/img_5.avif', 65),

                                              ('montres/omega/constellation/or_rose/img_1.avif', 66),
                                              ('montres/omega/constellation/or_rose/img_2.avif', 66),
                                              ('montres/omega/constellation/or_rose/img_3.avif', 66),
                                              ('montres/omega/constellation/or_rose/img_4.avif', 66),
                                              ('montres/omega/constellation/or_rose/img_5.avif', 66),

                                              ('montres/omega/de_ville/acier_inoxydable/img_1.avif', 67),
                                              ('montres/omega/de_ville/acier_inoxydable/img_2.avif', 67),
                                              ('montres/omega/de_ville/acier_inoxydable/img_3.avif', 67),
                                              ('montres/omega/de_ville/acier_inoxydable/img_4.avif', 67),

                                              ('montres/omega/de_ville/or_rose/img_1.avif', 68),
                                              ('montres/omega/de_ville/or_rose/img_2.avif', 68),
                                              ('montres/omega/de_ville/or_rose/img_3.avif', 68),
                                              ('montres/omega/de_ville/or_rose/img_4.avif', 68),
                                              ('montres/omega/de_ville/or_rose/img_5.avif', 68),

                                              ('montres/omega/seamaster/acier_inoxydable/img_1.avif', 69),
                                              ('montres/omega/seamaster/acier_inoxydable/img_2.avif', 69),
                                              ('montres/omega/seamaster/acier_inoxydable/img_3.avif', 69),
                                              ('montres/omega/seamaster/acier_inoxydable/img_4.avif', 69),
                                              ('montres/omega/seamaster/acier_inoxydable/img_5.avif', 69),

                                              ('montres/omega/seamaster/ceramique/img_1.avif', 70),
                                              ('montres/omega/seamaster/ceramique/img_2.avif', 70),
                                              ('montres/omega/seamaster/ceramique/img_3.avif', 70),
                                              ('montres/omega/seamaster/ceramique/img_4.avif', 70),
                                              ('montres/omega/seamaster/ceramique/img_5.avif', 70),

                                              ('montres/omega/seamaster/titane/img_1.avif', 71),
                                              ('montres/omega/seamaster/titane/img_2.avif', 71),
                                              ('montres/omega/seamaster/titane/img_3.avif', 71),
                                              ('montres/omega/seamaster/titane/img_4.avif', 71),
                                              ('montres/omega/seamaster/titane/img_5.avif', 71),

                                              ('montres/omega/speedmaster/acier_inoxydable/img_1.avif', 72),
                                              ('montres/omega/speedmaster/acier_inoxydable/img_2.avif', 72),
                                              ('montres/omega/speedmaster/acier_inoxydable/img_3.avif', 72),
                                              ('montres/omega/speedmaster/acier_inoxydable/img_4.avif', 72),
                                              ('montres/omega/speedmaster/acier_inoxydable/img_5.avif', 72),

                                              ('montres/omega/speedmaster/ceramique/img_1.avif', 73),
                                              ('montres/omega/speedmaster/ceramique/img_2.avif', 73),
                                              ('montres/omega/speedmaster/ceramique/img_3.avif', 73),
                                              ('montres/omega/speedmaster/ceramique/img_4.avif', 73),
                                              ('montres/omega/speedmaster/ceramique/img_5.avif', 73),

                                              ('montres/omega/speedmaster/or_jaune/img_1.avif', 74),
                                              ('montres/omega/speedmaster/or_jaune/img_2.avif', 74),
                                              ('montres/omega/speedmaster/or_jaune/img_3.avif', 74),
                                              ('montres/omega/speedmaster/or_jaune/img_4.avif', 74),
                                              ('montres/omega/speedmaster/or_jaune/img_5.avif', 74),

                                              ('montres/patek_phillipe/aquanaut/acier_inoxydable/img_1.avif', 75),
                                              ('montres/patek_phillipe/aquanaut/acier_inoxydable/img_2.avif', 75),
                                              ('montres/patek_phillipe/aquanaut/acier_inoxydable/img_3.avif', 75),
                                              ('montres/patek_phillipe/aquanaut/acier_inoxydable/img_4.avif', 75),

                                              ('montres/patek_phillipe/aquanaut/or_blanc/img_1.avif', 76),
                                              ('montres/patek_phillipe/aquanaut/or_blanc/img_2.avif', 76),
                                              ('montres/patek_phillipe/aquanaut/or_blanc/img_3.avif', 76),
                                              ('montres/patek_phillipe/aquanaut/or_blanc/img_4.avif', 76),
                                              ('montres/patek_phillipe/aquanaut/or_blanc/img_5.avif', 76),

                                              ('montres/patek_phillipe/aquanaut/or_jaune/img_1.avif', 77),
                                              ('montres/patek_phillipe/aquanaut/or_jaune/img_2.avif', 77),
                                              ('montres/patek_phillipe/aquanaut/or_jaune/img_3.avif', 77),
                                              ('montres/patek_phillipe/aquanaut/or_jaune/img_4.avif', 77),
                                              ('montres/patek_phillipe/aquanaut/or_jaune/img_5.avif', 77),

                                              ('montres/patek_phillipe/calatrava/or_blanc/img_1.avif', 78),
                                              ('montres/patek_phillipe/calatrava/or_blanc/img_2.avif', 78),
                                              ('montres/patek_phillipe/calatrava/or_blanc/img_3.avif', 78),
                                              ('montres/patek_phillipe/calatrava/or_blanc/img_4.avif', 78),
                                              ('montres/patek_phillipe/calatrava/or_blanc/img_5.avif', 78),

                                              ('montres/patek_phillipe/calatrava/or_jaune/img_1.avif', 79),
                                              ('montres/patek_phillipe/calatrava/or_jaune/img_2.avif', 79),
                                              ('montres/patek_phillipe/calatrava/or_jaune/img_3.avif', 79),
                                              ('montres/patek_phillipe/calatrava/or_jaune/img_4.avif', 79),
                                              ('montres/patek_phillipe/calatrava/or_jaune/img_5.avif', 79),

                                              ('montres/patek_phillipe/calatrava/or_rose/img_1.avif', 80),
                                              ('montres/patek_phillipe/calatrava/or_rose/img_2.avif', 80),
                                              ('montres/patek_phillipe/calatrava/or_rose/img_3.avif', 80),
                                              ('montres/patek_phillipe/calatrava/or_rose/img_4.avif', 80),
                                              ('montres/patek_phillipe/calatrava/or_rose/img_5.avif', 80),

                                              ('montres/patek_phillipe/complications/or_blanc/img_1.avif', 81),
                                              ('montres/patek_phillipe/complications/or_blanc/img_2.avif', 81),
                                              ('montres/patek_phillipe/complications/or_blanc/img_3.avif', 81),
                                              ('montres/patek_phillipe/complications/or_blanc/img_4.avif', 81),
                                              ('montres/patek_phillipe/complications/or_blanc/img_5.avif', 81),

                                              ('montres/patek_phillipe/complications/or_jaune/img_1.avif', 82),
                                              ('montres/patek_phillipe/complications/or_jaune/img_2.avif', 82),
                                              ('montres/patek_phillipe/complications/or_jaune/img_3.avif', 82),
                                              ('montres/patek_phillipe/complications/or_jaune/img_4.avif', 82),

                                              ('montres/patek_phillipe/complications/or_rose/img_1.avif', 83),
                                              ('montres/patek_phillipe/complications/or_rose/img_2.avif', 83),
                                              ('montres/patek_phillipe/complications/or_rose/img_3.avif', 83),
                                              ('montres/patek_phillipe/complications/or_rose/img_4.avif', 83),
                                              ('montres/patek_phillipe/complications/or_rose/img_5.avif', 83),

                                              ('montres/patek_phillipe/gondolo/or_blanc/img_1.avif', 84),
                                              ('montres/patek_phillipe/gondolo/or_blanc/img_2.avif', 84),
                                              ('montres/patek_phillipe/gondolo/or_blanc/img_3.avif', 84),
                                              ('montres/patek_phillipe/gondolo/or_blanc/img_4.avif', 84),

                                              ('montres/patek_phillipe/gondolo/or_jaune/img_1.avif', 85),
                                              ('montres/patek_phillipe/gondolo/or_jaune/img_2.avif', 85),
                                              ('montres/patek_phillipe/gondolo/or_jaune/img_3.avif', 85),
                                              ('montres/patek_phillipe/gondolo/or_jaune/img_4.avif', 85),
                                              ('montres/patek_phillipe/gondolo/or_jaune/img_5.avif', 85),

                                              ('montres/patek_phillipe/gondolo/platine/img_1.avif', 86),
                                              ('montres/patek_phillipe/gondolo/platine/img_2.avif', 86),
                                              ('montres/patek_phillipe/gondolo/platine/img_3.avif', 86),
                                              ('montres/patek_phillipe/gondolo/platine/img_4.avif', 86),
                                              ('montres/patek_phillipe/gondolo/platine/img_5.avif', 86),

                                              ('montres/patek_phillipe/grand_complications/or_blanc/img_1.avif', 87),
                                              ('montres/patek_phillipe/grand_complications/or_blanc/img_2.avif', 87),
                                              ('montres/patek_phillipe/grand_complications/or_blanc/img_3.avif', 87),
                                              ('montres/patek_phillipe/grand_complications/or_blanc/img_4.avif', 87),
                                              ('montres/patek_phillipe/grand_complications/or_blanc/img_5.avif', 87),

                                              ('montres/patek_phillipe/grand_complications/or_rose/img_1.avif', 88),
                                              ('montres/patek_phillipe/grand_complications/or_rose/img_2.avif', 88),
                                              ('montres/patek_phillipe/grand_complications/or_rose/img_3.avif', 88),
                                              ('montres/patek_phillipe/grand_complications/or_rose/img_4.avif', 88),
                                              ('montres/patek_phillipe/grand_complications/or_rose/img_5.avif', 88),

                                              ('montres/patek_phillipe/grand_complications/platine/img_1.avif', 89),
                                              ('montres/patek_phillipe/grand_complications/platine/img_2.avif', 89),
                                              ('montres/patek_phillipe/grand_complications/platine/img_3.avif', 89),
                                              ('montres/patek_phillipe/grand_complications/platine/img_4.avif', 89),
                                              ('montres/patek_phillipe/grand_complications/platine/img_5.avif', 89),

                                              ('montres/patek_phillipe/nautilus/acier_inoxydable/img_1.avif', 90),
                                              ('montres/patek_phillipe/nautilus/acier_inoxydable/img_2.avif', 90),
                                              ('montres/patek_phillipe/nautilus/acier_inoxydable/img_3.avif', 90),
                                              ('montres/patek_phillipe/nautilus/acier_inoxydable/img_4.avif', 90),
                                              ('montres/patek_phillipe/nautilus/acier_inoxydable/img_5.avif', 90),

                                              ('montres/patek_phillipe/nautilus/or_jaune/img_1.avif', 91),
                                              ('montres/patek_phillipe/nautilus/or_jaune/img_2.avif', 91),
                                              ('montres/patek_phillipe/nautilus/or_jaune/img_3.avif', 91),
                                              ('montres/patek_phillipe/nautilus/or_jaune/img_4.avif', 91),
                                              ('montres/patek_phillipe/nautilus/or_jaune/img_5.avif', 91),

                                              ('montres/patek_phillipe/nautilus/or_rose/img_1.avif', 92),
                                              ('montres/patek_phillipe/nautilus/or_rose/img_2.avif', 92),
                                              ('montres/patek_phillipe/nautilus/or_rose/img_3.avif', 92),
                                              ('montres/patek_phillipe/nautilus/or_rose/img_4.avif', 92),
                                              ('montres/patek_phillipe/nautilus/or_rose/img_5.avif', 92),

                                              ('montres/vacheron_constantin/fiftysix/acier_inoxydable/img_1.avif', 93),
                                              ('montres/vacheron_constantin/fiftysix/acier_inoxydable/img_2.avif', 93),
                                              ('montres/vacheron_constantin/fiftysix/acier_inoxydable/img_3.avif', 93),
                                              ('montres/vacheron_constantin/fiftysix/acier_inoxydable/img_4.avif', 93),
                                              ('montres/vacheron_constantin/fiftysix/acier_inoxydable/img_5.avif', 93),

                                              ('montres/vacheron_constantin/fiftysix/or_rose/img_1.avif', 94),
                                              ('montres/vacheron_constantin/fiftysix/or_rose/img_2.avif', 94),
                                              ('montres/vacheron_constantin/fiftysix/or_rose/img_3.avif', 94),
                                              ('montres/vacheron_constantin/fiftysix/or_rose/img_4.avif', 94),
                                              ('montres/vacheron_constantin/fiftysix/or_rose/img_5.avif', 94),

                                              ('montres/vacheron_constantin/historique/acier_inoxydable/img_1.avif', 95),
                                              ('montres/vacheron_constantin/historique/acier_inoxydable/img_2.avif', 95),
                                              ('montres/vacheron_constantin/historique/acier_inoxydable/img_3.avif', 95),
                                              ('montres/vacheron_constantin/historique/acier_inoxydable/img_4.avif', 95),
                                              ('montres/vacheron_constantin/historique/acier_inoxydable/img_5.avif', 95),

                                              ('montres/vacheron_constantin/historique/or_rose/img_1.avif', 96),
                                              ('montres/vacheron_constantin/historique/or_rose/img_2.avif', 96),
                                              ('montres/vacheron_constantin/historique/or_rose/img_3.avif', 96),
                                              ('montres/vacheron_constantin/historique/or_rose/img_4.avif', 96),
                                              ('montres/vacheron_constantin/historique/or_rose/img_5.avif', 96),

                                              ('montres/vacheron_constantin/historique/platine/img_1.avif', 97),
                                              ('montres/vacheron_constantin/historique/platine/img_2.avif', 97),
                                              ('montres/vacheron_constantin/historique/platine/img_3.avif', 97),
                                              ('montres/vacheron_constantin/historique/platine/img_4.avif', 97),
                                              ('montres/vacheron_constantin/historique/platine/img_5.avif', 97),

                                              ('montres/vacheron_constantin/malte/or_blanc/img_1.avif', 98),
                                              ('montres/vacheron_constantin/malte/or_blanc/img_2.avif', 98),
                                              ('montres/vacheron_constantin/malte/or_blanc/img_3.avif', 98),
                                              ('montres/vacheron_constantin/malte/or_blanc/img_4.avif', 98),

                                              ('montres/vacheron_constantin/malte/or_rose/img_1.avif', 99),
                                              ('montres/vacheron_constantin/malte/or_rose/img_2.avif', 99),
                                              ('montres/vacheron_constantin/malte/or_rose/img_3.avif', 99),
                                              ('montres/vacheron_constantin/malte/or_rose/img_4.avif', 99),
                                              ('montres/vacheron_constantin/malte/or_rose/img_5.avif', 99),

                                              ('montres/vacheron_constantin/malte/platine/img_1.avif', 100),
                                              ('montres/vacheron_constantin/malte/platine/img_2.avif', 100),
                                              ('montres/vacheron_constantin/malte/platine/img_3.avif', 100),
                                              ('montres/vacheron_constantin/malte/platine/img_4.avif', 100),
                                              ('montres/vacheron_constantin/malte/platine/img_5.avif', 100),

                                              ('montres/vacheron_constantin/metiers_dart/or_jaune/img_1.avif', 101),
                                              ('montres/vacheron_constantin/metiers_dart/or_jaune/img_2.avif', 101),
                                              ('montres/vacheron_constantin/metiers_dart/or_jaune/img_3.avif', 101),
                                              ('montres/vacheron_constantin/metiers_dart/or_jaune/img_4.avif', 101),
                                              ('montres/vacheron_constantin/metiers_dart/or_jaune/img_5.avif', 101),

                                              ('montres/vacheron_constantin/metiers_dart/or_rose/img_1.avif', 102),
                                              ('montres/vacheron_constantin/metiers_dart/or_rose/img_2.avif', 102),
                                              ('montres/vacheron_constantin/metiers_dart/or_rose/img_3.avif', 102),
                                              ('montres/vacheron_constantin/metiers_dart/or_rose/img_4.avif', 102),
                                              ('montres/vacheron_constantin/metiers_dart/or_rose/img_5.avif', 102),

                                              ('montres/vacheron_constantin/metiers_dart/platine/img_1.avif', 103),
                                              ('montres/vacheron_constantin/metiers_dart/platine/img_2.avif', 103),
                                              ('montres/vacheron_constantin/metiers_dart/platine/img_3.avif', 103),
                                              ('montres/vacheron_constantin/metiers_dart/platine/img_4.avif', 103),
                                              ('montres/vacheron_constantin/metiers_dart/platine/img_5.avif', 103),

                                              ('montres/vacheron_constantin/overseas/acier_inoxydable/img_1.avif', 104),
                                              ('montres/vacheron_constantin/overseas/acier_inoxydable/img_2.avif', 104),
                                              ('montres/vacheron_constantin/overseas/acier_inoxydable/img_3.avif', 104),
                                              ('montres/vacheron_constantin/overseas/acier_inoxydable/img_4.avif', 104),
                                              ('montres/vacheron_constantin/overseas/acier_inoxydable/img_5.avif', 104),

                                              ('montres/vacheron_constantin/overseas/or_jaune/img_1.avif', 105),
                                              ('montres/vacheron_constantin/overseas/or_jaune/img_2.avif', 105),
                                              ('montres/vacheron_constantin/overseas/or_jaune/img_3.avif', 105),
                                              ('montres/vacheron_constantin/overseas/or_jaune/img_4.avif', 105),

                                              ('montres/vacheron_constantin/overseas/or_rose/img_1.avif', 106),
                                              ('montres/vacheron_constantin/overseas/or_rose/img_2.avif', 106),
                                              ('montres/vacheron_constantin/overseas/or_rose/img_3.avif', 106),
                                              ('montres/vacheron_constantin/overseas/or_rose/img_4.avif', 106),
                                              ('montres/vacheron_constantin/overseas/or_rose/img_5.avif', 106),

                                              ('montres/vacheron_constantin/patrimony/or_blanc/img_1.avif', 107),
                                              ('montres/vacheron_constantin/patrimony/or_blanc/img_2.avif', 107),
                                              ('montres/vacheron_constantin/patrimony/or_blanc/img_3.avif', 107),
                                              ('montres/vacheron_constantin/patrimony/or_blanc/img_4.avif', 107),
                                              ('montres/vacheron_constantin/patrimony/or_blanc/img_5.avif', 107),

                                              ('montres/vacheron_constantin/patrimony/or_rose/img_1.avif', 108),
                                              ('montres/vacheron_constantin/patrimony/or_rose/img_2.avif', 108),
                                              ('montres/vacheron_constantin/patrimony/or_rose/img_3.avif', 108),
                                              ('montres/vacheron_constantin/patrimony/or_rose/img_4.avif', 108),
                                              ('montres/vacheron_constantin/patrimony/or_rose/img_5.avif', 108),

                                              ('montres/vacheron_constantin/patrimony/platine/img_1.avif', 109),
                                              ('montres/vacheron_constantin/patrimony/platine/img_2.avif', 109),
                                              ('montres/vacheron_constantin/patrimony/platine/img_3.avif', 109),
                                              ('montres/vacheron_constantin/patrimony/platine/img_4.avif', 109),

                                              ('montres/vacheron_constantin/traditionnelle/or_blanc/img_1.avif', 110),
                                              ('montres/vacheron_constantin/traditionnelle/or_blanc/img_2.avif', 110),
                                              ('montres/vacheron_constantin/traditionnelle/or_blanc/img_3.avif', 110),
                                              ('montres/vacheron_constantin/traditionnelle/or_blanc/img_4.avif', 110),
                                              ('montres/vacheron_constantin/traditionnelle/or_blanc/img_5.avif', 110),

                                              ('montres/vacheron_constantin/traditionnelle/or_rose/img_1.avif', 111),
                                              ('montres/vacheron_constantin/traditionnelle/or_rose/img_2.avif', 111),
                                              ('montres/vacheron_constantin/traditionnelle/or_rose/img_3.avif', 111),
                                              ('montres/vacheron_constantin/traditionnelle/or_rose/img_4.avif', 111),
                                              ('montres/vacheron_constantin/traditionnelle/or_rose/img_5.avif', 111);
