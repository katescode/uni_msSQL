--проверка существования базы данных если её нет то создать
--IF DB_ID('df307_14') IS NULL CREATE DATABASE df307_14;

--использовать базу df307_14
USE df307_14;

--проверка существования таблицы Artworks если есть то удалить и создать заново
/*IF OBJECT_ID('dbo.Artworks', 'U') IS NOT NULL DROP TABLE dbo.Artworks;

CREATE TABLE dbo.Artworks (
ArtworkId BIGINT IDENTITY(1,1) CONSTRAINT PK_Artworks PRIMARY KEY,
Title VARCHAR(100) NULL,
Genre VARCHAR (50) NULL,
Tools VARCHAR (50) NULL,
AuthorId BIGINT NULL,
CreatDate DATE NULL,
Price MONEY NULL,
DepId INT NOT NULL
);*/

--проверка существования таблицы Employees если есть то удалить и создать заново
/*IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL DROP TABLE dbo.Employees;

CREATE TABLE dbo.Employees (
EmpId BIGINT IDENTITY(1,1) CONSTRAINT PK_Employees PRIMARY KEY,
Lastname VARCHAR(25) NOT NULL,
Firstname VARCHAR (25) NOT NULL,
Middlename VARCHAR (25) NOT NULL,
Position VARCHAR (25) NULL,
Salary MONEY NULL,
BeginDate DATE NOT NULL,
EndDate DATE NULL,
DepId INT NULL
);*/

--проверка существования таблицы Departments если есть то удалить и создать заново
/*IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL DROP TABLE dbo.Departments;

CREATE TABLE dbo.Departments (
DepId INT IDENTITY(1,1) CONSTRAINT PK_Departments PRIMARY KEY,
Name VARCHAR(MAX) NOT NULL
);*/

--связь таблиц Artworks и Departments по DepId
/*ALTER TABLE dbo.Artworks
ADD CONSTRAINT FK_Artw_Dep
FOREIGN KEY (DepId)
REFERENCES Departments (DepId);*/

--связь таблиц Employees и Departments по DepId
/*ALTER TABLE dbo.Employees
ADD CONSTRAINT FK_Emp_Dep
FOREIGN KEY (DepId)
REFERENCES Departments (DepId);*/
-----------------------------------------------Самостоятельная------------------------------------------------------
--проверка существования таблицы Authors если есть то удалить и создать заново
/*IF OBJECT_ID('dbo.Authors', 'U') IS NOT NULL DROP TABLE dbo.Authors;

CREATE TABLE dbo.Authors (
AuthorId BIGINT IDENTITY(1,1) CONSTRAINT PK_Authors PRIMARY KEY,
Lastname VARCHAR(25) NOT NULL,
Firstname VARCHAR (25) NOT NULL,
Middlename VARCHAR (25) NULL,
DateOfBirth DATE NULL,
DateOfDeath DATE NULL,
CountryCode INT NULL,
);*/

--проверка существования таблицы Orders если есть то удалить и создать заново
/*IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;

CREATE TABLE dbo.Orders (
orderid INT IDENTITY(1,1) CONSTRAINT PK_orderid PRIMARY KEY,
empid INT NULL,
custid VARCHAR (25) NULL,
qty INT NULL,
);*/

--связь таблиц Artworks и Authors по AuthorId
/*ALTER TABLE dbo.Artworks
ADD CONSTRAINT FK_Artw_Auth
FOREIGN KEY (AuthorId)
REFERENCES Authors (AuthorId);*/
