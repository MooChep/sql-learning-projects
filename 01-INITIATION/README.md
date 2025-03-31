# Présentation du Projet Zoo et SPA

## Introduction
Ce projet SQL repose sur la gestion de deux bases de données distinctes : `zoo` et `spa`. Il inclut la gestion des chats dans un environnement de zoo et de SPA, ainsi que des informations sur des VIP dans le zoo. Le projet est réparti sur cinq fichiers SQL, chacun ayant un rôle spécifique.

---

## 1. Création des Bases de Données et des Tables (sql1.sql)

Ce fichier initialise deux bases de données : `zoo` et `spa`. Il définit les structures des tables essentielles à la gestion des chats, des VIP et des couleurs dans la SPA.

### Base `zoo`
- **Table `chats`** : Contient les informations des chats, incluant leur nom, couleur des yeux et âge.
- **Table `vip`** : Gère les VIP avec des informations comme leur nom, âge, statut et salaire.

### Base `spa`
- **Table `chats`** : Stocke les informations des chats recueillis par la SPA.
- **Table `couleur`** : Contient les couleurs de chats et sert de table de référence.

---

## 2. Insertion des Données (sql2.sql)

Ce fichier insère des données initiales dans les tables `chats` et `vip` de la base `zoo` ainsi que dans les tables `chats` et `couleur` de la base `spa`.

- Exemples d'insertion dans `zoo.chats` :
  ```sql
  INSERT INTO chats (nom, yeux, age) VALUES ('Maine coon', 'marron', 20);
  ```
- Exemples d'insertion dans `zoo.vip` :
  ```sql
  INSERT INTO vip (nameVip, surnameVip, ageVip, registrationDate, state, statusVip, resumeVip, salaryVip)
  VALUES ('Brad', 'PITT', 60, '1970-01-01', 1, 'Non Membre', 'lorem ipsum', 2000000);
  ```

---

## 3. Consultation des Données (sql3.sql)

Ce fichier contient diverses requêtes permettant d'explorer les informations stockées.

### Requêtes sur `zoo.vip`
- Récupérer tous les VIP :
  ```sql
  SELECT * FROM zoo.vip;
  ```
- Récupérer le VIP avec le salaire maximum :
  ```sql
  SELECT nameVip, salaryVip FROM vip ORDER BY salaryVip DESC LIMIT 1;
  ```

### Requêtes sur `zoo.chats`
- Obtenir la liste des chats triée par âge :
  ```sql
  SELECT * FROM zoo.chats ORDER BY age;
  ```
- Récupérer le chat le plus âgé :
  ```sql
  SELECT * FROM zoo.chats ORDER BY age DESC LIMIT 1;
  ```

---

## 4. Jointures et Relations (sql4.sql)

Ce fichier contient des requêtes permettant d'exploiter les relations entre tables.

- **Jointure entre `chats` et `couleur` dans `spa`** :
  ```sql
  SELECT chats.id, chats.nom, couleur.nom, age FROM chats INNER JOIN couleur ON chats.couleur_id = couleur.id;
  ```
- **Jointure avec prise en compte des valeurs nulles** :
  ```sql
  SELECT chats.id, chats.nom, couleur.nom, age FROM chats LEFT JOIN couleur ON chats.couleur_id = couleur.id;
  ```

---

## 5. Statistiques et Agrégats (sql5.sql)

Ce fichier contient des requêtes permettant d'obtenir des statistiques.

- **Moyenne des âges des chats** :
  ```sql
  SELECT AVG(age) AS "Age Moyen" FROM chats;
  ```
- **Nombre de chats ayant les yeux marron** :
  ```sql
  SELECT COUNT(id) AS "Nombre de chats" FROM chats WHERE yeux="marron";
  ```
- **Nombre total de VIP par statut** :
  ```sql
  SELECT COUNT(statusVip) FROM vip GROUP BY statusVip;
  ```

---

## Conclusion

Ce projet illustre la gestion de bases de données SQL avec la création, l'insertion, la consultation et l'analyse des données. Il met en avant l'utilisation des jointures et des requêtes avancées pour extraire des statistiques pertinentes sur les chats et les VIP dans un environnement de zoo et de SPA.

