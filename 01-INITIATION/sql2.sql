SELECT * FROM zoo.vip;
SELECT MAX(salaryVip) FROM vip;
SELECT MIN(salaryVip) FROM vip;
SELECT nameVip, salaryVip FROM vip ORDER BY salaryVip LIMIT 1 ;
SELECT nameVip, salaryVip FROM vip ORDER BY salaryVip DESC LIMIT 1 ;

SELECT AVG(salaryVip) FROM vip;
SELECT COUNT(salaryVip) FROM vip;
SELECT * FROM vip WHERE salaryVip BETWEEN 1000000 AND 4000000;
SELECT UPPER(surnameVip) FROM vip;
SELECT * FROM vip WHERE nameVip LIKE 'bra%';
SELECT * FROM vip ORDER BY ageVip;
SELECT * FROM vip WHERE statusVip like "Membre";

SELECT COUNT(statusVip) FROM vip GROUP BY statusVip;
