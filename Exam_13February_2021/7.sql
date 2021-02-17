SELECT I.ID,U.Username+' : '+ I.TITLE FROM ISSUES AS I
JOIN Users AS U ON I.AssigneeId=U.Id 
ORDER BY I.ID DESC, I.AssigneeId