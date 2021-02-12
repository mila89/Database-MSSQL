select FirstName,LastName, FORMAT(a.BirthDate,'MM-dd-yyyy') as [BirthDate], C.NAME AS [Hometown], A.Email
FROM Accounts AS A
JOIN Cities AS C ON A.CityId=C.ID
WHERE SUBSTRING(A.Email,1,1)='e'
ORDER BY C.NAME