SELECT ContinentCode, CurrencyCode, CurrencyUsage FROM 
	(SELECT C.ContinentCode, C.CurrencyCode, COUNT(C.CurrencyCode) AS [CurrencyUsage],
		DENSE_RANK() OVER (PARTITION BY ContinentCode ORDER BY COUNT(CurrencyCode) DESC) as RANKED
	FROM Countries AS C
	GROUP BY C.ContinentCode, C.CurrencyCode) AS K
	WHERE RANKED=1 AND CurrencyUsage>1
	ORDER BY ContinentCode ;

