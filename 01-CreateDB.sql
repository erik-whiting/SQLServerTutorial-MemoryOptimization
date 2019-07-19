USE MASTER
GO
-- Make Database
CREATE DATABASE FlowerStore
ON
(
	NAME = flowerstore_data,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\flowerstore.mdf',
	SIZE = 10,
	MAXSIZE = 50,
	FILEGROWTH = 5
)
LOG ON
(
	NAME = flowerstore_log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\flowerstorelog.ldf',
	SIZE = 5MB,
	MAXSIZE = 25MB,
	FILEGROWTH = 5MB
)
GO

-- Make Database compatible with memory optimized objects
ALTER DATABASE FlowerStore SET COMPATIBILITY_LEVEL = 130;
ALTER DATABASE FlowerStore SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON;

-- Add filegroup for memory optimized data
ALTER DATABASE FlowerStore ADD FILEGROUP fs_mem CONTAINS MEMORY_OPTIMIZED_DATA;
ALTER DATABASE FlowerStore ADD FILE (
	NAME = fs_mem_file, 
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\fs_mem'
) TO FILEGROUP fs_mem

