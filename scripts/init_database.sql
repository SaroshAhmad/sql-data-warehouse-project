/*
================================================================================
Script:      init_database.sql
Purpose:     Initialises the DataWarehouse database and its Medallion layers.

Description: Drops the 'DataWarehouse' database if it already exists, recreates
             it, and sets up the three schemas used throughout the project:

               bronze  - raw data landed as-is from the source systems
               silver  - cleansed, standardised and integrated data
               gold    - business-ready star schema for reporting

Usage:       Run once at the start of the project, or whenever a clean rebuild
             of the warehouse is needed. Every subsequent load script assumes
             these schemas exist.

WARNING:     This script is destructive. It permanently drops the existing
             'DataWarehouse' database and everything in it. Take a backup
             before running it on anything you care about.
================================================================================
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
