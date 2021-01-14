CREATE DATABASE HOTEL

CREATE TABLE Employees (
Id INT PRIMARY KEY IDENTITY NOT NULL,
FirstName VARCHAR(20), 
LastName VARCHAR(20),
Title VARCHAR(20),
Notes TEXT)

CREATE TABLE Customers 
(
AccountNumber INT PRIMARY KEY IDENTITY NOT NULL, 
FirstName VARCHAR(20),
LastName VARCHAR(20),
PhoneNumber VARCHAR(20), 
EmergencyName VARCHAR(20),
EmergencyNumber VARCHAR(20),
Notes TEXT
)

CREATE TABLE RoomStatus 
(
RoomStatus VARCHAR(10) PRIMARY KEY NOT NULL,
Notes TEXT
)

CREATE TABLE RoomTypes 
(
RoomType VARCHAR(10) PRIMARY KEY not null,
Notes TEXT
)

CREATE TABLE BedTypes 
(
BedType VARCHAR(15) PRIMARY KEY NOT NULL,
Notes TEXT
)

CREATE TABLE Rooms 
(
RoomNumber INT PRIMARY KEY IDENTITY NOT NULL,
RoomType VARCHAR(10) FOREIGN KEY REFERENCES RoomTypes(RoomType) NOT NULL,
BedType VARCHAR(15)FOREIGN KEY REFERENCES BEDTYPES(BEDTYPE),
Rate FLOAT(2),
RoomStatus VARCHAR(10) FOREIGN KEY REFERENCES ROOMSTATUS(ROOMSTATUS),
Notes TEXT)

CREATE TABLE Payments 
(
Id INT PRIMARY KEY IDENTITY NOT NULL, 
EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
PaymentDate DATE,
AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber),
FirstDateOccupied DATE,
LastDateOccupied DATE,
TotalDays INT,
AmountCharged FLOAT, 
TaxRate FLOAT,
TaxAmount FLOAT,
PaymentTotal FLOAT,
Notes TEXT)

CREATE TABLE Occupancies (
Id INT PRIMARY KEY IDENTITY NOT NULL,
EmployeeId INT FOREIGN KEY REFERENCES EMPLOYEES(ID), 
DateOccupied DATE, 
AccountNumber int FOREIGN KEY REFERENCES CUSTOMERs(AccountNumber),
RoomNumber int FOREIGN KEY REFERENCES Rooms(RoomNumber),
RateApplied float,
PhoneCharge varchar(10),
Notes text)

INSERT INTO Employees(FirstName, LastName, Title, Notes) VALUES
('IVAN','PETKOV', 'SHEF','NONE'),
('PETAR', 'pETKOV', 'OFFICE','NONE'),
('MILAN', 'pETKOV', 'ROOMMATE','NONE')

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, 
						EmergencyNumber, Notes) VALUES
('MILA', 'IOVOVA', '0886836333','NONE','123456','NOTE'),
('IVA', 'IOMOVA', '088456436333','NONE','3456','NOTE'),
('YASEN', 'IOVOV', '0886836783','NONE','456','NOTE')

INSERT INTO RoomStatus (RoomStatus, Notes) VALUES
('NI','NOTESROOM'),
('GC','NOTESR'),
('MC','NOTESROOMS')

INSERT INTO RoomTypes (RoomType, Notes) VALUES
('DBL','NOTEDBL'),
('SGL','NOTESL'),
('TRIPLE','NOTETRL')

INSERT INTO BedTypes (BedType, Notes) VALUES
('QUEENSIZE','NOTEQ'),
('TWIN','NOTET'),
('SGL','NOTEQ')

INSERT INTO Rooms (RoomType, BedType, Rate, RoomStatus, Notes) VALUES
('DBL','QUEENSIZE',150.00,'NI','NOTE'),
('SGL','QUEENSIZE',170.00,'NI','NOTE'),
('TRIPLE','QUEENSIZE',180.00,'NI','NOTE')

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, 
					  LastDateOccupied, TotalDays, AmountCharged, TaxRate, 
					  TaxAmount, PaymentTotal, Notes) VALUES
(1,'2020-04-04',2,'2020-01-02', '2021-01-04', 366,300.00,10.05,60.15, 426.98,'NOTE'),
(2,'2020-04-04',3,'2020-01-02', '2021-01-04', 366,300.00,10.05,60.15, 426.98,'NOTE'),
(3,'2020-04-04',2,'2020-01-02', '2021-01-04', 366,300.00,10.05,60.15, 426.98,'NOTE')

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, 
						 RateApplied, PhoneCharge, Notes) VALUES
(1,'2020-02-02',2,3,222.00,'2','NOTE'),
(2,'2020-02-02',2,3,222.15,'2','NOTE'),
(2,'2021-01-02',2,3,222.23,'2','NOTE')