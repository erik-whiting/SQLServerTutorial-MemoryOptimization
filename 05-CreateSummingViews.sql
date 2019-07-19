USE FlowerStore
GO

CREATE VIEW vOrderTotal AS
SELECT 
	sl.Id, 
	sl.SaleDate, 
	SUM(sl.LineItemPrice) AS SaleTotal
FROM vSumLines sl
GROUP BY sl.Id, sl.SaleDate
GO

CREATE VIEW vmOrderTotal AS
SELECT 
	sl.Id, 
	sl.SaleDate, 
	SUM(sl.LineItemPrice) AS SaleTotal
FROM vmSumLines sl
GROUP BY sl.Id, sl.SaleDate
GO