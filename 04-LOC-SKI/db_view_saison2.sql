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
WHERE c.nom = "Dupond" AND c.prenom = "Jean";

-- Liste de tous les articles (référence, désignation et libellé de la catégorie) dont le libellé de la catégorie contient ski.

SELECT a.refart, a.designation, cat.libelle
FROM articles a 
INNER JOIN categories cat ON a.codeCate = cat.codeCate
WHERE cat.libelle LIKE "Ski%"
;

-- Calcul du montant de chaque fiche soldée et du montant total des fiches.

SELECT f.noFic AS numeroFiche, 
sum((DATEDIFF(IF(lF.retour IS NULL,NOW(),lF.retour), lF.depart)+1) * t.prixJour) as montantFiche, info.total,
f.etat
FROM fiches f 
INNER JOIN lignesFic lF ON lF.noFic = f.noFic
INNER JOIN articles a ON a.refart = lF.refart
INNER JOIN categories cat ON cat.codeCate = a.codeCate
INNER JOIN grilleTarifs gT ON gT.codeCate = cat.codeCate
INNER JOIN tarifs t ON t.codeTarif = gT.codeTarif
INNER JOIN (
SELECT  
l.noFic,
SUM( (DATEDIFF(IFNULL(retour, NOW()+1),depart)+1)*prixJour) as total
FROM lignesfic l
INNER JOIN articles a ON l.refart=a.refart
INNER JOIN grilletarifs g ON (a.codeGam=g.codeGam AND a.codeCate=g.codeCate)
INNER JOIN tarifs t ON g.codeTarif = t.codeTarif) info ON info.noFic = f.noFic
