# Gestion des Factures - Base de Données SQL

## 📌 Description

Ce projet consiste en la création d'une base de données relationnelle pour la gestion des factures, des devis et des projets clients. Il a été réalisé avec **MySQL**, en utilisant **MySQL Workbench** pour l'écriture du code et **Db Diagram** pour la conception de la structure.

## 🏗️ Fonctionnalités

- Stockage et gestion des clients, projets, devis et factures.
    
- Relations entre les différentes entités via des clés étrangères.
    
- Requêtes SQL pour extraire des informations utiles :
    
    - Liste des factures détaillées
        
    - Chiffre d'affaires par client
        
    - Nombre de devis par client
        
    - Factures en retard de paiement avec pénalités
        

## 🛠️ Technologies utilisées

- **MySQL** (Base de données)
    
- **MySQL Workbench** (Conception et visualisation)
    
- **PhpMyAdmin** (Gestion et exécution des requêtes)
    

## 📂 Structure de la Base de Données

### Tables principales

- `client` : Stocke les informations des clients.
    
- `projet` : Contient les projets associés aux clients.
    
- `devis` : Enregistre les devis liés aux projets.
    
- `facture` : Gère les factures et les dates de paiements.
    

### Relations

- Un **client** peut avoir plusieurs **projets**.
    
- Un **projet** peut avoir plusieurs **devis**.
    
- Un **devis** peut être associé à une ou plusieurs **factures**.
    

## 📜 Script SQL

Le script SQL permettant de créer la base de données et d'insérer des données est disponible dans le fichier [database.sql]

## 📊 Requêtes SQL utiles

Quelques requêtes incluses dans ce projet :

- **Liste des factures détaillées**
    
- **Chiffre d'affaires par client**
    
- **Nombre de devis par client**
    
- **Factures en retard de paiement**
    

## 🚀 Comment utiliser ce projet

1. **Importer la base de données**
    
    - Exécuter le script SQL fourni dans **MySQL Workbench** ou **PhpMyAdmin**.
        
2. **Tester les requêtes**
    
    - Utiliser les différentes requêtes disponibles dans le fichier `database.sql`.
        

## 📌 Améliorations futures

- Ajouter un système de pénalités automatisé pour les retards de paiement.
    
- Créer une interface web avec **PHP** ou **Python** pour interagir avec la base de données.
