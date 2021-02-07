CREATE FUNCTION ufn_CashInUsersGames(@GAMENAME VARCHAR(50))
RETURNS TABLE AS
RETURN
( 
	SELECT SUM(SUB.Cash) AS [SumCash] FROM
		(SELECT S.CASH, ROW_NUMBER() OVER(PARTITION BY S.NAME ORDER BY CASH DESC) AS RANKED FROM
			(SELECT UG.Cash,G.Name FROM UsersGames UG
			JOIN Games AS G ON G.Id=UG.GameId
			WHERE G.Name=@GAMENAME
			) AS S
			) AS SUB
	WHERE SUB.RANKED %2=1
)

select * from dbo.ufn_CashInUsersGames('Love in a mist')
