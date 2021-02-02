SELECT TOP(2) DepositGroup from
	(select DepositGroup, AVG(MagicWandSize) AS M
FROM WizzardDeposits
GROUP BY DepositGroup) as d
ORDER BY d.m;

