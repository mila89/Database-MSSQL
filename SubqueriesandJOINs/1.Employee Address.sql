select top(5) EmployeeID, JobTitle, e.AddressID, a.AddressText
 from Employees as e
 INNER JOIN Addresses AS a
 ON e.addressID=a.AddressID
 order by e.AddressID;