CREATE DATABASE ShopDB;
USE ShopDB;
CREATE TABLE Products(
Id int,
Name NVARCHAR(100),
Price DECIMAL(10,2)
);
EXEC sp_rename 'prouducts','products';
ALTER TABLE Products
ALTER COLUMN Name NVARCHAR(100); 
INSERT INTO Products(Id,Name,Price)
VALUES (1,'LABTOP',3500.50),
		(3,'CEYBOARD',100.50),
		(5,'MOUSE',200.50),
		(7,'PADE',50),
		(9,'DISPLAY',1000.50);
SELECT * FROM Products;
SELECT Name FROM Products;
DROP TABLE Products;
CREATE TABLE Products
(
Id INT PRIMARY KEY,
Name NVARCHAR (100),
Price INT 
);
INSERT INTO Products(Id,Name,Price)
VALUES (1,'LABTOP',3500.50),
		(3,'CEYBOARD',100.50),
		(5,'MOUSE',200.50),
		(7,'PADE',50),
		(9,'DISPLAY',1000.50);

SELECT * FROM Products;
ALTER TABLE Products
ALTER COLUMN Price DECIMAL (10,2);

INSERT INTO Products(Id,Name,Price)
VALUES (1,'mina',200);

SELECT * FROM Products
WHERE Price> 500;
SELECT * FROM Products
WHERE Id= 7;
SELECT * FROM Products
ORDER BY Price DESC; 
SELECT Name,Price FROM Products
WHERE Price>100 
ORDER BY Price;
SELECT * FROM Products
WHERE Price<100 OR Price>1000;

UPDATE Products
SET Name='LAPTOP',Price=3500.50
WHERE Id =1;

UPDATE Products
SET Name='KETPOARD',Price=100.50
WHERE Id =3;

UPDATE Products
SET Price=200.50
WHERE Id =5;

UPDATE Products
SET Name='PAD'
WHERE Id =7;

UPDATE Products
SET Name='LAPTOP',Price=3500.50
WHERE Id =1;

UPDATE Products
SET Price=1000.50
WHERE Id =9;

UPDATE Products
SET Price= Price+50

SELECT *FROM Products

DELETE FROM Products
WHERE Id=7;

SELECT *FROM Products

UPDATE Products
SET Name='KEYBOARD'
WHERE Id=3;

CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY (1,1),
Name NVARCHAR (50) NOT NULL
);

INSERT INTO Categories (Name)
VALUES ('Electronics'),('Accessories');
SELECT * FROM Categories;

ALTER TABLE Products
ADD CategoryId INT FOREIGN KEY REFERENCES Categories(Id);

UPDATE Products SET CategoryId =1 WHERE  Id IN (1,9);
UPDATE Products SET CategoryId =2 WHERE  Id IN (3,5);
UPDATE Products SET CategoryId = 99 WHERE Id = 1;
SELECT * FROM Products;

CREATE TABLE Customers
(
Id INT PRIMARY KEY IDENTITY (1,1),
Name NVARCHAR(50) NOT NULL,
Phone DECIMAL(13,2)
);
ALTER TABLE Customers
ALTER COLUMN Phone NVARCHAR(15);

SELECT NAME , Price FROM Products
where CategoryId=2
ORDER BY Price DESC;

UPDATE Products
SET Price = 300
WHERE Id = 5;
SELECT * FROM Products;

SELECT * 
FROM Products
INNER JOIN Categories
ON Products.CategoryId =Categories.Id;

SELECT P.Name, P.Price,C.Name
FROM Products P
INNER JOIN Categories C
ON P.CategoryID= C.ID;

SELECT P.Name AS ProductName ,p.price AS SalesPrices,c.name AS CategoryName
FROM Products P
INNER JOIN Categories C
ON P.CategoryID= C.Id
ORDER BY P.Price DESC;

SELECT P.Name AS Productname ,C.Name AS Categoryname
FROM Products P
INNER JOIN Categories C
ON P.CategoryId =c.Id
WHERE P.PRICE >200
ORDER BY P.Name ;

INSERT INTO Categories (Name)
VALUES ('Gaming');

SELECT P.Name AS Productname ,C.Name AS Categoryname
FROM Categories C
LEFT JOIN Products p
ON P.CategoryId =c.Id;

SELECT C.Name AS CategoryName
FROM Categories C
LEFT JOIN Products P
ON P.CategoryId = C.Id
WHERE P.Id IS NOT NULL;

SELECT COUNT(*)   AS ProductsCount,
       SUM(Price) AS TotalPrice,
       AVG(Price) AS AvgPrice,
       MAX(Price) AS MaxPrice,
       MIN(Price) AS MinPrice
FROM Products;
SELECT * FROM Products
WHERE Price<500;
SELECT COUNT(*) AS CheapCount
FROM Products
WHERE Price < 500;

SELECT MAX(Price) AS MAXPRICE
FROM Products
WHERE CategoryId=2;

SELECT AVG(P.Price) AS AvgElectronicsPrice
FROM Products P
INNER JOIN Categories C
ON P.CategoryId = C.Id
WHERE C.Name = 'Electronics';

SELECT CategoryId, COUNT(*) AS ProductsCount
FROM Products
GROUP BY CategoryId;

SELECT C.Name AS CategoryName, COUNT(*) AS ProductsCount
FROM Products P
INNER JOIN Categories C
ON P.CategoryId = C.Id
GROUP BY C.Name;

SELECT C.Name, SUM(P.Price) AS Total
FROM Products P
INNER JOIN Categories C ON P.CategoryId = C.Id
WHERE P.Price > 200           -- 1. فلتر المنتجات
GROUP BY C.Name               -- 2. قسّمهم لأكوام
HAVING SUM(P.Price) > 1000;   -- 3. فلتر الأكوام