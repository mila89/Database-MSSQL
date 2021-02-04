--Find the third highest salary in each department if there is such. 
SELECT DISTINCT E.DepartmentID, E.Salary FROM
	(SELECT DepartmentID, SALARY, DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY SALARY desc) 
	AS RANKED
	FROM Employees ) AS E
WHERE RANKED=3


