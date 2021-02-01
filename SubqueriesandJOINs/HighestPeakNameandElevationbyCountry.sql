SELECT TOP(5) K.CountryName, 
	   ISNULL(K.PeakName,'(no highest peak)') AS[Highest Peak Name], 
	   ISNULL(K.Elevation,0) AS [Highest Peak Elevation],
	   ISNULL(K.MountainRange,'(no mountain)') AS [Mountain]
FROM
  (SELECT C.CountryName, p.PeakName, p.Elevation, m.MountainRange,  
	 DENSE_RANK() OVER (PARTITION BY CountryName ORDER BY ELEVATION DESC) AS RANKED 
  FROM Countries AS C
  LEFT JOIN MountainsCountries MC ON C.CountryCode=MC.CountryCode
  LEFT JOIN Mountains AS M ON MC.MountainId=M.Id
  LEFT JOIN Peaks AS P ON M.ID=P.MountainId) AS K
WHERE K.RANKED=1
ORDER BY CountryName, PeakName;