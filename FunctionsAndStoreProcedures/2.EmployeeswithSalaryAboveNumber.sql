CREATE OR ALTER PROC usp_GetEmployeesSalaryAboveNumber
			(@SALARY DECIMAL(18,4)) 
AS
	SELECT FirstName,LastName FROM Employees
	WHERE Salary>=@SALARY

GO

EXEC usp_GetEmployeesSalaryAboveNumber 70000;