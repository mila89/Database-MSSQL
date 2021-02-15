SELECT S.NAME,S.Manufacturer FROM SPACESHIPS AS S
JOIN Journeys AS J ON S.Id=J.SpaceshipId 
JOIN TravelCards AS TC ON J.Id=TC.JourneyId
JOIN Colonists AS C ON TC.ColonistId=C.Id
WHERE tc.JobDuringJourney='Pilot' and C.BirthDate>'1989-01-01'
ORDER BY S.Name



--Extract from the database those spaceships, which have pilots, younger than 30 years old. In other words, 30 years from 01/01/2019. Sort the results alphabetically by spaceship name.
--Required Columns
--•	Name
--•	Manufacturer
