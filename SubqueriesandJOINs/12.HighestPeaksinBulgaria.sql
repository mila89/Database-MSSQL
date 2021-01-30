SELECT MC.CountryCode, M.MountainRange, P.PeakName, P.Elevation 
FROM Peaks AS P
JOIN Mountains AS M
ON P.MountainId=M.Id
JOIN MountainsCountries AS MC
ON M.Id=MC.MountainId
WHERE P.Elevation>2835 AND MC.CountryCode='BG'
ORDER BY P.Elevation DESC;