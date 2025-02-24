CREATE DATABASE Movies;
USE Movies;

CREATE TABLE Thrillers(
    Movie_id INT PRIMARY KEY AUTO_INCREMENT,
    Movie_name VARCHAR(100) NOT NULL,
    Duration INT CHECK (Duration>0),
    Genre INT(50) DEFAULT 500,
    MovieRef VARCHAR(59) UNIQUE
);

CREATE TABLE comedy(
    Movie_id INT PRIMARY KEY AUTO_INCREMENT,
    Movie_name VARCHAR(100) NOT NULL,
    Duration INT CHECK (Duration>0),
    Genre VARCHAR(50) DEFAULT "Cat",
    MovieRef VARCHAR(59) UNIQUE
);

ALTER TABLE comedy ADD subtitle VARCHAR(20);

ALTER TABLE thrillers CHANGE Movie_id Id VARCHAR(188);

ALTER TABLE thrillers DROP COLUMN genre;

DESCRIBE thrillers;

DROP TABLE comedy;
SHOW TABLES;
TRUNCATE Table Thrillers;

RENAME Table Thrillers TO Thriller;


CREATE SCHEMA my_schema;
USE my_schema;
SHOW my_schema;