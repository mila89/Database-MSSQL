CREATE TABLE NotificationEmails(
Id INT PRIMARY KEY IDENTITY,
Recipient INT FOREIGN KEY REFERENCES ACCOUNTS(ID),
[Subject] VARCHAR(50),
Body VARCHAR(MAX)
)


CREATE TRIGGER TR_OnNewRecordInserted 
ON LOGS FOR INSERT
AS
	DECLARE @ACCOUNTID INT=(SELECT AccountID FROM inserted)
	DECLARE @OLDSUM DECIMAL(15,2)= (SELECT TOP(1)OldSum FROM inserted )
	DECLARE @NEWSUM DECIMAL(15,2)= (SELECT TOP(1)NewSum FROM inserted )

	INSERT INTO NotificationEmails(Recipient,[Subject], Body)
	VALUES
	(@ACCOUNTID, 
	'Balance change for account: '+ CAST(@ACCOUNTID AS VARCHAR(20)),
	'On ' + CAST(GETDATE() AS VARCHAR(20))+ ' your balance was changed from '+CAST(@OLDSUM AS VARCHAR(20))
	+' to'+ CAST(@NEWSUM AS VARCHAR(20)))
GO

SELECT * FROM Accounts WHERE Accounts.Id=1

UPDATE AccountS 
SET Balance+=100
WHERE Id=1

SELECT * FROM NotificationEmails