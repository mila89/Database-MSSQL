CREATE DATABASE CarRental

CREATE TABLE Categories  
(
Id int primary key IDENTITY NOT NULL, 
CategoryName VARCHAR(20) NOT NULL,
DailyRate FLOAT(2), 
WeeklyRate FLOAT(2), 
MonthlyRate FLOAT(2),
WeekendRate FLOAT(2)
);

CREATE TABLE Cars 
(
Id int primary key IDENTITY NOT NULL,
PlateNumber VARCHAR(10) NOT NULL,
Manufacturer VARCHAR(20),
Model VARCHAR(20),
CarYear INT, 
CategoryId INT FOREIGN KEY REFERENCES CATEGORIES(ID), 
Doors TINYINT, 
Picture IMAGE, 
Condition VARCHAR(100),
Available BIT
);

CREATE TABLE Employees 
(
Id int primary key IDENTITY NOT NULL, 
FirstName VARCHAR(20) NOT NULL, 
LastName VARCHAR(20) NOT NULL,
Title VARCHAR(20), 
Notes TEXT
);

CREATE TABLE Customers 
(
Id int primary key IDENTITY NOT NULL, 
DriverLicenceNumber VARCHAR(10), 
FullName VARCHAR(20) NOT NULL,
Address VARCHAR(50),
City VARCHAR(20), 
ZIPCode VARCHAR(10), 
Notes TEXT
);

CREATE TABLE RentalOrders 
(
Id  int primary key IDENTITY, 
EmployeeId INT FOREIGN KEY REFERENCES Employees(ID),
CustomerId int FOREIGN KEY REFERENCES Customers(ID) NOT NULL,
CarId int FOREIGN KEY REFERENCES Cars(id) NOT NULL, 
TankLevel int,
KilometrageStart int, 
KilometrageEnd int, 
TotalKilometrage int, 
StartDate DATE,
EndDate DATE, 
TotalDays INT, 
RateApplied FLOAT(2),
TaxRate FLOAT(2), 
OrderStatus VARCHAR(20),
Notes TEXT
);

INSERT INTO Categories(CategoryName, DailyRate, WeeklyRate, 
						MonthlyRate, WeekendRate) VALUES
('COMPANY',20,100,400,30),
('CLIENT',25,80,300,35),
('GOVERM',35,100,400,40)

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, 
				  Doors, Picture, Condition, Available) VALUES

('AB1234','TOYOTA', 'COROLA',2000,1,4,NULL,'GOOD',1),
('BC1234','VOLVO', 'XC90',2010,1,4,NULL,'GOOD',1),
('BG1234','TOYOTA', 'RAF',2000,1,4,NULL,'GOOD',2)

INSERT INTO Employees (FirstName, LastName, Title, Notes) VALUES
('IVAN','PETROV', NULL,'TXT'),
('PETAR','PETROV', NULL,'TXT'),
('STOYAN','PETROV', NULL,'TXT')

INSERT INTO Customers(DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes) VALUES
('PK6802', 'iVANOV', 'sOFIA', 'SOFIA','1337','SDAS'),
('ABG802', 'STOYANOV', 'sOFIA', 'SOFIA','1337','SDAS'),
('FDG802', 'PETROV', 'sOFIA', 'SOFIA','1337','SDAS')

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, 
						  KilometrageStart, KilometrageEnd, TotalKilometrage, 
						  StartDate, EndDate, TotalDays, RateApplied, 
						  TaxRate, OrderStatus, Notes) VALUES

(1,2,3,3,0,150,1200,'2021-01-22','2022-01-24',2,100,20,'STAT','1234'),
(3,2,1,2,2,150,1200,'2021-01-22','2022-01-24',2,100,20,'STAT','1234'),
(1,2,3,3,30,150,1200,'2021-01-22','2022-01-24',2,100,20,'STAT','1234')

