Create table Logs (
LogId int primary key IDENTITY,
AccountId INT FOREIGN KEY REFERENCES ACCOUNTS,
OldSum MONEY NOT NULL,
NewSum MONEY NOT NULL)

CREATE TRIGGER tr_OnAccountChanges
ON Accounts FOR UPDATE
AS
	INSERT INTO Logs(AccountId, OldSum, NewSum)
	SELECT I.Id, D.Balance, I.Balance FROM inserted AS I
	JOIN deleted AS D ON I.Id=D.Id	
	WHERE I.Balance!=D.Balance
GO