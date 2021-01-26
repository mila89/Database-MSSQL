SELECT TOP(50) FirstName,LastName, t.Name as [Town], a.AddressText FROM Employees AS E
JOIN Addresses AS a
ON a.AddressID=e.AddressID
JOIN Towns AS t
ON t.TownID=a.TownID
ORDER BY e.FirstName, E.LastName;