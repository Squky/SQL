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

SELECT * 
FROM Territories
----


-- Exercise 1.7

SELECT COUNT(o.OrderID)
FROM Orders o 
WHERE o.Freight > 100.0 AND (o.ShipCountry = 'USA' OR o.ShipCountry='UK')
----

-- Exercise 1.8

SELECT TOP 10 o.OrderID,MAX(o.Discount) AS "Highest Discount"
FROM [Order Details] o
GROUP BY o.OrderID
ORDER BY "Highest Discount" DESC
----


