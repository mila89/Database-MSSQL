CREATE PROC usp_GetHoldersWithBalanceHigherThan(@AMOUNT DECIMAL(12,2))
AS
SELECT RESULT.FirstName,RESULT.LastName FROM
	(SELECT AH.FirstName,AH.LastName,
		(SELECT SUM(Balance) FROM Accounts AS A
		WHERE AH.Id=A.AccountHolderId) S
	FROM ACCOUNTHOLDERS AS AH) AS RESULT
WHERE RESULT.S>@AMOUNT
ORDER BY RESULT.FirstName,RESULT.LastName

EXEC usp_GetHoldersWithBalanceHigherThan 500000