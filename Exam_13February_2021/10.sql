SELECT RES.Username, AVG(RES.Size) AS [Size] FROM (
	SELECT U.Username, F.SIZE FROM USERS AS U
	JOIN Commits AS C ON U.Id=C.ContributorId
	JOIN Files AS F ON C.ID=F.CommitId) as RES
GROUP BY RES.Username
ORDER BY Size DESC, RES.USERNAME


