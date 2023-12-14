CREATE TABLE SimpleLearn
(Serial int, Name varchar(50), Gender varchar(50), Status varchar(50));

SELECT *
FROM SimpleLearn
ORDER BY 1 

ALTER TABLE SimpleLearn
ADD Remark2 varchar(50), Remark3 varchar(50),
Remark4 varchar(50);

ALTER TABLE SimpleLearn
DROP COLUMN Remark2, Remark3, Remark4;

ALTER TABLE SimpleLearn
DROP ROW 

INSERT INTO SimpleLearn
VALUES
(1, 'Tosin', 'Male', 'Fit', 'Pass'),
(2, 'Jane', 'Female', 'Fit', 'Pass');

INSERT INTO SimpleLearn (Serial, Name) VALUES
(3, 'Koffi');

TRUNCATE TABLE SimpleLearn

SELECT *
FROM SimpleLearn
ORDER BY 1

ALTER TABLE SimpleLearn
ADD Weight int

INSERT INTO SimpleLearn
VALUES 
(3, 'Helen', 'Female', 'Fit', 'Pass', 80),
(4, 'Ben', 'Male', 'Unfit', 'Fail', 25),
(5, 'Jumbo', 'Female', 'Fit', 'Pass', 70),
(6, 'Chris', 'Male', 'Fit', 'Pass', 80);

DELETE FROM SimpleLearn
WHERE Serial IN (2, 3);

ALTER TABLE SimpleLearn RENAME TABLE TO SimpliLearn

CREATE TABLE SimpleLearn2
SELECT * FROM SimpleLearn


UPDATE SimpleLearn
SET Name = 'Janet'
WHERE Serial = 2

DELETE FROM SimpleLearn
WHERE Serial = 2

DELETE FROM SimpleLearn
WHERE Serial = 2

DELETE FROM SimpleLearn
WHERE Name = 'Koffi'

ALTER TABLE SimpleLearn
ADD Weight int

SELECT *
FROM SimpleLearn
ORDER BY Serial

INSERT INTO SimpleLearn (Weight)
VALUES (70)
WHERE Serial = 1

DELETE FROM SimpleLearn
WHERE Serial is NULL

UPDATE SimpleLearn
SET Weight = 70
WHERE Serial = 1

INSERT INTO SimpleLearn
VALUES (2, 'Jude', 'Male', 'Fit', 'Pass', 90);

SELECT Serial, Name, Gender, Status, Remark, Weight, Weight + 10 as NewWeight
FROM SimpleLearn
ORDER BY Serial


SELECT *
FROM SimpleLearn
WHERE Weight != 70

CREATE DATABASE Practice

SHOW = Databases;

USE customerbase

DROP DATABASE Practice

SELECT *
FROM SimpleLearn;

SELECT DISTINCT Weight, Gender 
FROM SimpleLearn;

SELECT COUNT (*) as AGECOUNT
FROM SimpleLearn 
WHERE Weight > 25;

SELECT *
FROM SimpleLearn LIMIT 3;

SELECT *
FROM SimpleLearn 
ORDER BY RAND();

SELECT *
FROM SimpleLearn 
WHERE name LIKE '%o%';


