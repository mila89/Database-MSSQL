--Count all colonists that are on technical journey. 
--Required Columns
--•	Count

select count(tc.ColonistId) from travelcards as Tc
JOIN Journeys as j on tc.JourneyId=j.Id
WHERE J.PURPOSE='Technical'