CREATE DATABASE Minions

CREATE TABLE Mionions
(
	Id int NOT NULL PRIMARY KEY,
	Name VARCHAR(20),
	Age INT
)

CREATE TABLE Towns
(
	iD INT NOT NULL PRIMARY KEY,
	Name VARCHAR(20)
)



--Minions				Towns
--Name	   Age	 TownId		Id	Name
--Kevin	   22	  1			1	Sofia
--Bob	   15	  3			2	Plovdiv
--Steward  NULL	  2			3	Varna

INSERT INTO Towns (Id, Name) VALUES
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna')

INSERT INTO Minions (Id, Name, Age, TownId) VALUES
(1,'Kevin', 22,1),
(2,'Bob', 15,3),
(3,'Steward', NULL,2)



DELETE FROM MINIONS

DROP TABLE MINIONS;

DROP TABLE Towns;

