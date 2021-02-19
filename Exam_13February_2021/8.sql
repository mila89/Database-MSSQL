SELECT F1.Id, F1.Name, (CAST(F1.Size AS VARCHAR(12)) + 'KB')  AS [Size] FROM Files AS F1
LEFT JOIN Files AS F2 ON F2.ParentId=F1.Id
WHERE F2.ParentId IS NULL