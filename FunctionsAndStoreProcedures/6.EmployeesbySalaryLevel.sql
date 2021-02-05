CREATE PROC usp_EmployeesBySalaryLevel(@SLEVEL VARCHAR(10))
AS
	SELECT FirstName, LastName FROM Employees
	WHERE DBO.ufn_GetSalaryLevel(SALARY)=@SLEVEL

GO

EXEC usp_EmployeesBySalaryLev 'High' 

