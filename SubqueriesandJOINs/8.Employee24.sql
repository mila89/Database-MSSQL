SELECT e.EmployeeID, E.FirstName, 
CASE 
	WHEN DATEPART(YEAR,P.StartDate)<2005 THEN P.Name
	ELSE NULL
END AS [ProjectName]
FROM Employees AS e
JOIN EmployeesProjects AS ep
ON E.EmployeeID=ep.EmployeeID
JOIN Projects AS p
ON P.ProjectID=EP.ProjectID
WHERE E.EmployeeID=24;
