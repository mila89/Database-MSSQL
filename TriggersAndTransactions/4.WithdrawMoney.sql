CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount DECIMAL(15,4))
AS
BEGIN TRANSACTION
	DECLARE @ACCOUNT INT=(SELECT ID FROM Accounts WHERE ID=@AccountId)
	if @Account is null
	begin
		ROLLBACK;
		RAISERROR('Invalid account id',16,1)
		RETURN
	end
	IF @MoneyAmount<0
	BEGIN
		ROLLBACK;
		RAISERROR('The amount shoud be possitive!',16,1)
		RETURN
	END
	UPDATE Accounts
	SET Balance-=@MoneyAmount
	WHERE Id=@Account
	COMMIT
GO 