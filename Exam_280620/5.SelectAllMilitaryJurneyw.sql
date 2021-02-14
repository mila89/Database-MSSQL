SELECT id, format(JourneyStart,'dd/MM/yyyy') as [JourneyStart], format(JourneyEnd,'dd/MM/yyyy') AS [JourneyEnd] 
FROM Journeys WHERE Purpose='Military'
ORDER BY [JourneyStart]