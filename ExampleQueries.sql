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