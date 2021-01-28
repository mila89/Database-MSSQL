SELECT NAME, People.Birthdate, 
DATEDIFF(YEAR, People.Birthdate,GETDATE()) AS [Age in Years]
FROM People;