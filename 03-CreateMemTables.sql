USE FlowerStore
GO
--Create memory based tables
CREATE TABLE mFlower
(
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
	FlowerName VARCHAR(30) NOT NULL,
	UnitPrice DECIMAL(4, 2) NOT NULL
)
WITH 
(
	MEMORY_OPTIMIZED = ON,
	DURABILITY = SCHEMA_AND_DATA
);

INSERT INTO mFlower VALUES
('Rose',		1.50),
('Hialeah',		1.25),
('Lilly',		0.75),
('Poinciana',	0.50),
('Daisy',		0.25);

CREATE TABLE mSale
(
	Id INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
	SaleDate DATETIME NOT NULL DEFAULT GETDATE()
)
WITH 
(
	MEMORY_OPTIMIZED = ON,
	DURABILITY = SCHEMA_AND_DATA
);;

CREATE TABLE mLineItem
(
	Id INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
	SaleId INT NOT NULL,
	FlowerId INT NOT NULL,
	Quantity INT NOT NULL,
	CONSTRAINT FK_mSale FOREIGN KEY (SaleId) REFERENCES mSale(Id),
	CONSTRAINT FK_mFlower FOREIGN KEY (FlowerId) REFERENCES mFlower(Id)
)
WITH 
(
	MEMORY_OPTIMIZED = ON,
	DURABILITY = SCHEMA_AND_DATA
);

-- Adding Sales Data
INSERT INTO mSale VALUES
(GETDATE()),
(DATEADD(DD, -1, GETDATE())),
(DATEADD(DD, -2, GETDATE())),
(DATEADD(DD, -3, GETDATE())),
(DATEADD(DD, -4, GETDATE())),
(DATEADD(DD, -5, GETDATE()));

INSERT INTO mSale VALUES
(GETDATE()),
(DATEADD(MM, -1, GETDATE())),
(DATEADD(MM, -2, GETDATE())),
(DATEADD(MM, -3, GETDATE())),
(DATEADD(MM, -4, GETDATE())),
(DATEADD(MM, -5, GETDATE()));