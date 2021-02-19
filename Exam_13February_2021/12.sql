CREATE PROC usp_SearchForFiles(@fileExtension VARCHAR(10))
AS
BEGIN TRANSACTION
	DECLARE @REFL VARCHAR(10)='%'+@fileExtension
	SELECT Id, Name,CAST(Size AS varchar(20))+'KB' AS [Size] FROM FILES 
	WHERE Name LIKE @REFL
	COMMIT
