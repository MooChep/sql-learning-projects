CREATE DATABASE IF NOT EXISTS zoo;
USE zoo;
CREATE TABLE IF NOT EXISTS chats (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    yeux VARCHAR(20) NOT NULL,
    age TINYINT NOT NULL,
    CONSTRAINT pk_chats PRIMARY KEY (id)
)  ENGINE=INNODB;

INSERT INTO chats (nom, yeux, age) VALUES
('Maine coon', 'marron', 20),
('Siamois', 'bleu', 15),
('Bengal', 'marron', 18),
('Scottish Fold', 'marron', 10);


CREATE TABLE IF NOT EXISTS vip (
	id INT NOT NULL AUTO_INCREMENT,
    nameVip VARCHAR(100) NOT NULL, 
    surnameVip VARCHAR(100) NOT NULL, 
    # age peut etre null si vip est mort
    ageVip TINYINT,
    registrationDate DATE NOT NULL,
    state BOOL NOT NULL,
    statusVip ENUM('Membre', 'Non Membre') NOT NULL,
    resumeVip TEXT,
    salaryVip INT NOT NULL,
    CONSTRAINT pk_vip PRIMARY KEY(id)
    )ENGINE=INNODB;

TRUNCATE vip;
INSERT INTO vip(nameVip, surnameVip, ageVip, registrationDate, state, statusVip, resumeVip, salaryVip) 
VALUES 
('Brad', 'PITT', 60, '1970-01-01', 1, 'non membre', 'lorem ipsum', 2000000),
('George', 'CLONEY', 62, '1999-01-01', 0, 'membre', 'juste beau', 4000000),
('Jean', 'DUJARDIN', 51, '1994-01-01', 0, 'membre', 'brice de nice', 1000000);
