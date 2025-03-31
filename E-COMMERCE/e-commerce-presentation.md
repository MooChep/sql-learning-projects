# Documentation du projet E-commerce (MySQL)

## Introduction
Ce projet MySQL met en place un système de gestion des commandes pour un site e-commerce. Il permet de gérer les clients, les articles disponibles, les commandes passées et le détail des lignes de commande.

## Structure de la Base de Données
La base de données est divisée en plusieurs tables :
- **client** : Stocke les informations des clients.
- **article** : Contient les articles disponibles à la vente.
- **commande** : Enregistre les commandes effectuées par les clients.
- **ligne** : Détaille les articles achetés dans chaque commande.

### Création des tables (Fichier : `CREATEtable.sql`)
Le fichier `CREATEtable.sql` définit la structure des tables et leurs relations.
```sql
CREATE DATABASE IF NOT EXISTS ecommerce;

CREATE TABLE client (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL
);

CREATE TABLE article (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  prix DECIMAL(10,2) NOT NULL
);

CREATE TABLE commande (
  id INT PRIMARY KEY AUTO_INCREMENT,
  date DATETIME NOT NULL,
  client_id INT NOT NULL,
  FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE ligne (
  article_id INT NOT NULL,
  commande_id INT NOT NULL,
  prix_achat INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (article_id, commande_id),
  FOREIGN KEY (article_id) REFERENCES article(id),
  FOREIGN KEY (commande_id) REFERENCES commande(id)
);
```

## Insertion des Données (Fichier : `INPUTdata.sql`)
Le fichier `INPUTdata.sql` insère des données de test dans les tables.
```sql
INSERT INTO client (id, nom, prenom) VALUES
(1, 'PITT', 'Brad'),
(2, 'CLOONEY', 'George'),
(3, 'DUJARDIN', 'Jean');

INSERT INTO article (id, nom, prix) VALUES
(1, 'Play Station 5', 400),
(2, 'Motoculteur', 20000),
(3, 'Parapluie', 45),
(4, 'Café', 2);

INSERT INTO commande (id, date, client_id) VALUES
(1, '2024-09-08 10:15:00', 1),
(2, '2024-03-02 03:15:00', 3),
(3, '2023-11-03 10:15:00', 2);

INSERT INTO ligne (article_id, commande_id, prix_achat, quantity) VALUES
(1, 1, 400, 1),
(2, 1, 20000, 1),
(3, 2, 67, 254),
(4, 3, 350, 456);
```

## Requêtes d’Affichage (Fichier : `viewDATA.sql`)
Le fichier `viewDATA.sql` contient les requêtes permettant de visualiser les données sous différentes perspectives.

### Liste des commandes avec les clients et les articles
```sql
SELECT * 
FROM client c
INNER JOIN commande com ON c.id = com.client_id
INNER JOIN ligne l ON l.commande_id = com.id
INNER JOIN article a ON l.article_id = a.id;
```

### Liste des articles commandés par client
```sql
SELECT c.nom AS client_nom, c.prenom AS client_prenom, a.nom AS article_nom, l.quantity
FROM client c
INNER JOIN commande com ON c.id = com.client_id
INNER JOIN ligne l ON l.commande_id = com.id
INNER JOIN article a ON l.article_id = a.id;
```

## Conclusion
Ce projet permet une gestion efficace des clients, commandes et articles vendus. Il peut être amélioré en ajoutant des fonctionnalités comme le suivi des paiements ou la gestion des stocks.

