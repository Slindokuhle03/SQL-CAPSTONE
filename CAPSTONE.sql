CREATE DATABASE SuperMart_Db;
USE SuperMart_Db;

CREATE TABLE Customers(CustomerId INT PRIMARY KEY, 
						FirstName VARCHAR(100) NOT NULL,
						LastName VARCHAR(50) NOT NULL,
						City  VARCHAR(50) NOT NULL,
						Phone VARCHAR(10),
						Email VARCHAR(50) NOT NULL);
					

CREATE TABLE Orders(OrderId INT IDENTITY(101,1)PRIMARY KEY,
					CustomerId INT FOREIGN KEY REFERENCES Customers,
					OrderDate VARCHAR(20),
					StatusCode VARCHAR(10),
					TotalAmount FLOAT);
										
INSERT INTO Customers 
VALUES
(1001,'Slindokuhle','Dumakude','Pretoria','071-155-4896','nothandosli2003@gmail.com'),
(1002, 'Amahle','Dlamini','Durban','081-485-3212','mahle58@gmail.com'),
(1003,'Kelebogele','Mosia','Johannesburg','064-257-3256','kelemosia32@outlook.com'),
(1004,'Tshepo', 'Masemola','Johannesburg','082-258-4537','tkmasemola11@ymail.com'),
(1005,'Thuso','Modiadia','Pretoria','074-762-8965','tmodiadia2002@gmail.com'),
(1006,'Mandisa','Buthelezi','Pretoria',NULL,'msbuthelezi53@gmail.com'),
(1007, 'Mandla','Ndlovu','Pietermaritzburg','076-214-5456','mnndlovu1997@ymail.com')

INSERT INTO Orders 
VALUES
(1002,'2026-01-25','D',500),
(1003,'2026-02-15','C',1000),
(1004,'2026-02-27','D',250),
(1006,'2026-03-06','D',2500),
(1003,'2026-03-11','D',700),
(1007,'2026-03-20','D',450),
(1002,'2026-04-10','C',650),
(1004,'2026-05-30','D',1100),
(1007,'2026-06-17','D',990),
(1006,'2026-07-25','P',880)






