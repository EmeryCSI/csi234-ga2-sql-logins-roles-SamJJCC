-- Create a new schema
-- A schema is a logical container for database objects like tables, views, and stored procedures
-- It helps in organizing database objects and can be used for access control
CREATE SCHEMA GA1;
GO

-- Create a sample table in the new schema
-- This table will store employee information
CREATE TABLE GA1.EmployeeData (
    EmployeeID INT PRIMARY KEY,  -- Unique identifier for each employee
    FirstName NVARCHAR(50),      -- First name of the employee
    LastName NVARCHAR(50),       -- Last name of the employee
    Salary DECIMAL(10, 2),       -- Employee's salary (allows for 2 decimal places)
    Department NVARCHAR(50)      -- Department where the employee works
);
GO

-- Insert some sample data into the EmployeeData table
-- This data will be used to test our permissions later
INSERT INTO GA1.EmployeeData (EmployeeID, FirstName, LastName, Salary, Department)
VALUES 
(1, 'John', 'Doe', 50000.00, 'Sales'),
(2, 'Jane', 'Smith', 60000.00, 'HR'),
(3, 'Bob', 'Johnson', 55000.00, 'IT'),
(4, 'Alice', 'Williams', 65000.00, 'Finance');
GO



-- Create logins. Logins are created on the SERVER level in the master database
-- Be sure you run this code ON MASTER
-- A login is a security principal at the server level that allows connection to the SQL Server instance
CREATE LOGIN HRManager WITH PASSWORD = 'HRPass123!';
CREATE LOGIN SalesRep WITH PASSWORD = 'SalesPass123!';
CREATE LOGIN ITSupport WITH PASSWORD = 'ITPass123!';
GO

-- Verify that the logins were created
SELECT *
FROM sys.sql_logins


-- Create users for the logins
-- A user is a security principal at the database level
-- Switch back to AdventureWorksLT before running this Query
-- Users are mapped to logins and are used to control access to database objects
CREATE USER HRManagerUser FOR LOGIN HRManager;
CREATE USER SalesRepUser FOR LOGIN SalesRep;
CREATE USER ITSupportUser FOR LOGIN ITSupport;
GO

-- Verify that the users were created
SELECT *
FROM sys.database_principals

-- The difference between a login and a user:
-- Login: Server-level principal, used for authentication (connecting to the server)
-- User: Database-level principal, used for authorization (accessing objects within a database)

