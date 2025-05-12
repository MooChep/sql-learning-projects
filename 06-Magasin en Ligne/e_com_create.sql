CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;
CREATE TABLE IF NOT EXISTS  `Produit` (
  `id_produit` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(30) NOT NULL,
  `description` TEXT NOT NULL,
  `prix` INT NOT NULL,
  `stock` INT NOT NULL,
  `catégorie` VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Clients` (
  `id_client` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(30) NOT NULL,
  `prenom` VARCHAR(30) NOT NULL,
  `email` VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Commande` (
  `id_commande` INT NOT NULL AUTO_INCREMENT,
  `id_client` INT NOT NULL,
  `date_paiement` TIMESTAMP NOT NULL,
  `status` VARCHAR(30) NOT NULL,
  `total` INT NOT NULL,
  CONSTRAINT pk_commande Primary KEY Commande(id_commande)
);

CREATE TABLE IF NOT EXISTS `Detail_commande` (
  `id_detail` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_commande` INT NOT NULL,
  `id_produit` INT NOT NULL,
  `quantite` INT NOT NULL,
  `prix_unitaire` INT NOT NULL
);

ALTER TABLE `Detail_commande` ADD FOREIGN KEY (`id_produit`) REFERENCES `Produit` (`id_produit`);

ALTER TABLE `Commande` ADD FOREIGN KEY (`id_client`) REFERENCES `Clients` (`id_client`);

ALTER TABLE `Detail_commande` ADD FOREIGN KEY (`id_commande`) REFERENCES `Commande` (`id_commande`);
