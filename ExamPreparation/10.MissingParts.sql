SELECT	p.PartId,
		p.Description,
		pn.Quantity as [Required], 
		p.StockQty as [In Stock], 
		IIF(O.DELIVERED=0,OP.Quantity,0 )
		FROM Parts AS P
LEFT JOIN PartsNeeded AS PN ON P.PartId=PN.PartId
LEFT join ORDERPARTS AS OP ON OP.PartId=P.PartId
LEFT JOIN Jobs AS J ON J.JobId=PN.JobId
LEFT JOIN Orders AS O ON O.JobId=J.JobId
WHERE J.Status!='Finished' AND p.StockQty+ IIF(O.Delivered	=0, OP.Quantity,0)<PN.Quantity
ORDER BY PartId
