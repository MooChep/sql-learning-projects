INSERT INTO client (id, nom, prenom) VALUES
(1, 'PITT', 'Brad'),
(2, 'CLONEY', 'George'),
(3, 'DUJARDIN', 'Jean');

INSERT INTO article (id, nom, prix) VALUES
(1, 'Play Station 5', 400),
(2, 'Motoculteur', 20000),
(3, 'Parapluie', 45),
(4, 'Café', 2)
;

INSERT INTO commande (id, date, client_id) VALUES
(1, '2024-09-08 10:15:00', 1),
(2, '2024-03-02 3:15:00', 3),
(3, '2023-11-03 10:15:00', 2);

INSERT INTO ligne (article_id, commande_id, prix_achat, quantity) VALUES
(1, 1, 400, 1),
(2, 1, 20000, 1),
(3, 2, 67, 254),
(4, 3, 350, 456)

;


