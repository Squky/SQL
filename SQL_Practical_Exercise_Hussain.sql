-- Exercise 1.1

SELECT c.CustomerID , c.ContactName ,c.CompanyName,
 c.Address,c.PostalCode ,c.City, c.Country
FROM Customers c
WHERE City = 'Paris' OR City='London'
----


-- Exercise 1.2

SELECT *
FROM Products
WHERE QuantityPerUnit LIKE '%bottles'
----


-- Exercise 1.3

SELECT p.ProductID, p.ProductName AS "Products Stored in Bottles",
 s.CompanyName AS "Supplier", s.Country AS "Supplier's Country"

FROM Products p INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE QuantityPerUnit LIKE '%bottles' 
----



-- Exercise 1.4

SELECT c.CategoryName, c.CategoryID,
COUNT(c.CategoryName) AS "Number of Products in Category"
FROM Products p INNER JOIN Categories c ON p.CategoryID= c.CategoryID
GROUP BY c.CategoryID,c.CategoryName
ORDER BY "Number of Products in Category" DESC
----

-- Exercise 1.5

SELECT CONCAT(e.TitleOfCourtesy,e.FirstName,' ',e.LastName) AS "UK Employees", e.City
FROM Employees e
WHERE e.Country = 'UK'
----


-- Exercise 1.6


----
SELECT  r.RegionID, 
(SELECT SUM(od.UnitPrice*(1-od.Discount)*od.Quantity ) )AS "Total Sales"

FROM [Order Details] od

INNER JOIN Orders o ON od.OrderID =o.OrderID
INNER JOIN EmployeeTerritories et ON o.EmployeeID = et.EmployeeID
INNER JOIN Territories t ON et.TerritoryID = t.TerritoryID
INNER JOIN Region r ON t.RegionID = r.RegionID
GROUP BY  r.RegionID
HAVING SUM(od.UnitPrice*(1-od.Discount)*od.Quantity ) > 1000000
ORDER BY SUM(od.UnitPrice*(1-od.Discount)*od.Quantity ) DESC





----


-- Exercise 1.7

SELECT O.ShipCountry, O.Freight
FROM Orders o 
WHERE o.Freight > 100.0 OR (o.ShipCountry = 'USA' OR o.ShipCountry='UK')
order by o.Freight
----

-- Exercise 1.8

SELECT TOP 10 o.OrderID, MAX(o.Discount) AS "Highest Discount",
ROUND(SUM(o.UnitPrice*(1-o.Discount) *o.Quantity),2) AS "Discounted Price", 
SUM(o.UnitPrice * o.Quantity) AS "Original Order Price"
FROM [Order Details] o
GROUP BY o.OrderID
ORDER BY "Highest Discount" DESC 
----



-- Exercise 2.1

CREATE TABLE SpartansTable
(
    spartanID INT IDENTITY(1,1),
    title VARCHAR(5),
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    University VARCHAR(50),
    Course VARCHAR(50),
    markAchieved DECIMAL(2,1)
)

-- Exercise 2.2
INSERT INTO SpartansTable

VALUES
(
    'Mr.','Hussain','Ali','University Of Essex','Computer Science',2.1
),
(
    'Mr.','Nathan','Forester','University Of Phoenix','Computer Science',1.0
),
(
    'Mr.', 'Stefan','Okolo','University Of Michigan', 'Business and Accounting',1.0
),
(
    'Mr.', 'Ashraf','Mohamud','University of York', 'Biological Sciences',1.0
),
(
    'Miss.','Saskia','Van Barthold','Imperial College London','Chemical Engineering',1.0
)

SELECT * FROM
SpartansTable

DROP TABLE SpartansTable

-----------


-- Exercise 3.1


SELECT CONCAT(e.TitleOfCourtesy,e.FirstName,' ', e.LastName) AS Employee,
e.ReportsTo AS "Reports to"
FROM Employees e 

------


-- Exercise 3.2 

SELECT s.CompanyName ,ROUND(SUM(od.UnitPrice*(1- od.Discount )*od.Quantity),2) AS "Total Sales"
FROM Products p 
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID

GROUP BY s.CompanyName
HAVING SUM(od.UnitPrice*od.Quantity) > 10000
ORDER BY  "Total Sales" DESC 


-----------


-- Exercise 3.3


-- Wasn't sure which "Date" to use from the Orders table 
-- I used ShippedDate but the code still works with the oher dates :)

SELECT TOP 10 od.OrderID, SUM(od.UnitPrice*od.Quantity) AS "Order Value", o.CustomerID, o.ShippedDate
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY od.OrderID , o.CustomerID,o.ShippedDate
HAVING (DATEDIFF(yyyy,o.ShippedDate,GETDATE()))<23
ORDER BY "Order Value" DESC
------


-- Exercise 3.4

SELECT  FORMAT(o.ShippedDate,'yy-MMM') AS "Month Year", (SELECT AVG(DATEDIFF(dd,o.OrderDate,o.ShippedDate))) AS "Average ship time"
FROM Orders o
GROUP BY (MONTH(o.ShippedDate)) , (YEAR(o.ShippedDate)), FORMAT(o.ShippedDate,'yy-MMM')

ORDER BY (YEAR(o.ShippedDate)) ASC



