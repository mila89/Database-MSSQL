SELECT SUBSTRING(FirstName,1,1)AS [FirstLatter]
FROM WizzardDeposits
WHERE WizzardDeposits.DepositGroup='Troll Chest'
GROUP BY SUBSTRING(FirstName,1,1) 
ORDER BY FirstLatter