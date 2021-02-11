SELECT M.FirstName+' '+M.LastName AS[Available] FROM Mechanics AS M
	LEFT JOIN Jobs AS J ON J.MechanicId=M.MechanicId
	WHERE JobId IS NULL OR (SELECT COUNT(JobId) 
							FROM Jobs 
							WHERE [STATUS]<>'Finished' and MechanicId=m.MechanicId
							GROUP BY MechanicId, [STATUS]) IS NULL
GROUP BY M.MechanicId, (M.FirstName+' '+M.LastName )


