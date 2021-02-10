SELECT M.Firstname + ' '+ m.LastName as [Mechanic], AVG(DATEDIFF(DAY,J.IssueDate,J.FinishDate)) 
FROM Jobs AS J
JOIN Mechanics AS M ON J.MechanicId=M.MECHANICID
GROUP BY J.MechanicId, m.FirstName, m.LastName