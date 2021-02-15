CREATE PROC usp_ChangeJourneyPurpose(@JourneyId INT, @NewPurpose VARCHAR(11))
AS
BEGIN TRANSACTION
	
	IF((SELECT COUNT(*) FROM Journeys WHERE ID=@JourneyId)=0)
	BEGIN
		ROLLBACK;
		THROW 50001,'The journey does not exist!',1
		RETURN
	END
	DECLARE @OldPurpOse VARCHAR(11)=(select Purpose from Journeys where id=@JourneyId)
	if (@OldPurpOse=@NewPurpose)
	BEGIN
		ROLLBACK;
		THROW 50002,'You cannot change the purpose!',1
		RETURN
	END
	UPDATE Journeys 
	SET Purpose=@NewPurpose WHERE ID=@JourneyId
	COMMIT

	EXEC usp_ChangeJourneyPurpose 4, 'Technical'
	EXEC usp_ChangeJourneyPurpose 2, 'Educational'
	EXEC usp_ChangeJourneyPurpose 196, 'Technical'

	SELECT * FROM Journeys WHERE ID=196