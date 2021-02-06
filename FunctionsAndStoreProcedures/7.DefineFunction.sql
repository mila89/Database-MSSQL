CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE @IND INT=1
	DECLARE @INS INT=1
	DECLARE @RESULT BIT=1
	DECLARE @RES BIT=0
	WHILE (@IND<=DATALENGTH(@WORD))
	BEGIN
		SET @INS=1
		WHILE (@INS<=DATALENGTH(@setOfLetters))
			BEGIN
				IF (SUBSTRING(@WORD,@IND,1)=SUBSTRING(@setOfLetters,@INS,1))
					BEGIN
						SET @RES=1
						BREAK
					END
				SET @INS=@INS+1
			END
		SET @RESULT=@RES
		IF (@RESULT=0)
			BREAK
		SET @RES=0
		SET @IND=@IND+1
	END
	return @RESULT
END

select dbo.ufn_IsWordComprised('oistmiahf', 'halves')