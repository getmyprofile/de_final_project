
# This script creates the 'Employees' table and loads the data for the same.

# Query to create 'Employees' table
tbl_employee <- "CREATE TABLE [Employees](
	[EmployeeID] [integer] PRIMARY KEY AUTOINCREMENT,
	[FirstName] [nvarchar](40) NOT NULL,
	[MiddleInitial] [nvarchar](40) NULL,
	[LastName] [nvarchar](40) NOT NULL
);"

# Use dbExecute() for SQL statements that do not return a table
dbExecute(con, tbl_employee)

data_employee <- "INSERT INTO Employees (FirstName, MiddleInitial, LastName)
VALUES
('Abraham','e','Bennet'),
('Reginald','l','Blotchet-Halls'),
('Cheryl','a','Carson'),
('Michel','e','DeFrance'),
('Innes','e','del Castillo'),
('Ann','u','Dull'),
('Marjorie','r','Green'),
('Morningstar','r','Greene'),
('Burt','r','Gringlesby'),
('Sheryl','u','Hunter'),
('Livia','a','Karsen'),
('Charlene','o','Locksley'),
('Stearns','a','MacFeather'),
('Heather','c','McBadden'),
('Michael',' ','O-Leary'),
('Sylvia','a','Panteley'),
('Albert','i','Ringer'),
('Anne','i','Ringer'),
('Meander','m','Smith'),
('Dean','t','Straight'),
('Dirk','t','Stringer'),
('Johnson','h','White'),
('Akiko','o','Yokomoto');"

# Use dbExecute() for SQL statements that do not return a table
dbExecute(con, data_employee)
