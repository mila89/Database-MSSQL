SELECT top(1)
(SELECT AVG(Salary) FROM Employees AS E WHERE E.DepartmentID=D.DepartmentID ) 
AS [MinAverageSalary]
 FROM Departments AS D
ORDER BY MinAverageSalary;

