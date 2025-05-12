USE e_commerce;
INSERT INTO Produit (id_produit, nom, `description`, prix, stock, catégorie) VALUES
(1, "Laptop", "Ordinateur Portable", 400, 5, 'Tech'),
(2, "Casque Audio", "Super son", 150, 16, 'Tech'),
(3, "Micro Ondes", "Blanc et noir", 200, 3, 'Electro');


INSERT INTO Clients (id_client, nom, prenom, email) VALUES
(1, 'PITT', 'Brad', 'brad.pitt@mail.com'),
(2, "COTILLON", 'Landry', 'landry.cotillon@mail.com'),
(3, "HEAS", "Ilan", 'ilanheas@gmail.com');

INSERT INTO Commande (id_commande, id_client, `date_paiement`, `status`,  total) VALUES
(1, 3, "2025/05/12", 'Livré', 550);
INSERT INTO Detail_commande (id_detail, id_commande, id_produit, quantite, prix_unitaire) VALUES
(1, 1, 2, 1, 150),
(2, 1, 1, 1, 400);


