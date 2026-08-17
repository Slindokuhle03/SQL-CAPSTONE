/*USE SuperMart_Db;*/

/*SELECT CustomerId, CONCAT(FirstName, LastName)  
AS CustomerName, City, COALESCE(Phone,'No Phone Number') AS PhoneNumber
FROM Customers;*/

/*SELECT CONCAT(FirstName,' ',LastName)
AS CustomerName,Email, City
FROM Customers
WHERE City IN ('Johannesburg','Pretoria')*/

/*SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2026-01-01' AND'2026-03-31' ;*/

/*SELECT CONCAT(FirstName,LastName) AS CustomerName, OrderId, OrderDate, TotalAmount
FROM Orders o
INNER JOIN Customers c ON o.CustomerId=c.CustomerId*/

/*SELECT CONCAT(FirstName,' ',LastName) AS CustomerName, OrderId, OrderDate, TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerId= o.CustomerId;*/


/*SELECT CONCAT(FirstName,' ',LastName) AS CustomerName, OrderId, OrderDate, TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerId= o.CustomerId;*/

/*SELECT CONCAT(FirstName,' ',LastName) AS CustomerName, OrderId, OrderDate, TotalAmount
FROM Customers c
FULL JOIN Orders o ON c.CustomerId= o.CustomerId;*/

/*SELECT UPPER(CONCAT(FirstName,' ',LastName)) AS CustomerName,
		City,LEN(FirstName) AS FirstNameLength
FROM Customers
ORDER BY FirstName ASC;*/

/*SELECT City,
       COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY City
ORDER BY TotalCustomers DESC;*/

/*SELECT COUNT(OrderId) AS NumOrders, AVG(TotalAmount) AS AvrgAmount,
		MAX(TotalAmount) AS HighestAmount, MIN(TotalAmount) AS MinAmount
FROM Orders*/

/*SELECT OrderId, TotalAmount,
		RIGHT(OrderDate,LEN(OrderDate)-CHARINDEX('-',OrderDate,CHARINDEX('-',OrderDate)+1)) AS OrderDay,
		SUBSTRING(OrderDate,CHARINDEX('-',OrderDate)+1,2) AS OrderMonth,
		LEFT(OrderDate, CHARINDEX('-',OrderDate)-1) AS OrderYear, 
		DATEDIFF(DAY, CAST(OrderDate AS DATE), GETDATE()) AS DaysSinceOrder
FROM Orders
ORDER BY TotalAmount ASC*/

/*SELECT c.CustomerId, CONCAT(FirstName, LastName) AS CustomerName, City
FROM Customers c
WHERE CustomerId IN (
SELECT CustomerId
FROM Orders
)

SELECT  c.CustomerId, CONCAT(FirstName, LastName) AS CustomerName, City
FROM Customers c
 WHERE EXISTS(
 SELECT OrderId
 FROM Orders o
 WHERE o.CustomerID = c.CustomerID
)*/

/*CREATE VIEW CustomerOrders AS
SELECT CONCAT (c.FirstName,c.LastName) AS CustomerName, o.OrderDate, o.TotalAmount
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;*/

/*WITH CustomerOrderCount AS
(
    SELECT c.CustomerID, 
		CONCAT(c.FirstName,' '+c.LastName) AS CustomerName,
        COUNT(o.OrderID) AS NumberOfOrders
    FROM Customers c
    INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID,c.FirstName,c.LastName
)
SELECT
    CustomerName,
    NumberOfOrders
FROM CustomerOrderCount;*/

CREATE PROCEDURE GetCustomerOrders
	@CustomerID INT
AS
BEGIN
    SELECT OrderID, OrderDate, StatusCode, TotalAmount
    FROM Orders
    WHERE CustomerID = @CustomerID;
END;

EXEC GetCustomerOrders @CustomerID = 1003;