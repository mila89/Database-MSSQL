CREATE DATABASE SoftUni

CREATE TABLE Towns (
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Name VARCHAR(20) not null
)

CREATE TABLE Addresses (
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
AddressText VARCHAR(50) not null,
TownId INT FOREIGN KEY REFERENCES TOWNS(ID) NOT NULL
)

CREATE TABLE Departments (
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Name VARCHAR(20) 
)

CREATE TABLE Employees (
Id INT PRIMARY KEY IDENTITY NOT NULL,
FirstName VARCHAR(15),
MiddleName VARCHAR(15),
LastName VARCHAR(15),
JobTitle VARCHAR(20), 
DepartmentId INT FOREIGN KEY REFERENCES Departments(Id),
HireDate DATE,
Salary FLOAT(2),
AddressId INT FOREIGN KEY REFERENCES Addresses(Id)
)

USE master;  
ALTER DATABASE SoftUni SET RECOVERY FULL;  


BACKUP DATABASE SoftUni  
  TO DISK = 'C:\Users\User\Documents\SQL Server Management Studio\softuni-backup.bak'   
  WITH FORMAT;  

BACKUP LOG softuni TO DISK = 'C:\Users\User\Documents\SQL Server Management Studio\softuni-backup.bak';  
 

DROP DATABASE SOFTUNI;

RESTORE DATABASE SoftUni FROM DISK = 'C:\Users\User\Documents\SQL Server Management Studio\softuni-backup.bak'

INSERT INTO Towns(Name) VALUES
('Sofia'), ('Plovdiv'), ('Varna'), ('Burgas')

INSERT INTO Departments(Name) VALUES
('Engineering'), ('Sales'), ('Marketing'),('Software Development'),('Quality Assurance');

INSERT INTO Employees (FirstName, MiddleName, LastName,JobTitle, DepartmentId, HireDate, Salary) VALUES
('Ivan','Ivanov','Ivanov','.NET Developer',4,'2013/02/01',3500.00),
('Petar','Petrov','Petrov','Senior Engineer',1,'2004/03/02',4000.00),
('Maria','Petrova','Ivanova','Intern',5,'2016/08/28',525.25),
('Georgi','Teziev','Ivanov','CEO',2,'2007/12/09',3000.00),
('Peter','Pan','Pan','Intern',3,'2016/08/28',599.88)

SELECT * FROM Towns;

SELECT * FROM Departments;

SELECT * FROM Employees;

