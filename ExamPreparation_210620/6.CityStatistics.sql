
SELECT c.NAME, COUNT(*)as[Hotels] FROM Cities AS C
JOIN Hotels AS H ON C.ID=H.CityId
GROUP BY H.CityId,c.NAME
having COUNT(*)>0
ORDER BY COUNT(*) DESC, C.NAME

