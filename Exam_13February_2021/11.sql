CREATE FUNCTION udf_AllUserCommits(@username VARCHAR(30)) 
RETURNS INT
AS
BEGIN
	RETURN (SELECT COUNT(*) FROM COMMITS AS C 
	JOIN USERS AS U ON C.ContributorId=U.Id 
	WHERE U.Username=@username)
END;