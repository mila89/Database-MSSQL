CREATE PROC usp_AssignProject(@emloyeeId INT, @projectID INT)
AS
BEGIN TRANSACTION
	@ProjectsNum int=(SELECT COUNT(*) FROM EmployeesProjects WHERE EmployeeID=@emloyeeId)
	if (@ProjectsNum >3)
		BEGIN
		 ROLLBACK
		 RAISERROR('The employee has too many projects!',16,1)
		 RETURN
		END
	INSERT INTO EmployeesProjects(EmployeeId, ProjectId)
	VALUES (@emloyeeId,@projectID)
	COMMIT
GO 

SELECT * FROM EmployeesProjects