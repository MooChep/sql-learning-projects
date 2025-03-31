### Présentation du projet : Base de données de gestion de films et d’acteurs  

Ce projet met en place une base de données permettant de gérer des films et leurs acteurs associés. L'objectif est de structurer les relations entre les films et les acteurs afin de faciliter les recherches et analyses sur ces données.

---

### **1. Création de la base de données**  
On commence par créer une base de données nommée `prime_vdo` et les tables associées :  

```sql
DROP DATABASE IF EXISTS prime_vdo;
CREATE DATABASE prime_vdo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE prime_vdo;
```

On définit ensuite trois tables principales :

- **`film`** : Contient les informations sur les films (id, nom).  
- **`acteur`** : Stocke les informations des acteurs (id, prénom, nom).  
- **`film_has_acteur`** : Table de liaison entre les films et les acteurs pour gérer les relations "plusieurs à plusieurs".  

#### **Tables SQL :**
```sql
CREATE TABLE film (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  CONSTRAINT pk_film PRIMARY KEY(id)
) ENGINE=INNODB;

CREATE TABLE acteur (
  id INT NOT NULL AUTO_INCREMENT,
  prenom VARCHAR(100) NOT NULL,
  nom VARCHAR(100) NOT NULL,
  CONSTRAINT pk_acteur PRIMARY KEY(id)
) ENGINE=INNODB;

CREATE TABLE film_has_acteur (
  film_id INT NOT NULL,
  acteur_id INT NOT NULL,
  CONSTRAINT pk_film_has_acteur PRIMARY KEY (film_id, acteur_id)
) ENGINE=INNODB;
```

On ajoute ensuite les **clés étrangères** pour garantir l’intégrité des relations entre les films et les acteurs :  

```sql
ALTER TABLE film_has_acteur ADD CONSTRAINT fk_acteur FOREIGN KEY (acteur_id) REFERENCES acteur (id);
ALTER TABLE film_has_acteur ADD CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES film (id);
```

---

### **2. Insertion des données**
On insère quelques acteurs célèbres dans la table `acteur` :

```sql
INSERT INTO acteur (id, prenom, nom) VALUES
(1, 'Brad', 'PITT'),
(2, 'Léonardo', 'Dicaprio'),
(3, 'Tom', 'Cruise');
```

On ajoute ensuite des films dans la table `film` :

```sql
INSERT INTO film (id, nom) VALUES
(1, 'Fight Club'),
(2, 'Once Upon a time in Hollywood'),
(3, 'Titanic');
```

Enfin, on établit les relations entre les films et les acteurs dans la table `film_has_acteur` :

```sql
INSERT INTO film_has_acteur (film_id, acteur_id) VALUES 
(1, 1),  -- Brad Pitt joue dans Fight Club
(2, 1),  -- Brad Pitt joue dans Once Upon a Time in Hollywood
(2, 2),  -- Leonardo DiCaprio joue dans Once Upon a Time in Hollywood
(3, 2);  -- Leonardo DiCaprio joue dans Titanic
```

---

### **3. Requêtes pour exploiter la base de données**

#### a) **Lister tous les films dans lesquels joue un acteur spécifique**
Exemple : Trouver tous les films avec Brad Pitt :  

```sql
SELECT film.nom AS nom, acteur.prenom AS acteur_prenom, acteur.nom AS acteur_nom
FROM acteur
INNER JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
INNER JOIN film ON fa.film_id = film.id
WHERE acteur.nom = 'PITT';
```

**Résultat attendu :**  
| nom                          | acteur_prenom | acteur_nom |
|-----------------------------|--------------|------------|
| Fight Club                  | Brad         | PITT       |
| Once Upon a time in Hollywood | Brad         | PITT       |

---

#### b) **Nombre de films par acteur**
Cette requête permet d’afficher combien de films chaque acteur a joués :  

```sql
SELECT acteur.prenom as acteur_prenom, acteur.nom as acteur_nom, COUNT(film.id) AS nb_film
FROM acteur
LEFT JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
LEFT JOIN film ON fa.film_id = film.id
GROUP BY acteur.nom;
```

**Résultat attendu :**  
| acteur_prenom | acteur_nom   | nb_film |
|--------------|-------------|---------|
| Brad         | PITT        | 2       |
| Léonardo     | Dicaprio    | 2       |
| Tom          | Cruise      | 0       |

---

#### c) **Lister les acteurs ayant joué dans au moins 2 films**
```sql
SELECT acteur.prenom as acteur_prenom, acteur.nom as acteur_nom, COUNT(film.id) AS nb_film
FROM acteur
LEFT JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
LEFT JOIN film ON fa.film_id = film.id
GROUP BY acteur.nom 
HAVING COUNT(film.id) >= 2;
```

**Résultat attendu :**  
| acteur_prenom | acteur_nom   | nb_film |
|--------------|-------------|---------|
| Brad         | PITT        | 2       |
| Léonardo     | Dicaprio    | 2       |

---

#### d) **Afficher tous les acteurs et les films associés**
```sql
SELECT film.nom AS film, acteur.prenom AS acteur_prenom, acteur.nom AS acteur_nom
FROM acteur
INNER JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
INNER JOIN film ON fa.film_id = film.id;
```

**Résultat attendu :**  
| film                           | acteur_prenom | acteur_nom   |
|--------------------------------|--------------|-------------|
| Fight Club                     | Brad         | PITT        |
| Once Upon a time in Hollywood  | Brad         | PITT        |
| Once Upon a time in Hollywood  | Léonardo     | Dicaprio    |
| Titanic                        | Léonardo     | Dicaprio    |

---

#### e) **Calculer la moyenne d’acteurs par film**
```sql
SELECT COUNT(acteur.id) / COUNT(DISTINCT film.id) AS moyenne_acteurs_par_film
FROM acteur
LEFT JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
LEFT JOIN film ON fa.film_id = film.id;
```

**Résultat attendu :**  
| moyenne_acteurs_par_film |
|-------------------------|
| 1.33                    |

---

### **4. Compétences acquises**
À travers ce projet, les concepts suivants ont été mis en pratique :

✅ **Modélisation relationnelle** : utilisation des clés primaires et étrangères pour structurer la base de données.  
✅ **Gestion des relations "plusieurs à plusieurs"** : mise en place d'une table de liaison pour associer plusieurs films à plusieurs acteurs.  
✅ **Requêtes SQL avancées** : utilisation de `JOIN`, `GROUP BY`, `HAVING`, `COUNT`, et calculs statistiques.  
✅ **Extraction et analyse de données** : génération de statistiques sur les films et les acteurs.  