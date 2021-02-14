--Delete first three inserted Journeys (be careful with the relationships).


DELETE FROM TravelCards WHERE JourneyId IN (SELECT TOP(3) Id FROM Journeys)
DELETE TOP(3) FROM Journeys
