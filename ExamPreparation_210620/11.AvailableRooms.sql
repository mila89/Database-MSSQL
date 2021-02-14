CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS VARCHAR(200)
AS
BEGIN
		DECLARE @RESULT VARCHAR(200)
		DECLARE @MaxRoomPrice decimal(15,2)=
		(SELECT MAX(R.Price) FROM ROOMS AS R
		JOIN Trips AS T ON R.Id=T.RoomId
		WHERE R.HotelId=@HotelId AND R.Beds>=@People AND T.CANCELDATE IS NULL AND (@Date NOT BETWEEN t.Arrivaldate AND t.ReturnDate))
		
		DECLARE @RoomId int=
		(SELECT r.Id FROM ROOMS AS R
		WHERE R.HotelId=@HotelId AND R.Price=@MaxRoomPrice)

		DECLARE @RoomType varchar(20)=(SELECT [Type] FROM ROOMS WHERE Id=@RoomId)
		DECLARE @HotelPrice DECIMAL(15,2)=(SELECT BaseRate FROM Hotels WHERE ID=@HotelId)
		DECLARE @PRICE DECIMAL(15,2)=(@MAXROOMPRICE+@HotelPrice)*@People
		DECLARE @BEDS INT =(SELECT Beds FROM Rooms WHERE ID=@RoomId)

		IF (@ROOMID IS NULL)
			SET @RESULT= 'No rooms available'
		ELSE
			SET @RESULT= CONCAT('Room ',cast(@RoomId as varchar(8)),': ',@Roomtype, ' (', 
				cast(@beds as varchar(15)),' beds)', ' - $',cast(@Price as varchar(10)))
		RETURN @RESULT
END

SELECT dbo.udf_GetAvailableRoom(112, '2011-12-17', 2)