CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount DECIMAL(15,4))
AS
BEGIN TRANSACTION
	EXEC usp_WithdrawMoney @SenderiD, @Amount;
	EXEC usp_DepositMoney @ReceiverId,@Amount;
	commit
GO

EXEC usp_TransferMoney 2,1,1000
SELECT * FROM Accounts 
