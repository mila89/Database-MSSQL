SELECT MC.CountryCode, COUNT(MC.MountainId) 
FROM MountainsCountries AS MC
WHERE MC.CountryCode IN ('US', 'RU', 'BG')
GROUP BY MC.CountryCode;

