SELECT top(10) s.ID, s.NAME,s.Country, COUNT(*) AS [Accounts] FROM
	(SELECT C.ID, C.NAME, C.CountryCode AS[Country] FROM CITIES AS C
     JOIN Accounts AS A ON C.ID=A.CityId) AS S
GROUP BY S.ID, S.NAME,S.Country 
order BY Accounts DESC
