SELECT  T.Id, 
		 IIF(A.MiddleName IS NULL,  A.FirstName + ' '+ A.LastName ,
			 A.FirstName + ' ' +A.MiddleName + ' '+ A.LastName) AS [Full Name], 
		(select c.name where c.id=A.CITYID) as [From], 
		(select cH.NAME where cH.ID=h.CityId) as [To],
		IIF(t.CancelDate is null,cast(DATEDIFF(DAY,T.ARRIVALDATE,T.RETURNDATE) as varchar(20))+' days', 'Canceled') AS [Duration]
FROM Trips AS T 
JOIN AccountsTrips AS AT ON T.Id=AT.TripId
 JOIN Accounts AS A ON AT.AccountId=A.Id
JOIN Cities AS C ON A.CityId=C.ID
JOIN ROOMS AS R ON T.RoomId=R.Id
JOIN Hotels AS H ON R.HotelId=H.ID
JOIN CITIES AS CH ON H.CityId=CH.ID
ORDER BY [Full Name], t.Id

