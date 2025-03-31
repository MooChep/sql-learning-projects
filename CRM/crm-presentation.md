# Documentation du projet CRM (MySQL)

## Introduction
Ce projet MySQL implémente un système de gestion de la relation client (CRM). Il permet de gérer des clients, leurs projets, les devis associés et les factures émises.

## Structure de la Base de Données
La base de données est divisée en plusieurs tables :
- **client** : Stocke les informations des clients.
- **projet** : Associe un client à un projet spécifique.
- **devis** : Contient les devis liés aux projets.
- **facture** : Enregistre les factures émises et leurs statuts de paiement.

### Création des tables (Fichier : `CREATEtable.sql`)
Le fichier `CREATEtable.sql` définit la structure des tables et leurs relations.
```sql
CREATE TABLE client (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(255)
);

CREATE TABLE projet (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  intitule VARCHAR(255),
  client_id INTEGER,
  FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE devis (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  info VARCHAR(255),
  version INT,
  montant_total INT,
  projet_id INT,
  FOREIGN KEY (projet_id) REFERENCES projet(id)
);

CREATE TABLE facture (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  prix INT,
  facture_emise DATE,
  paiement DATE,
  devis_id INT,
  FOREIGN KEY (devis_id) REFERENCES devis(id)
);
```

## Insertion des Données (Fichier : `INPUTdata.sql`)
Le fichier `INPUTdata.sql` insère des données de test dans les tables.
```sql
INSERT INTO client (nom) VALUES ('Mairie de Rennes'), ('Neo Soft'), ('Sopra');

INSERT INTO projet (intitule, client_id) VALUES ('Creation de site', 1), ('Logiciel CRM', 2);

INSERT INTO devis (info, version, montant_total, projet_id) VALUES
('DEV2100A', 1, 3000, 1),
('DEV2100B', 1, 5000, 2);

INSERT INTO facture (prix, facture_emise, paiement, devis_id) VALUES
(1500, '2023-09-01', '2023-10-01', 1),
(5000, '2024-02-01', NULL, 2);
```

## Requêtes d’Affichage (Fichier : `viewDATA.sql`)
Le fichier `viewDATA.sql` contient les requêtes permettant de visualiser les données sous différentes perspectives.

### Liste des clients et leurs projets
```sql
SELECT c.nom AS client_nom, p.intitule AS projet_intitule
FROM client c
LEFT JOIN projet p ON c.id = p.client_id;
```

### Liste des factures impayées
```sql
SELECT f.id AS numero_facture, d.info AS devis_name, c.nom AS client_name
FROM facture f
JOIN devis d ON f.devis_id = d.id
JOIN projet p ON d.projet_id = p.id
JOIN client c ON p.client_id = c.id
WHERE f.paiement IS NULL;
```

### Chiffre d’affaires global
```sql
SELECT SUM(f.prix) AS 'CA Global'
FROM facture f
WHERE f.paiement IS NOT NULL;
```

## Conclusion
Ce projet permet une gestion efficace des clients, projets, devis et factures. Il peut être étendu en ajoutant des fonctionnalités comme la gestion des relances ou l’automatisation des paiements.

