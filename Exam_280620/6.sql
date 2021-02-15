SELECT C.ID, C.FIRSTNAME + ' '+ C.LastName AS [full_name] FROM Colonists AS C
JOIN travelcards as TC
ON C.ID=TC.ColonistId
where TC.JobDuringJourney='Pilot'
order by c.Id