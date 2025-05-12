SELECT *
FROM Produit p
INNER JOIN Detail_commande dc ON p.id_produit = dc.id_produit
INNER JOIN Commande com ON com.id_commande = dc.id_commande
INNER JOIN Clients c ON c.id_client = com.id_client 