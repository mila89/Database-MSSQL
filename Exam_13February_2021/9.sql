SELECT TOP(5)RES.Id, RES.Name , COUNT(*) AS[Commits] FROM (
	SELECT R.ID,R.NAME FROM RepositoriesContributors  AS RC
	JOIN Repositories AS R ON RC.RepositoryId=R.ID
	JOIN Commits AS C ON R.Id=C.RepositoryId) AS RES
GROUP BY RES.Id, RES.Name
ORDER BY [Commits] DESC, RES.ID, RES.NAME