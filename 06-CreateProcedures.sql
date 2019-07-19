USE FlowerStore
GO

CREATE PROCEDURE dbo.makeLotsOfRecords
	@Iterations BIGINT
AS
	SET NOCOUNT ON
	DECLARE @i BIGINT = 0
	DECLARE @SaleHigh INT = (SELECT TOP(1) Id FROM dbo.Sale ORDER BY Id DESC)
	DECLARE @SaleLow INT = (SELECT TOP(1) id FROM dbo.Sale)
	DECLARE @FlowerHigh INT = (SELECT TOP(1) Id FROM dbo.Flower ORDER BY Id DESC)
	DECLARE @FlowerLow INT = (SELECT TOP(1) Id FROM dbo.Flower)
	WHILE @i < @Iterations
	BEGIN
		INSERT INTO dbo.LineItem
		SELECT
			FLOOR(RAND()*(@SaleHigh-@SaleLow+1))+@SaleLow,
			FLOOR(RAND()*(@FlowerHigh-@FlowerLow+1))+@FlowerLow,
			FLOOR(RAND()*(20-2+1))+2;
		SET @i = @i + 1
	END
GO

CREATE PROCEDURE dbo.makeLotsOfRecordsMEM
	@Iterations BIGINT
	WITH
		NATIVE_COMPILATION,
		SCHEMABINDING
AS

	BEGIN ATOMIC
	WITH
		(TRANSACTION ISOLATION LEVEL = SNAPSHOT,
		LANGUAGE = N'us_english')
	DECLARE @i BIGINT = 0
	DECLARE @SaleHigh INT = (SELECT TOP(1) Id FROM dbo.mSale ORDER BY Id DESC)
	DECLARE @SaleLow INT = (SELECT TOP(1) Id FROM dbo.mSale)
	DECLARE @FlowerHigh INT = (SELECT TOP(1) Id FROM dbo.mFlower ORDER BY Id DESC)
	DECLARE @FlowerLow INT = (SELECT TOP(1) Id FROM dbo.mFlower)
	WHILE @i < @Iterations
	BEGIN
		INSERT INTO dbo.mLineItem
		SELECT
			FLOOR(RAND()*(@SaleHigh-@SaleLow+1))+@SaleLow,
			FLOOR(RAND()*(@FlowerHigh-@FlowerLow+1))+@FlowerLow,
			FLOOR(RAND()*(20-2+1))+2;
		SET @i = @i + 1
	END	
END
GO