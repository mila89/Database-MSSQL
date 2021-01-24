CREATE TABLE Manufacturers(
ManufacturerID INT PRIMARY KEY IDENTITY,
Name VARCHAR(15),
EstablishedOn DATE 
)

CREATE TABLE Models(
ModelID INT PRIMARY KEY IDENTITY(101,1),
Name VARCHAR(10),
ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Manufacturers(Name, EstablishedOn) VALUES
('BMW','1916/03/07'),
('Tesla','2003/01/01'),
('Lada','1966/05/01')

INSERT INTO Models (Name, ManufacturerID) VALUES
('X1',1),
('i6',1),
('ModelS',2),
('ModelX',2),
('Model3',2),
('Nova',3)
