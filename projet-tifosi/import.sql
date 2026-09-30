USE tifosi;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS achete;
DROP TABLE IF EXISTS paye;
DROP TABLE IF EXISTS comprendre;
DROP TABLE IF EXISTS boisson;
DROP TABLE IF EXISTS focaccia;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS marque;
DROP TABLE IF EXISTS client;

-- 1. Table Marque
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom_marque VARCHAR(50) NOT NULL
) ENGINE=INNODB;

-- 2. Table Boisson
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom_boisson VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
) ENGINE=INNODB;

-- 3. Table Ingrédient
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom_ingredient VARCHAR(50) NOT NULL
) ENGINE=INNODB;

-- 4. Table Focaccia
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom_focaccia VARCHAR(50) NOT NULL,
    prix_focaccia DECIMAL(5,2) NOT NULL,
    cnt_focaccia TEXT
) ENGINE=INNODB;

-- 5. Table de liaison "comprendre"
CREATE TABLE comprendre (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_comprendre_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    CONSTRAINT fk_comprendre_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
) ENGINE=INNODB;

-- 6. Table Client
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom_client VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    cp INT NOT NULL
) ENGINE=INNODB;

-- 7. Table de liaison "achete"
CREATE TABLE achete (
    id_client INT NOT NULL,
    id_focaccia INT NOT NULL,
    jour DATE NOT NULL,
    PRIMARY KEY (id_client, id_focaccia, jour),
    CONSTRAINT fk_achete_client FOREIGN KEY (id_client) REFERENCES client(id_client),
    CONSTRAINT fk_achete_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
) ENGINE=INNODB;

-- 8. Table de liaison "paye"
CREATE TABLE paye (
    id_client INT NOT NULL,
    id_boisson INT NOT NULL,
    jour DATE NOT NULL,
    PRIMARY KEY (id_client, id_boisson, jour),
    CONSTRAINT fk_paye_client FOREIGN KEY (id_client) REFERENCES client(id_client),
    CONSTRAINT fk_paye_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
) ENGINE=INNODB;

SET FOREIGN_KEY_CHECKS = 1;