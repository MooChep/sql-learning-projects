**Présentation du projet de gestion de location de matériel de ski**

### 1. Introduction
Ce projet vise à gérer la location de matériel de ski à travers une base de données SQL. Il repose sur plusieurs tables permettant de stocker les informations sur les clients, les fiches de location, les articles disponibles, ainsi que la tarification appliquée aux différentes gammes et catégories de matériel.

### 2. Structure de la base de données (**db_create.sql**)
Le fichier `db_create.sql` définit la structure de la base de données `loc_ski` et contient les tables suivantes :

- **clients** : Informations des clients (nom, prénom, adresse, code postal, ville).
- **fiches** : Fiches de location associées à un client, incluant les dates de création et de paiement.
- **lignesFic** : Lignes de chaque fiche, correspondant à des articles loués avec les dates de départ et de retour.
- **articles** : Inventaire des articles disponibles à la location.
- **gammes** et **categories** : Classification des articles par gamme et par catégorie.
- **tarifs** : Tarification des locations en fonction de la gamme et de la catégorie de l'article.
- **grilleTarifs** : Association entre gammes, catégories et tarifs.

Les relations entre ces tables sont gérées via des clés étrangères assurant l'intégrité référentielle.

### 3. Insertion des données (**db_input.sql**)
Le fichier `db_input.sql` insère des données de test dans les tables créées. Il permet d'avoir un jeu de données initial facilitant les tests et la manipulation de la base. Voici quelques exemples de données insérées :

- Des clients avec leurs informations complètes.
- Des fiches de location associées aux clients.
- Des tarifs de location selon plusieurs niveaux (Base, Bronze, Argent, Or, Platine, etc.).
- Un ensemble d'articles (skis, snowboards, patinettes) classés par gammes et catégories.
- La grille tarifaire associant les tarifs aux gammes et catégories d'articles.
- Des enregistrements de location dans la table `lignesFic`, indiquant les articles empruntés par chaque client et la durée de location.

### 4. Requêtes et vues (**db_view.sql**)
Le fichier `db_view.sql` propose plusieurs requêtes utiles pour extraire des informations pertinentes de la base de données, notamment :

- Liste des clients dont le nom commence par "D".
- Liste des fiches de location en cours ou terminées.
- Détails d'une fiche de location (client, articles loués, tarif appliqué, montant total).
- Calcul du tarif journalier moyen par gamme de matériel.

Ces requêtes facilitent l'analyse et le suivi des locations, tout en permettant de générer des rapports utiles pour la gestion de l'entreprise.

### 5. Conclusion
Ce système de gestion de location de ski fournit une base solide pour le suivi des clients, des articles et des tarifications. Il pourrait être étendu avec des fonctionnalités supplémentaires, comme une interface utilisateur pour simplifier la gestion ou des statistiques avancées sur l'utilisation des équipements.

