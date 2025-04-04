DROP DATABASE IF EXISTS loc_ski;
CREATE DATABASE IF NOT EXISTS loc_ski;
USE loc_ski;
CREATE TABLE IF NOT EXISTS tarifs (
	codeTarif CHAR(5) NOT NULL,
    libelle CHAR(30) NOT NULL,
    prixJour DECIMAL(5,0) NOT NULL,
    CONSTRAINT pkTarifs PRIMARY KEY(codeTarif)

);
CREATE TABLE IF NOT EXISTS grilleTarifs (
	codeGam CHAR(5) NOT NULL,
    codeCate CHAR(5) NOT NULL,
    codeTarif CHAR(5),
    CONSTRAINT pkClients PRIMARY KEY(codeGam, codeCate)

);
CREATE TABLE IF NOT EXISTS gammes(
	codeGam CHAR(5) NOT NULL,
    libelle VARCHAR(45) NOT NULL,
    CONSTRAINT pkGammes PRIMARY KEY(codeGam)

);
CREATE TABLE IF NOT EXISTS articles (
	refart CHAR(8) NOT NULL,
    designation VARCHAR(80) NOT NULL,
    codeGam CHAR(5),
    codeCate CHAR(5),
    CONSTRAINT pkArticles PRIMARY KEY(refart)

    
);
CREATE TABLE IF NOT EXISTS categories (
	codeCate CHAR(5) NOT NULL,
    libelle VARCHAR(30) NOT NULL,
    CONSTRAINT pkCategories PRIMARY KEY(codeCate)

);
CREATE TABLE IF NOT EXISTS lignesFic (
	noLig INT NOT NULL,
    noFic INT NOT NULL,
	refart CHAR(8) NOT NULL,
    depart DATE NOT NULL,
    retour DATE,
    CONSTRAINT pkLignesFic PRIMARY KEY(noLig, noFic)

);
CREATE TABLE IF NOT EXISTS fiches (
    noFic INT NOT NULL,
    noCli INT NOT NULL,
    dateCrea DATE NOT NULL,
    datePaiement DATE,
    etat ENUM ('SO', 'EC', 'RE') NOT NULL,
	CONSTRAINT pkFiches PRIMARY KEY(noFic)
);
CREATE TABLE IF NOT EXISTS clients (
	noCli INT NOT NULL,
    nom VARCHAR(30) NOT NULL,
    prenom VARCHAR(30),
    adresse VARCHAR(120),
    cpo VARCHAR(5) NOT NULL,
    ville VARCHAR(80) NOT NULL,
    CONSTRAINT pkClients PRIMARY KEY(noClI)
);


ALTER TABLE fiches ADD CONSTRAINT FOREIGN KEY(noCli) REFERENCES clients(noClI);
ALTER TABLE lignesFic ADD CONSTRAINT FOREIGN KEY(noFic) REFERENCES fiches(noFic);
ALTER TABLE lignesFic ADD CONSTRAINT FOREIGN KEY(refart) REFERENCES articles(refart);
ALTER TABLE articles ADD CONSTRAINT FOREIGN KEY(codeGam) REFERENCES gammes(codeGam);
ALTER TABLE articles ADD CONSTRAINT FOREIGN KEY(codeCate) REFERENCES categories(codeCate);
ALTER TABLE grilleTarifs ADD CONSTRAINT FOREIGN KEY(codeGam) REFERENCES gammes(codeGam);
ALTER TABLE grilleTarifs ADD CONSTRAINT FOREIGN KEY(codeCate) REFERENCES categories(codeCate);
ALTER TABLE grilleTarifs ADD CONSTRAINT FOREIGN KEY(codeTarif) REFERENCES tarifs(codeTarif);