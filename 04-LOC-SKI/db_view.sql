use loc_ski;

-- Liste des clients (toutes les informations) dont le nom commence par un D
SELECT clients.noCli AS noCli, clients.nom AS Nom, clients.prenom AS Prenom, clients.adresse AS Adresse, clients.cpo AS 'Code Postal', clients.ville AS Ville
FROM Clients
WHERE clients.nom LIKE 'D%';

-- Nom et prénom de tous les clients
SELECT clients.nom AS Nom, clients.prenom AS Prenom
FROM Clients;

-- Liste des fiches (n°, état) pour les clients (nom, prénom) qui habitent en Loire Atlantique (44)
SELECT f.noFic AS noFic, f.etat AS 'État', clients.nom AS Nom, clients.prenom AS Prenom
FROM Clients
INNER JOIN fiches f ON f.noCli = clients.noCli
WHERE clients.cpo LIKE '44%';

-- Détail de la fiche n°1002

SELECT lF.noFic AS noFic, c.nom AS Nom, c.prenom AS 'Prénom', lF.refart AS refart, a.designation AS designation, lF.depart AS depart, lF.retour AS retour, t.prixJour as 'Prix Jour', ((SELECT DATEDIFF(IF(lF.retour IS NULL,NOW(),lF.retour), lF.depart)+1) * t.prixJour )AS montant
FROM fiches f 
INNER JOIN clients c ON c.noCli = f.noCli
INNER JOIN lignesFic lF ON lF.noFic = f.noFic
INNER JOIN articles a ON a.refart = lF.refart
INNER JOIN categories cat ON cat.codeCate = a.codeCate
INNER JOIN grilleTarifs gT ON gT.codeCate = cat.codeCate
INNER JOIN tarifs t ON t.codeTarif = gT.codeTarif
WHERE lF.noFic LIKE '1002'
GROUP BY lF.refart;


-- Prix journalier moyen de location par gamme
SELECT g.libelle AS Gamme, AVG(t.prixJour) AS 'tarif journalier moyen'
FROM tarifs t
INNER JOIN grilleTarifs gT ON gT.codeTarif = t.codeTarif
INNER JOIN gammes g ON g.codeGam = gT.codeGam
GROUP BY g.codeGam
ORDER BY g.codeGam;

-- Détail de la fiche n°1002 avec Total
SELECT  f.noFic, 
nom, 
prenom, 
a.refart, 
designation, 
depart, 
retour, 
prixJour,
(DATEDIFF(IFNULL(retour, NOW()+1),depart)+1)*prixJour as Montant, Total
FROM 
fiches f
JOIN clients c USING (noCli)
JOIN lignesfic l ON f.noFic = l.noFic
JOIN articles a ON l.refart=a.refart
JOIN grilletarifs g ON (a.codeGam=g.codeGam AND a.codeCate=g.codeCate)
JOIN tarifs t ON g.codeTarif = t.codeTarif
JOIN (
SELECT  
l.noFic,
SUM( (DATEDIFF(IFNULL(retour, NOW()+1),depart)+1)*prixJour) as total
FROM lignesfic l
JOIN articles a ON l.refart=a.refart
JOIN grilletarifs g ON (a.codeGam=g.codeGam AND a.codeCate=g.codeCate)
JOIN tarifs t ON g.codeTarif = t.codeTarif
WHERE l.noFic=1002
GROUP BY l.noFic ) info ON info.noFic = f.noFic;
 
-- Grille des tarifs
SELECT cat.libelle as libelle, g.libelle as LibelleGamme, t.libelle as LibelleTarifs, t.prixJour AS prixJour
FROM grilleTarifs gT 
INNER JOIN tarifs t ON t.codeTarif= gT.codeTarif
INNER JOIN gammes g ON g.codeGam = gT.codeGam
INNER JOIN categories cat ON cat.codeCate = gT.codeCate
ORDER BY g.codeGam;

-- Liste des location de la categorie Surf 
SELECT a.refart AS 'Ref. Article', a.designation AS 'Désignation', COUNT(lF.noFic) AS nbLocation
FROM articles a
INNER JOIN lignesFic lF ON a.refart = lF.refart
WHERE a.refart like 'S%'
GROUP BY a.refart;

-- Calcul du nombre moyen d’articles loués par fiche de location 
SELECT AVG(nbLig) AS "Moyenne Article Loués" FROM( 
SELECT lF.noFic as NumeroFiche, count(lF.noLig) as nbLig
FROM lignesFic lF
GROUP BY lF.noFic
) AS subquery;

-- Calcul du nombre de fiches de location établies pour les catégories de location Ski alpin, Surf et Patinette

SELECT c.libelle as catégories, count(lF.noFic) as nombreDeLocations
FROM articles a
INNER JOIN lignesFic lF ON a.refart = lF.refart
INNER JOIN categories c ON c.codeCate = a.codeCate
WHERE a.codeCate IN ("PA", "SA", "SURF")
GROUP BY a.codeCate;

-- Calcul du montant moyen des fiches de location

SELECT avg((DATEDIFF(IF(lF.retour IS NULL,NOW(),lF.retour), lF.depart)+1) * t.prixJour )AS montant
FROM fiches f 
INNER JOIN clients c ON c.noCli = f.noCli
INNER JOIN lignesFic lF ON lF.noFic = f.noFic
INNER JOIN articles a ON a.refart = lF.refart
INNER JOIN categories cat ON cat.codeCate = a.codeCate
INNER JOIN grilleTarifs gT ON gT.codeCate = cat.codeCate
INNER JOIN tarifs t ON t.codeTarif = gT.codeTarif

