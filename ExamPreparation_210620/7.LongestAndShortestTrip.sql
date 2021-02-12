SELECT B.ID, B.FullName, MAX(B.DAYS) AS [LongestTrip], MIN(B.DAYS) AS [ShortestTrip] FROM
(	SELECT A.Id, A.FirstName+' '+ A.LASTNAME AS [FullName], datediff(day,t.ArrivalDate,t.ReturnDate) AS [DAYS]
	FROM ACCOUNTS AS A
	JOIN AccountsTrips AS AT ON AT.AccountId=A.Id
	JOIN Trips AS T ON AT.TripId=T.Id
	WHERE A.MiddleName IS NULL AND T.CancelDate IS NULL) AS B
GROUP BY B.Id, B.FullName
ORDER BY [LongestTrip] DESC, [ShortestTrip]
