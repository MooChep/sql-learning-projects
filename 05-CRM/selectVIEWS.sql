-- Tableau des client et de leurs projets avec les différents devis
SELECT  c.nom AS client_nom, d.version, p.intitule AS projet_intitule, d.info AS devis_info, 
d.montant_total
FROM client c 
LEFT JOIN projet p ON c.id = p.client_id
LEFT JOIN devis d ON p.id = d.projet_id
LEFT JOIN facture f ON f.devis_id = d.id;

-- Tableau des Factures détaillées
SELECT f.id AS numero_facture, d.info AS devis_name, p.intitule AS nom_projet, f.prix AS Total, c.nom AS client_name, f.facture_emise, f.paiement
FROM facture f
INNER JOIN devis d ON f.devis_id = d.id
INNER JOIN projet p ON d.projet_id = p.id
INNER JOIN client c ON p.client_id = c.id ;

-- Tableau du chiffre d'affaires par client
SELECT  c.nom AS client_nom, SUM(d.montant_total) AS 'CA par clients'
FROM projet p
LEFT JOIN client c ON p.client_id = c.id
LEFT JOIN devis d ON p.id = d.projet_id
LEFT JOIN facture f ON f.devis_id = d.id
GROUP BY client_nom
;
/*
-- Tableau du nombre de devis par client
SELECT c.nom AS client_nom, 
COUNT(d.info) AS 'Nombre de Devis'
FROM client c
LEFT JOIN projet p ON c.id = p.client_id
LEFT JOIN devis d ON p.id = d.projet_id
LEFT JOIN facture f ON f.devis_id = d.id
GROUP BY client_nom
;
*/
-- Tableau du nombre de factures par client
SELECT c.nom AS client_nom, 
COUNT(f.id) AS 'Nombre de Facture'
FROM client c
LEFT JOIN projet p ON c.id = p.client_id
LEFT JOIN devis d ON p.id = d.projet_id
LEFT JOIN facture f ON f.devis_id = d.id
GROUP BY client_nom
;

-- CA global
SELECT COUNT(f.id) AS 'Nombre de factures', SUM(f.prix) AS 'CA Global'
FROM projet p
LEFT JOIN client c ON p.client_id = c.id
LEFT JOIN devis d ON p.id = d.projet_id
LEFT JOIN facture f ON f.devis_id = d.id
;

-- CA global
SELECT COUNT(f.id) AS 'Nombre de factures', SUM(f.prix) AS 'Total Factures impayées'
FROM projet p
LEFT JOIN client c ON p.client_id = c.id
LEFT JOIN devis d ON p.id = d.projet_id
LEFT JOIN facture f ON f.devis_id = d.id
WHERE f.paiement IS NULL
;

-- Tableau des Factures en retard de paiement 
SELECT f.id AS numero_facture, d.info AS devis_name, p.intitule AS nom_projet, DATEDIFF(NOW(), f.facture_emise)
FROM facture f
JOIN devis d ON f.devis_id = d.id
JOIN projet p ON d.projet_id = p.id
JOIN client c ON p.client_id = c.id
WHERE f.paiement IS NULL;

-- Tableau avec les pénalités de paiement ( 2 euros par jours dépassé )
SELECT f.id AS numero_facture, d.info AS devis_name, p.intitule AS nom_projet, f.prix AS Total, c.nom AS client_name, f.facture_emise, f.paiement, 2*DATEDIFF(NOW(), f.facture_emise) AS  'Penalité'
FROM facture f
JOIN devis d ON f.devis_id = d.id
JOIN projet p ON d.projet_id = p.id
JOIN client c ON p.client_id = c.id
WHERE f.paiement IS NULL;
;

-- CA moyen par Client
SELECT COUNT(c.nom) AS 'Nombre de client', SUM(f.prix)/COUNT(c.id) AS CA_Total
FROM projet p
LEFT JOIN client c ON p.client_id = c.id
LEFT JOIN devis d ON p.id = d.projet_id
LEFT JOIN facture f ON f.devis_id = d.id
;
