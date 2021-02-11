
CREATE TABLE Cities (
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(20) NOT NULL,
CountryCode CHAR(2) CHECK(LEN(CountryCode)=2) NOT NULL)

CREATE TABLE Hotels(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30) NOT NULL,
CityId INT FOREIGN KEY REFERENCES Cities(id) not null,
EmployeeCount INT NOT NULL,
BaseRate DECIMAL(18,2) )

CREATE TABLE Rooms(
Id INT PRIMARY KEY IDENTITY,
Price DECIMAL(18,2) NOT NULL,
Type NVARCHAR(20) NOT NULL,
Beds INT NOT NULL,
HotelId INT FOREIGN KEY REFERENCES Hotels(id) not null)

CREATE TABLE Trips(
Id INT PRIMARY KEY IDENTITY,
RoomId INT FOREIGN KEY REFERENCES Rooms(id) not null,
BookDate DATE NOT NULL,
ArrivalDate DATE NOT NULL,
ReturnDate DATE NOT NULL,
CancelDate DATE,
CHECK(BookDate<ArrivalDate),
CHECK(ArrivalDate<ReturnDate) 
 )

CREATE TABLE Accounts(
Id INT PRIMARY KEY IDENTITY,
FirstName nvarchar(50) not null,
MiddleName nvarchar(20),
LastName nvarchar(50) not null,
CityId INT FOREIGN KEY REFERENCES Cities(id) not null,
BirthDate Date not null,
Email varchar(100) unique NOT NULL)

CREATE TABLE AccountsTrips(
AccountId INT FOREIGN KEY REFERENCES Accounts(id) not null,
TripId INT FOREIGN KEY REFERENCES Trips(id) not null,
Luggage INT DEFAULT 0 NOT NULL
PRIMARY KEY(AccountId,TripId),
CHECK (Luggage>=0)
)
