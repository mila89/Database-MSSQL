SELECT e.EmployeeID, e.FirstName FROM Employees AS E
left outer join EmployeesProjects AS EP
ON e.EmployeeID=ep.EmployeeID
where ep.EmployeeID is null
ORDER BY E.EmployeeID
OFFSET  0 ROWS
FETCH FIRST 3 ROWS ONLY;