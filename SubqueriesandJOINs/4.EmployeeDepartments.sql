SELECT E.EmployeeID, E.FirstName, E.Salary, D.Name AS [DepartmentName]
FROM Employees AS E
JOIN Departments AS D
ON D.DepartmentID=E.DepartmentID
WHERE E.Salary>15000
ORDER BY D.DepartmentID
OFFSET  0 ROWS
FETCH FIRST 5 ROWS ONLY;
