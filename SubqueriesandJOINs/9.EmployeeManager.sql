SELECT E.EmployeeID, E.FirstName, E.ManagerID, emp.FirstName
FROM Employees AS E
JOIN Employees AS emp
ON E.ManagerID=emp.EmployeeID
WHERE E.ManagerID IN (3,7)
ORDER BY E.EmployeeID;
