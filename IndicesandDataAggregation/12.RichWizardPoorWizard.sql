SELECT sum(f.Differenc) FROM
	(SELECT Host.FirstName AS [Host Wizzard], Host.DepositAmount as [Host Wizard Deposit], Guest.FirstName as [Guest Wizard Deposit], 
	Host.DepositAmount-Guest.DepositAmount AS [Differenc]
	FROM WizzardDeposits AS [Host]
	LEFT JOIN WizzardDeposits AS [Guest] ON Host.Id=Guest.Id-1) as F;


