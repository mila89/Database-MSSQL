SELECT c.firstName + ' '+ c.LastName as [Client], 
	DATEDIFF(DAY,j.issueDate,'2017-04-24') as [Days going], 
	j.Status
FROM JOBS AS J
JOIN Clients AS C ON J.ClientId=C.ClientId
WHERE J.Status!='Finished'
ORDER BY [Days going] DESC, C.ClientId