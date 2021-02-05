--Select all employees who have salary higher than the average salary of their respective departments. 
--Select only the first 10 rows. Order by DepartmentID.

SELECT TOP(10) EMP.FirstName, EMP.LastName, EMP.DepartmentID
FROM Employees EMP
WHERE Salary>(
				SELECT AVG(SALARY) FROM Employees
				WHERE EMP.DepartmentID=DepartmentID
				GROUP BY DepartmentID)
ORDER BY DepartmentID;

