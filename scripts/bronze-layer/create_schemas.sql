--- in this query we make 3 schemas bronze, silver, gold ----
USE master;
GO


-- Create the 'DataWarehouse' database
DROP DATABASE IF EXISTS DataWarehouse;
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
