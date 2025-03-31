SELECT film.nom AS nom, acteur.prenom as acteur_prenom, acteur.nom as acteur_nom
FROM acteur
INNER JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
INNER JOIN film ON fa.film_id = film.id
WHERE acteur.nom = 'PITT'
;
-- Nombre film par acteur
SELECT acteur.prenom as acteur_prenom, acteur.nom as acteur_nom, COUNT(film.id) AS nb_film
FROM acteur
LEFT JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
LEFT JOIN film ON fa.film_id = film.id
GROUP BY acteur.nom 
;

-- Nombre d'acteur ayant plus de 2 films
SELECT acteur.prenom as acteur_prenom, acteur.nom as acteur_nom, COUNT(film.id) AS nb_film
FROM acteur
LEFT JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
LEFT JOIN film ON fa.film_id = film.id
GROUP BY acteur.nom 
HAVING COUNT(film.id) >= 2
;

-- Tous les acteurs dans tous les films
SELECT film.nom AS film, acteur.prenom AS acteur_prenom, acteur.nom AS acteur_nom
FROM acteur
INNER JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
INNER JOIN film ON fa.film_id = film.id;

-- Moyenne d'acteur dans 1 film
SELECT acteur.prenom as acteur_prenom, acteur.nom as acteur_nom,COUNT(acteur.nom)/ COUNT(film.nom) AS nb_film
FROM acteur
LEFT JOIN film_has_acteur fa ON acteur.id = fa.acteur_id
LEFT JOIN film ON fa.film_id = film.id
;