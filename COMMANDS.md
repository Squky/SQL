# WATCH THE SYNTAX!!!
```SQL
USE [DATABASE NAME];


CREATE TABLE [TABLE NAME]


SP_HELP [TABLE NAME]


DROP TABLE [TABLE NAME]


ALTER TABLE [TABLENAME]
ADD [Attribute] [type]


ALTER TABLE [TABLENAME]
DROP COLUMN [ColumnName]


INSERT INTO [Your Table] ( column_name1, ...)
VALUES ( 'value1', 'value2' )


USE hussain_db

CREATE TABLE hussain_film_table
(
    film_id INT NOT NULL,
    film_name VARCHAR(10),
    film_type VARCHAR(6),
    release_date DATE,
    direcctor VARCHAR,
    writer VARCHAR,
    Star VARCHAR,
    film_language VARCHAR,
    official_website VARCHAR,
    plot_summary VARCHAR(max)

)

SP_HELP hussain_film_table

DROP TABLE hussain_film_table

PRIMARY KEY (film_id),
FOREIGN KEY (column name you want to put as a foreign key in this table) REFERENCES TableName(key)


INSERT INTO [TableName]
values
(
    'column1Value','column2Value'
)

ALTER TABLE [TableName]
ALTER COLUMN [columnName] VARCHAR(10) NOT NULL;

ALTER TABLE [TableName]
Add [ColumnName] [Type] [VALUE]


SELECT * FROM [TableName] WHERE [ColumnName] IS NULL
-- Not "WHERE [Column] = NULL"

-- BELOW IS JUST A QUERY FOR CREATING TABLES - NOT NOTES
CREATE TABLE customer
(
    cust_id  INT NOT NULL,
    f_name  VARCHAR(max),
    l_name  VARCHAR(max)
    PRIMARY KEY (cust_id)

)

CREATE TABLE item
(
    item_id INT NOT NULL,
    item_name VARCHAR(max),
    item_price DECIMAL(4,2)
    PRIMARY KEY (item_id)

)
drop

CREATE TABLE purchases
(
    purchase_id INT NOT NULL,
    purchase_date DATE,
    item_id INT,
    cust_id INT

    PRIMARY KEY (purchase_id)
    FOREIGN KEY (item_id) REFERENCES item(item_id),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
)

-- NOTES CONTINUE HERE

Update [TableName]
SET [Column]=[Value]
WHERE [Column]=[Value]


DELETE FROM [TableName]
WHERE [Column]=[Value]

SELECT TOP [num]

SELECT * FROM
WHERE [Condition1] AND [Condition2] OR [Condition3]

SELECT p.CategoryID  -- Assign Products to variable 'p'
FROM Products p
WHERE p.CategoryID=1

SELECT DISTINCT -- REMOVES DUPLICATE VALUES

SELECT *
FROM Customers WHERE Region IN ('WA','SP')
-- The IN operator allows retrieval of more than one
Instead of using Region = 'WA' OR Region ='SP' OR ...

SELECT *
FROM EmployeeTerritories
WHERE TerritoryID BETWEEN 06800 AND 09999
-- BETWEEN provides a range

SELECT o.EmployeeID, COUNT(*) AS 'Number OF Orders'
FROM Orders o
GROUP BY EmployeeID
HAVING EmployeeID IN (5,7)
-- This shows 2 columns of count rather than the total


---
**ON DELETE CASCADE :-**

FOREIGN KEY (item_id) REFERENCES item(item_id) ON DELETE SET NULL,

FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE,

FOREIGN KEY (empl_id) REFERENCES employee(empl_id) ON UPDATE CASCADE
----

--- Using ORDER BY to find the top 2 highest Net Total
SELECT TOP 2 OrderID, UnitPrice * Quantity AS "Gross Total", UnitPrice * Quantity * (1-Discount) AS "Net Total"
FROM [Order Details]
ORDER BY "Net Total" DESC
---


--- Listing employees and calculating their retirement status:
SELECT CONCAT(e.FirstName,' ',e.LastName) AS "Name ",
DATEDIFF(yyyy,e.BirthDate,GETDATE()) AS "Age",
CASE
    WHEN DATEDIFF(yyyy,e.BirthDate,GETDATE()) >= 65 THEN 'Retired'
    WHEN DATEDIFF(yyyy,e.BirthDate,GETDATE()) = 60 THEN 'Retirement Due'
    ELSE 'More than 5 years to go.'
    END AS 'Retirement Status'
FROM Employees e
---


--- testing aggregate Functions
SELECT SupplierID,SUM(UnitsOnOrder) AS "Total on Order",
AVG(UnitsOnOrder) AS "Avg On Order",
MIN(UnitsOnOrder) AS "Min on Order",
MAX(UnitsOnOrder) AS "Max on Order"
FROM Products
WHERE UnitsOnOrder >0
GROUP BY SupplierID,UnitsOnOrder
---

--- Testing AVG with GROUP BY and ORDER BY
SELECT  CategoryID, AVG(ReorderLevel) AS "Avg on reorder level"
FROM Products
GROUP BY CategoryID
ORDER BY "Avg on reorder level" DESC
---


--- Aggregate functions with GROUP BY and HAVING
SELECT SupplierID,
SUM(UnitsOnOrder) AS "Total On Order",
AVG(UnitsOnOrder) AS "Avg On Order"
FROM Products
GROUP BY SupplierID
HAVING AVG(UnitsOnOrder) > 5
---


--- Example of INNER JOIN
SELECT p.SupplierID,s.CompanyName , AVG(UnitsOnOrder) AS "Average units on Orders "
FROM Products p INNER JOIN Suppliers S ON p.SupplierID = s.SupplierID
GROUP BY p.SupplierID, s.CompanyName
---

--- Example of multiple inner joins

SELECT p.ProductName, p.UnitPrice, CompanyName AS "Supplier",
CategoryName AS "Category"
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
---
