--1. написать запросы на создание шести таблиц БД Издательства (картинка прилагается тут)
--Включение доступа к расширенным настройкам, чтобы иметь возможность использовать команды, связанные с системными настройками
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
--Для того чтобы использовать команду удаления xp_cmdshell, необходимо разрешить её выполнение
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;

IF EXISTS (SELECT* FROM sys.databases WHERE name = 'PublishingHouse')
BEGIN
 USE master; -- переключение на другую базу
ALTER DATABASE PublishingHouse SET OFFLINE; --отключение базы, которую хочу удалить
DROP DATABASE PublishingHouse;

DECLARE @fileExists INT;

EXEC xp_fileexist 'D:\DB\projects\homework7\PublishingHouse.mdf', @fileExists OUTPUT; -- Проверка наличия файла на жд
IF @fileExists = 1
BEGIN
	EXEC xp_cmdshell 'del D:\DB\projects\homework7\PublishingHouse.mdf';
END

EXEC xp_fileexist 'D:\DB\projects\homework7\PublishingHouse.ldf', @fileExists OUTPUT;
IF @fileExists = 1
BEGIN
	EXEC xp_cmdshell 'del D:\DB\projects\homework7\PublishingHouse.ldf';
END

END
GO


IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'PublishingHouse')
BEGIN
CREATE DATABASE PublishingHouse
ON
(
NAME = 'PublishingHouse',
FILENAME = 'D:\DB\projects\homework7\PublishingHouse.mdf',
SIZE = 10MB,
MAXSIZE = 100MB,
FILEGROWTH=100MB
)
LOG ON
(
NAME = 'PublishingHouse_log',
FILENAME = 'D:\DB\projects\homework7\PublishingHouse.ldf',
SIZE = 5MB,
MAXSIZE = 50MB,
FILEGROWTH=50MB
)
END

GO

USE PublishingHouse;

GO 
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Country')
BEGIN
CREATE TABLE Country
(
id int Identity(1,1) PRIMARY KEY NOT NULL,
name NVARCHAR(100) NOT NULL
)
END

GO

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Authors')
BEGIN
CREATE TABLE Authors
(
id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
firstname NVARCHAR(100) NOT NULL,
lastname NVARCHAR(100) NOT NULL,
country_id INT NOT NULL
CONSTRAINT FK_Authors_Country FOREIGN KEY (country_id) REFERENCES Country(id)
)
END

GO

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Shops')
BEGIN
CREATE TABLE Shops
(
id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
name NVARCHAR(100) NOT NULL,
country_id INT NOT NULL

CONSTRAINT FK_Shops_Country FOREIGN KEY (country_id) REFERENCES Country(id)
)
END
GO

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Themes')
BEGIN
CREATE TABLE Themes
(
id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
name NVARCHAR(100) NOT NULL
)
END

GO

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Books')
BEGIN
CREATE TABLE Books
(
id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
name NVARCHAR(100) NOT NULL,
themes_id INT NOT NULL,
author_id INT NOT NULL,
price MONEY NOT NULL,
date_of_publishing MONEY NOT NULL,
pages INT

CONSTRAINT FK_Books_Themes FOREIGN KEY (themes_id) REFERENCES Themes(id),
CONSTRAINT FK_Books_Authors FOREIGN KEY (author_id) REFERENCES Authors(id)
)
END

GO

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Sales')
BEGIN
CREATE TABLE Sales
(
id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
date_of_sale MONEY NOT NULL,
book_id INT NOT NULL,
shop_id INT NOT NULL,
price MONEY NOT NULL,
quantity INT NOT NULL

CONSTRAINT FK_Sales_Book FOREIGN KEY (book_id) REFERENCES Books(id),
CONSTRAINT FK_Sales_Shop FOREIGN KEY (shop_id) REFERENCES Shops(id)
)
END

GO
--Отключение xp_cmdshell после завершения операций
EXEC sp_configure 'xp_cmdshell', 0;
RECONFIGURE;
--Отключение доступа к расширенным настройкам
EXEC sp_configure 'show advanced options', 0;
RECONFIGURE;
