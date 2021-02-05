CREATE PROC usp_GetTownsStartingWith(@START VARCHAR(10))
AS
	SELECT Name AS [Towns] FROM Towns 
	WHERE SUBSTRING(Name,1,DATALENGTH(@START))=@START

	GO

EXEC usp_GetTownsStartingWith 'RED'