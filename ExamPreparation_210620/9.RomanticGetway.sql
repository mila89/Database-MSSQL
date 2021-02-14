SELECT S.ID,S.EMAIL, S.NAME, COUNT(S.NAME) AS [Trips] FROM
	(SELECT A.ID, A.EMAIL, C.NAME FROM ACCOUNTS AS A
	JOIN AccountsTrips AS AT ON A.Id=AT.AccountId
	JOIN Trips AS T ON AT.TripId=T.Id
	JOIN Rooms AS R ON T.ROOMID=R.ID
	JOIN HOTELS AS H ON R.HotelId=H.Id
	JOIN Cities AS C ON A.CityId=C.ID
	WHERE A.CITYID=H.CityId) AS S
GROUP BY S.ID, S.EMAIL, S.NAME
order BY Trips DESC, S.Id