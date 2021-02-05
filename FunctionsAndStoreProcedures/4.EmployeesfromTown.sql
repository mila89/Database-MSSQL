CREATE PROC usp_GetEmployeesFromTown(@TOWN VARCHAR(20))
AS
	SELECT E.FirstName,E.LastName FROM Employees AS E
	JOIN Addresses AS A ON E.AddressID=A.AddressID
	JOIN Towns AS T ON A.TownID=T.TownID
	WHERE T.Name=@TOWN
GO

EXEC usp_GetEmployeesFromTown 'Sofia'