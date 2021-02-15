--Create a user defined function with the name dbo.udf_GetColonistsCount(PlanetName VARCHAR (30))
--that receives planet name and returns the count of all colonists sent to that planet.

CREATE FUNCTION udf_GetColonistsCount(@PlanetName VARCHAR (30))
RETURNS INT
AS
BEGIN
	RETURN (SELECT COUNT(*) FROM Planets AS P
	JOIN Spaceports AS S ON P.ID=S.Planetid
	JOIN Journeys AS J ON S.ID=J.DestinationSpaceportId
	JOIN TravelCards AS TC ON J.ID=TC.JourneyId
	WHERE P.NAME=@PlanetName)
END;

SELECT dbo.udf_GetColonistsCount('Otroyphus')