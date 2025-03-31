SELECT * FROM zoo.chats;

SELECT * FROM zoo.chats ORDER BY nom, age;
SELECT * FROM zoo.chats WHERE age BETWEEN 11 and 19;
SELECT * FROM zoo.chats WHERE nom LIKE "Sia%";
SELECT * FROM zoo.chats WHERE nom LIKE "%a%";
SELECT AVG(age) AS "Age Moyen" FROM chats;
SELECT COUNT(id) AS "Nombre de chats" FROM chats;
SELECT COUNT(id) AS "Nombre de chats" FROM chats WHERE yeux="marron";
SELECT * FROM zoo.chats ORDER BY age LIMIT 1;
SELECT * FROM zoo.chats ORDER BY age DESC LIMIT 1;
SELECT COUNT(yeux) FROM zoo.chats GROUP BY yeux;



