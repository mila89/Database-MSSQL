SELECT * INTO MyNewt
FROM Employees 
WHERE Salary>30000

DELETE FROM MyNewt 
WHERE ManagerID=42

UPDATE MyNewt
SET SALARY=SALARY+5000
WHERE DepartmentID=1

SELECT DepartmentID, AVG(Salary) AS [AverageSalary]
FROM MyNewT
GROUP BY DepartmentID