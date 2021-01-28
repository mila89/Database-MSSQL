SELECT Orders.ProductName, Orders.OrderDate, 
DATEADD(DAY,3,OrderDate) AS [Pay Due],
DATEADD(MONTH,1,OrderDate) AS [Delivery Date]
FROM ORDERS;