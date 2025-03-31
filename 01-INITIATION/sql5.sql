SELECT chats.id, chats.nom, couleur.nom, age FROM chats INNER JOIN couleur ON chats.couleur_id = couleur.id;
SELECT * FROM chats;
SELECT chats.id, chats.nom, couleur.nom, age FROM chats LEFT JOIN couleur ON chats.couleur_id = couleur.id;
SELECT * FROM chats WHERE couleur_id is null
