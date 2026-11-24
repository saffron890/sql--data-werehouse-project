/*
=============================================================
Create Database and Schemas
=============================================================
Purpose:
    Sets up the DataWarehouse database for my data warehouse project.
    If a DataWarehouse database already exists, it gets dropped first,
    then recreated from scratch. After that it adds three schemas:
    bronze, silver and gold (raw data, cleaned data, and
    reporting-ready data).

WARNING:
    DO NOT RUN THIS unless you're happy to lose everything.
    It permanently deletes the whole DataWarehouse database and all of
    its data if it already exists. There's no undo, so back up
    anything you need first.
*/

USE master;
GO

-- Drop the database if it already exists, then recreate it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create the three layers
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
