CREATE PROC usp_CalculateFutureValueForAccount(@ACCOUNT INT, @RATE FLOAT)
AS
	SELECT AC.ID, AH.FirstName , 
	AH.LastName , AC.Balance ,
	dbo.ufn_CalculateFutureValue(AC.BALANCE,@RATE,5)
	FROM AccountHolders AS AH
	JOIN Accounts AS AC ON AH.Id=AC.AccountHolderId
	WHERE AC.Id=@ACCOUNT
GO

EXEC usp_CalculateFutureValueForAccount 1,0.1



