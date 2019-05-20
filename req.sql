-- se connecter au serveur Mysql avec le user root
mysql -u root -p

-- créer une base de données
CREATE DATABASE recruteo_db CHARACTER SET UTF8mb4 COLLATE utf8mb4_general_ci;
-- COLLATE utf8mb4_general_ci;

-- se placer dans la DB
USE recruteo_db;

-- créer une table
CREATE TABLE societe(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    code_postal VARCHAR(255) NOT NULL,
    ville VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id_societe PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE langage(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id_langage PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE developpeur(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    bio TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    CONSTRAINT pk_id_developpeur PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE equipe(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    id_societe INT NOT NULL,
    CONSTRAINT pk_id_equipe PRIMARY KEY (id),
    CONSTRAINT fk_id_societe FOREIGN KEY (id_societe) REFERENCES societe(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE equipe_developpeur(
    id_developpeur INT NOT NULL,
    id_equipe INT NOT NULL,
    date_inscription DATETIME,
    CONSTRAINT pk_equipe_developpeur PRIMARY KEY (id_developpeur,id_equipe),
    CONSTRAINT fk_id_developpeur FOREIGN KEY (id_developpeur) REFERENCES developpeur(id) ON DELETE CASCADE,
    CONSTRAINT fk_id_equipe FOREIGN KEY (id_equipe) REFERENCES equipe(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ajouter un attribut à une table
-- ALTER TABLE equipe_developpeur ADD date_inscription DATETIME;

CREATE TABLE langage_developpeur(
    id_developpeur INT NOT NULL,
    id_langage INT NOT NULL,
    CONSTRAINT pk_langage_developpeur PRIMARY KEY (id_developpeur,id_langage),
    CONSTRAINT fk_id_developpeur_lang FOREIGN KEY (id_developpeur) REFERENCES developpeur(id) ON DELETE CASCADE,
    CONSTRAINT fk_id_langage FOREIGN KEY (id_langage) REFERENCES langage(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE langage_requis_equipe(
    id_equipe INT NOT NULL,
    id_langage INT NOT NULL,
    CONSTRAINT pk_langage_requis_equipe PRIMARY KEY (id_equipe,id_langage),
    CONSTRAINT fk_id_equipe_langage_requis FOREIGN KEY (id_equipe) REFERENCES equipe(id) ON DELETE CASCADE,
    CONSTRAINT fk_id_langage_requis FOREIGN KEY (id_langage) REFERENCES langage(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- créer une société
INSERT INTO societe (nom,adresse,code_postal,ville) VALUES ('Next-Formation','6-8 rue Firmin Gillot','75015','paris');


-- Pour faire une maj au cas ou on à mis des données erronées:
-- Pour l'adresse par exemple on fait comme suit:
# UPDATE societe SET adresse ='6-8 rue Firmin Gillot';


-- pour rajouter le INSERT INTO :
SELECT * FROM societe;


-- Le NOW est une requete pour fixer la date à l'instant "T" et le 1 correspond à l'ID de la société créee plus haut.Modif=le 2 correspond à la nouvelle creation apres suppression de la 1ere
INSERT INTO equipe (nom,created_at,id_societe) VALUES ('DWWM',NOW(),2);

SELECT * FROM equipe;

-- Jointure avec societe
SELECT * FROM equipe LEFT JOIN societe ON societe.id = equipe.id_societe;
--  autre possibilite
SELECT * FROM equipe,societe WHERE societe.id = equipe.id_societe;

-- Supprimer un tuple (une ligne dans la table)
DELETE FROM societe WHERE id = 1;

INSERT INTO developpeur(nom,bio,created_at) VALUES ('vincent','j\'aime les tic tac',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('alain','j\'aime m\'entraîner',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('ozan','j\'aime les mangas',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('marie-line','j\'aime la moto',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('serge','j\'aime l\'amour véritable',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('jamal','j\'aime la sieste',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('said','j\'aime les grasses mat\'',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('benjamin','j\'aime le hockey sur glace',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('julien','j\'aime tinder',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('marie','j\'aime just dance',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('majid','j\'aime bien me reposer à la maison',NOW());

-- lier les dev à l'équipe
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (1,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (2,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (3,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (4,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (5,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (6,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (7,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (8,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (9,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (10,3,NOW());
INSERT INTO equipe_developpeur(id_developpeur, id_equipe, date_inscription) VALUES (11,3,NOW());


-- créer des langages
INSERT INTO langage(nom) VALUES ('php');
INSERT INTO langage(nom) VALUES ('javascript');
INSERT INTO langage(nom) VALUES ('node.js');
INSERT INTO langage(nom) VALUES ('html');
INSERT INTO langage(nom) VALUES ('css');
INSERT INTO langage(nom) VALUES ('laravel');
INSERT INTO langage(nom) VALUES ('symfony');
INSERT INTO langage(nom) VALUES ('react');
INSERT INTO langage(nom) VALUES ('react native');
INSERT INTO langage(nom) VALUES ('vue.js');
INSERT INTO langage(nom) VALUES ('angular');


-- Associer les dev avec des langages
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (1,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (1,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (1,3);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (2,4);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (2,3);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (2,5);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (3,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (4,8);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (5,9);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (6,10);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (6,8);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (7,6);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (8,7);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (9,9);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (10,11);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (11,3);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (11,2);

INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (2,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (2,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (3,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (4,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (4,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (5,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (5,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (6,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (6,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (7,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (7,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (8,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (8,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (9,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (9,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (10,1);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (10,2);
INSERT INTO langage_developpeur(id_developpeur, id_langage) VALUES (11,1);


-- associer des langages requis par l'équipe
INSERT INTO langage_requis_equipe(id_equipe, id_langage) VALUES (3,1);
INSERT INTO langage_requis_equipe(id_equipe, id_langage) VALUES (3,2);


-- Consulter la liste des dev appartenant à une équipe
SELECT * FROM developpeur d
LEFT JOIN equipe_developpeur ed on d.id = ed.id_developpeur
LEFT JOIN equipe e on e.id = ed.id_equipe
LEFT JOIN societe s on s.id = e.id_societe;
-- autre possibilité
SELECT * FROM developpeur,equipe_developpeur,equipe,societe
WHERE developpeur.id = equipe_developpeur.id_developpeur
AND equipe.id = equipe_developpeur.id_equipe
AND societe.id = equipe.id_societe;

-- Pour supprimer une table developpeur par exemple:
-- DROP TABLE developpeur;

-- vider les données de la table
-- TRUNCATE TABLE developpeur;

-- voir les tables
-- SHOW TABLES;

-- Voir la BDD
-- SHOW DATABASE;