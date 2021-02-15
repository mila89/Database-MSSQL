--Find all colonists and their job during journey with rank 2. Keep in mind that all the selected colonists 
--with rank 2 must be the oldest ones. You can use ranking over their job during their journey.
--Required Columns
--•	JobDuringJourney
--•	FullName
--•	JobRank

select * from
	(seLECT TC.JobDuringJourney, C.FirstName + ' '+ C.LastName AS [FullName],
	DENSE_RANK() OVER (PARTITION BY JobDuringJourney order by birthdate) as [JobRank]
	FROM COLONISTS AS C
	JOIN TravelCards AS TC ON C.Id=TC.ColonistId) as R
where r.JobRank=2
