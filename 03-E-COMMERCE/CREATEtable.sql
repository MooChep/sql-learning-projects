CREATE DATABASE IF NOT EXISTS ecommerce;

CREATE TABLE IF NOT EXISTS  `article` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,
  `prix` DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS  `ligne` (
  `article_id` INT NOT NULL,
  `commande_id` INT NOT NULL,
  `prix_achat` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`article_id`, `commande_id`)
);

CREATE TABLE IF NOT EXISTS  `commande` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `client_id` INT NOT NULL
);

CREATE TABLE IF NOT EXISTS  `client` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,
  `prenom` VARCHAR(50) NOT NULL
);

ALTER TABLE `commande` ADD FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

ALTER TABLE `ligne` ADD FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

ALTER TABLE `ligne` ADD FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`);
