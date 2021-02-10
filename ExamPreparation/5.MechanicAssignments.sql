SELECT M.FirstName + ' ' + M.LastName AS [Mechanic], J.Status, J.IssueDate FROM MECHANICS AS M
JOIN JOBS AS J ON M.MechanicId=J.MechanicId
ORDER BY M.MechanicId, IssueDate,j.JobId
