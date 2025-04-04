# Projets SQL

Ce dépôt contient quatre projets réalisés en SQL, 3 d'entre eux visant à gérer une facette différente d'une entreprise. Ces projets incluent la gestion d'une **location de ski**, un **site e-commerce**, un **CRM (Customer Relationship Management)** et une **gestion de films**. Chaque projet comporte une base de données avec plusieurs tables pour modéliser les informations pertinentes et des requêtes pour interagir avec les données.

## Documentation

Une documentation détaillée est disponible dans chaque dossier de projets.  
Voici toutefois une explication brève de chaque projets :

## 1. **Location de Ski**
Ce projet permet de gérer une entreprise de location de skis. Il inclut les informations sur les **clients**, **équipements de ski**, **réservations** et **factures**. Le but est de suivre la location des équipements par les clients, de vérifier les stocks disponibles et de gérer les facturations.

### Tables principales :
- `clients` : Informations sur les clients.
- `équipements` : Liste des équipements de ski disponibles.
- `réservations` : Détails des réservations effectuées par les clients.
- `factures` : Suivi des paiements effectués pour les réservations.

### Exemples de requêtes :
- Trouver les clients ayant réservé un équipement spécifique.
- Suivre les stocks d'équipements disponibles.
  
---

## 2. **E-commerce**
Ce projet simule une base de données pour un site de e-commerce. Il gère les **produits**, **clients**, **commandes**, **détails de commandes**, et **paiements**. L'objectif est de suivre les produits en stock, les commandes passées par les clients, les paiements effectués et les retours.

### Tables principales :
- `produits` : Détails des produits vendus sur le site.
- `clients` : Informations sur les clients.
- `commandes` : Détails des commandes passées par les clients.
- `paiements` : Informations sur les paiements liés aux commandes.

### Exemples de requêtes :
- Suivre les commandes passées par un client.
- Analyser les produits les plus vendus.
- Suivre les paiements et gérer les retours de produits.

---

## 3. **CRM (Customer Relationship Management)**
Ce projet permet de gérer la relation avec les clients en enregistrant les **interactions**, **contrats**, **produits/services** achetés et l'**historique des ventes**. Il permet de suivre l’évolution des relations clients, leurs achats et l’état des contrats en cours.

### Tables principales :
- `clients` : Informations sur les clients.
- `interactions` : Détails des interactions avec les clients.
- `contrats` : Suivi des contrats signés avec les clients.
- `produits_services` : Détails des produits ou services achetés.
- `historique_ventes` : Historique des ventes réalisées.

### Exemples de requêtes :
- Suivre les interactions avec un client spécifique.
- Analyser la fréquence d'achat des clients.
- Vérifier l’état des contrats en cours.

---

## 4. **CINEMA**

Ce projet met en place une base de données permettant de gérer des films et leurs acteurs associés. L'objectif est de structurer les relations entre les films et les acteurs afin de faciliter les recherches et analyses sur ces données.

### Trois tables principales :

- **`film`** : Contient les informations sur les films (id, nom).  
- **`acteur`** : Stocke les informations des acteurs (id, prénom, nom).  
- **`film_has_acteur`** : Table de liaison entre les films et les acteurs pour gérer les relations "plusieurs à plusieurs".  


---
## Installation

Pour chaque projet, vous devez disposer d'un serveur SQL compatible (comme MySQL ou MariaDB). Une fois le serveur mis en place, vous pouvez importer les fichiers SQL pour créer la base de données et les tables.

```bash
mysql -u [user] -p < nom_du_fichier.sql
```

---

## Conclusion
Ces projets offrent une base solide pour comprendre la gestion des données dans différents domaines d'activité. Ils peuvent être facilement étendus ou modifiés pour s’adapter à des besoins plus spécifiques ou pour intégrer des fonctionnalités supplémentaires.
