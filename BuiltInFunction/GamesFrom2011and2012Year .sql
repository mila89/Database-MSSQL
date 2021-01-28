SELECT TOP(50) Name, (FORMAT(START,'yyyy-MM-dd')) AS Start  FROM Games
WHERE Start>='2011-01-01' AND Start<'2013-01-01'
ORDER BY Start, Name;
