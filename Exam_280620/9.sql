--Extract from the database all planets’ names and their journeys count. 
--Order the results by journeys count, descending and by planet name ascending.

--Required Columns
--•	PlanetName
--•	JourneysCount


SELECT P.Name AS [PlanetName], COUNT(J.Id) as [JourneysCount] FROM PLANETS AS P
JOIN Spaceports AS S ON P.ID=S.Planetid
JOIN Journeys AS J ON S.Id=J.DestinationSpaceportId
GROUP BY P.NAME
order by [JourneysCount] desc,[PlanetName]
