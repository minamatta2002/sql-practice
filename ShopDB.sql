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




