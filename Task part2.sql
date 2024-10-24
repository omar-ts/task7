CREATE DATABASE part2
--Data Definition Questions: (using SQL NOT GUI)--
--1.	Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).--
CREATE TABLE Employees(
ID int,
Name varchar(50),
Salary decimal
);

--2.	Add a new column named "Department" to the "Employees" table with data type varchar(50).--
ALTER TABLE Employees
ADD Departement varchar(50)

--3.	Remove the "Salary" column from the "Employees" table.--
ALTER TABLE Employees
DROP COLUMN Salary

--4.	Rename the "Department" column in the "Employees" table to "DeptName".--
EXEC sp_rename 'Employees.Departement',  'DeptName';

--5.	Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).--
CREATE TABLE Projects(
ProjectID int,
ProjectName varchar
);
ALTER TABLE Projects
ALTER COLUMN ProjectID int not null

ALTER TABLE Projects
ADD PRIMARY KEY(ProjectID)

--6.	Add a primary key constraint to the "Employees" table for the "ID" column.--
ALTER TABLE Employees
ALTER COLUMN ID int not null

ALTER TABLE Employees
ADD PRIMARY KEY(ID)

--7.	Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").--
ALTER TABLE Projects
ADD project_employee int

ALTER TABLE Projects
ADD CONSTRAINT fk_project_employee FOREIGN KEY(project_employee) REFERENCES Employees(ID)

--8.	Remove the foreign key relationship between "Employees" and "Projects."--
ALTER TABLE Projects
DROP fk_project_employee

--9.	Add a unique constraint to the "Name" column in the "Employees" table.--
ALTER TABLE Employees
ADD CONSTRAINT special UNIQUE(Name) 

--10.	Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).--
CREATE TABLE Customers(
CustomerID int PRIMARY KEY,
FirstName varchar(10),
LastName varchar(10),
Email varchar(50),
Status varchar(50)
);

--11.	Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.--
ALTER TABLE Customers
ADD FullName AS (FirstName+' '+LastName)

ALTER TABLE Customers
ADD CONSTRAINT FullName_Unique UNIQUE(FullName)

--12.	Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.--
ALTER TABLE Customers
ADD DEFAULT('ACTIVE') for Status

--13.	Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).--
CREATE TABLE Orders (
 OrderID int PRIMARY KEY,
 CustomerID int,
 OrderDate datetime,
 TotalAmount decimal,
 CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

--14.	Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.--
ALTER TABLE Orders
ADD CHECK (TotalAmount>0)

--15.	Create a schema named "Sales" and move the "Orders" table into this schema.--
CREATE SCHEMA Sales
ALTER SCHEMA Sales TRANSFER dbo.Orders

--16.	Rename the "Orders" table to "SalesOrders."--
EXEC sp_rename 'Sales.Orders','SalesOrders'



