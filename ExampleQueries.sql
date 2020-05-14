SELECT * FROM Employees
WHERE City= 'London'

SELECT *FROM Employees
WHERE TitleOfCourtesy = 'Dr.'

SELECT COUNT(EmployeeID) AS 'Num. Of Employees' FROM Employees



SELECT COUNT(Discontinued)  AS Discontinued FROM Products
WHERE Discontinued=1

SELECT CompanyName, City, Country, Region 
FROM Customers WHERE Region='BC'

SELECT p.ProductName ,p.CategoryID
FROM Products p
WHERE p.CategoryID=1

SELECT ProductName, UnitPrice FROM Products
WHERE UnitsInStock >0 OR UnitPrice > 29.99

SELECT DISTINCT Country FROM Customers
WHERE ContactTitle ='Owner'

SELECT ProductName
FROM Products WHERE ProductName LIKE 'Ch%'

SELECT *
FROM Customers WHERE Region LIKE '_A'

SELECT *
FROM Customers WHERE Region IN ('WA','SP')

SELECT *
FROM EmployeeTerritories
WHERE TerritoryID BETWEEN 06800 AND 09999

SELECT p.ProductName, p.ProductID
FROM Products p
WHERE p.UnitPrice < 5

SELECT * FROM Categories
WHERE CategoryName LIKE '[BS]%'

SELECT COUNT(*) AS 'Number of orders for EmployeeIDs 5 and 7'
FROM ORDERS
WHERE EmployeeID = 5 OR EmployeeID = 7

IN (5,7)

SELECT * FROM ORDERS
WHERE EmployeeID IN (5,7)


SELECT o.EmployeeID, COUNT(*) AS 'Number OF Orders'
FROM Orders o
GROUP BY EmployeeID
HAVING EmployeeID IN (5,7)

SELECT * From Customers

SELECT  CompanyName AS 'Company Name', City +',' + Country AS 'City'
FROM Customers 

SELECT  CompanyName AS 'Company Name', CONCAT(City ,',' , Country) AS 'City'
FROM Customers 

SELECT CONCAT(FirstName,' ', LastName) AS 'Employee Name'
FROM Employees


SELECT CompanyName AS 'Company Name', City + ',' + Country AS 'City', Region
FROM Customers
WHERE Region IS NOT NULL

SELECT DISTINCT Country AS 'Country with Region Codes'
FROM Customers
WHERE Region IS NOT NULL


-- Looking at operators within tables with "Gross Total" and "Net Total"
SELECT UnitPrice, Quantity, Discount, UnitPrice * Quantity AS "Gross Total"
FROM [Order Details]
-- Here we used the multiplication operator ' * ' 



SELECT TOP 2 OrderID, UnitPrice * Quantity AS "Gross Total", UnitPrice * Quantity * (1-Discount) AS "Net Total"
FROM [Order Details]
ORDER BY "Net Total" DESC





SELECT PostalCode "Post Code",
LEFT (PostalCode, CHARINDEX(' ',PostalCode) -1 ) AS "Post Code Region",
CHARINDEX(' ',PostalCode) AS "Space Found" ,Country
FROM Customers 
WHERE Country= 'UK'
ORDER BY "Space Found" ASC

SELECT ProductName AS "Product Names with Apostrophe" 
FROM Products
WHERE ProductName LIKE '%''%'


SELECT ProductName AS "Product Names with Apostrophe" 
FROM Products
WHERE (CHARINDEX('''',ProductName)>0)

---
SELECT CONCAT(e.FirstName,' ',e.LastName) AS "Name ",
DATEDIFF(mm,E.BirthDate,GETDATE()) AS "Age"
FROM Employees e
---


---
SELECT DATEDIFF(d,OrderDate,ShippedDate) AS "Days for Delivery",
CASE
WHEN DATEDIFF(d,OrderDate,ShippedDate) <10 
THEN 'On Time'
ELSE 'Overdue'
END AS 'Status'
FROM Orders
---

---
SELECT CONCAT(e.FirstName,' ',e.LastName) AS "Name ",
DATEDIFF(yyyy,e.BirthDate,GETDATE()) AS "Age",
CASE
    WHEN DATEDIFF(yyyy,e.BirthDate,GETDATE()) >= 65 THEN 'Retired'
    WHEN DATEDIFF(yyyy,e.BirthDate,GETDATE()) = 60 THEN 'Retirement Due'
    ELSE 'More than 5 years to go.'
    END AS 'Retirement Status'
FROM Employees e
---


SELECT SupplierID,SUM(UnitsOnOrder) AS "Total on Order",
AVG(UnitsOnOrder) AS "Avg On Order",
MIN(UnitsOnOrder) AS "Min on Order",
MAX(UnitsOnOrder) AS "Max on Order"
FROM Products
WHERE UnitsOnOrder >0
GROUP BY SupplierID,UnitsOnOrder

SELECT TOP 1 CategoryID, AVG(ReorderLevel) AS "Avg on reorder level" 
FROM Products
GROUP BY  CategoryID 
ORDER BY "Avg on reorder level" DESC


SELECT SupplierID,
SUM(UnitsOnOrder) AS "Total On Order",
AVG(UnitsOnOrder) AS "Avg On Order"
FROM Products
GROUP BY SupplierID
HAVING AVG(UnitsOnOrder) > 5
ORDER BY "Total On Order"


SELECT p.SupplierID,s.CompanyName , AVG(UnitsOnOrder) AS "Average units on Orders "
FROM Products p INNER JOIN Suppliers S ON p.SupplierID = s.SupplierID
GROUP BY p.SupplierID, s.CompanyName




SELECT p.ProductName, p.UnitPrice, CompanyName AS "Supplier",
CategoryName AS "Category"
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID


SELECT o.OrderID, o.OrderDate, o.Freight, CONCAT(e.FirstName, ' ', e.LastName)  AS "Employee Names", c.CompanyName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = o.CustomerID
INNER JOIN Employees e ON o.EmployeeID = o.EmployeeID



SELECT * FROM Customers