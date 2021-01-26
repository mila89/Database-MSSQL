SELECT E.EmployeeID, E.FirstName, E.LastName, D.Name 
FROM Employees AS e
JOIN Departments AS d
ON E.DepartmentID=D.DepartmentID
WHERE D.Name='Sales'
ORDER BY EmployeeID;