CREATE TABLE Passports
( 
PassportID int PRIMARY KEY IDENTITY(101,1),
PassportNumber VARCHAR(8)
)

Create TABLE Persons (
PersonID INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(15),
Salary FLOAT(2),
PassportID INT UNIQUE FOREIGN KEY REFERENCES  Passports(PassportID)
)

INSERT INTO Passports (PassportNumber) VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')

INSERT INTO PERSONS (FirstName,Salary, PassportID) VALUES
('Roberto',43300.00,102),
('Tom',56100.00,103),
('Yana',60200,101)

