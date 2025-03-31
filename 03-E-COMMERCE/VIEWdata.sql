SELECT * 
FROM client c
INNER JOIN commande com ON c.id = com.client_id
INNER JOIN ligne l ON l.commande_id = com.id
INNER JOIN article a ON l.article_id = a.id