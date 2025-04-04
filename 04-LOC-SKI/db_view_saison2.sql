-- SKI 2
-- nom, prénom, adresse, code postal, ville

SELECT nom, prenom, adresse, cpo as codePostal, ville, noFic, f.etat
FROM fiches f 
INNER JOIN clients c ON f.noCli = c.noCli
/* Equivalent mais permet de verifier qu'on selectionne bien les bonnes lignes
RIGHT JOIN clients c ON f.noCli = c.noCli
WHERE f.noFic IS NOT NULL
*/
WHERE f.etat = "EC";

-- Détail de la fiche de location de M. Dupond Jean de Paris (avec la désignation des articles loués, la date de départ et de retour).
SELECT designation,lF.depart as depart, lF.retour as retour
FROM lignesFic lF
INNER JOIN fiches f ON f.noFic = lF.noFic
INNER JOIN clients c ON c.noCli = f.noCli
INNER JOIN articles a ON a.refart = lF.refart
WHERE c.nom = "Dupond" AND c.prenom = "Jean"

-- Liste de tous les articles (référence, désignation et libellé de la catégorie) dont le libellé de la catégorie contient ski.

SELECT a.refart, a.designation, cat.libelle
FROM articles a 
INNER JOIN categories cat ON a.codeCate = cat.codeCate