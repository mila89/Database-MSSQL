CREATE TABLE Planets (
Id INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(30) NOT NULL
)

CREATE TABLE Spaceports(
Id INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(50) NOT NULL,
Planetid INT FOREIGN KEY REFERENCES Planets(id) not null)


CREATE TABLE Spaceships (
Id INT PRIMARY KEY IDENTITY(0,1),
Name VARCHAR(50) NOT NULL,
Manufacturer VARCHAR(30) NOT NULL,
LightSpeedRate INT DEFAULT 0
)

CREATE TABLE Colonists(
Id INT PRIMARY KEY IDENTITY(0,1),
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Ucn VARCHAR(10) NOT NULL UNIQUE,
BirthDate DATE NOT NULL)


CREATE TABLE Journeys(
Id INT PRIMARY KEY IDENTITY(0,1),
JourneyStart DATETIME NOT NULL,
JourneyEnd DATETIME NOT NULL,
Purpose VARCHAR(11) CHECK(Purpose IN ('Medical', 'Technical', 'Educational', 'Military')),
DestinationSpaceportId INT FOREIGN KEY REFERENCES Spaceports(id) not null,
SpaceshipId INT FOREIGN KEY REFERENCES Spaceships(id) not null
)

CREATE TABLE TravelCards(
Id INT PRIMARY KEY IDENTITY(0,1),
CardNumber VARCHAR(10) NOT NULL UNIQUE CHECK(LEN(CardNumber)=10),
JobDuringJourney VARCHAR(8) CHECK(JobDuringJourney IN ('Pilot', 'Engineer', 'Trooper', 'Cleaner', 'Cook')),
ColonistId INT FOREIGN KEY REFERENCES Colonists(id) not null,
JourneyId INT FOREIGN KEY REFERENCES Journeys(id) not null )