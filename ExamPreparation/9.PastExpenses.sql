SELECT RES.JobId,ISNULL(sum(RES.Total),0) as[Total] FROM
	(SELECT J.JobId, OP.Quantity*P.Price as[Total] FROM Jobs AS J
	LEFT JOIN Orders AS O ON J.JobId=O.JobId
	LEFT JOIN OrderParts AS OP ON O.OrderId=OP.OrderId
	LEFT JOIN Parts AS P ON OP.PartId=P.PartId
	WHERE J.Status='Finished') RES
GROUP BY RES.JobId
ORDER BY Total DESC, JobId