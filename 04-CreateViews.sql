USE FlowerStore
GO

CREATE VIEW vSumLines AS
SELECT
	s.Id,
	s.SaleDate,
	f.FlowerName,
	f.UnitPrice * li.Quantity AS 'LineItemPrice'
FROM Sale s
INNER JOIN LineItem li
ON s.Id = li.SaleId
INNER JOIN Flower f
ON f.Id = li.FlowerId;
GO

CREATE VIEW vmSumLines AS
SELECT
	s.Id,
	s.SaleDate,
	f.FlowerName,
	f.UnitPrice * li.Quantity AS 'LineItemPrice'
FROM mSale s
INNER JOIN mLineItem li
ON s.Id = li.SaleId
INNER JOIN mFlower f
ON f.Id = li.FlowerId;
GO