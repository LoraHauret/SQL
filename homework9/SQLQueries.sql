

/*
STORED PROCEDURES (выполнить минимум 3 задания):
1. Написать хранимую процедуру, которая показывает общее количество проданных товаров в каждой из категорий и от каждого производителя.*/
/*
CREATE PROCEDURE GetSaleStatistic
AS
BEGIN
SELECT c.name, pr.name, SUM(s.quantity) AS 'общее количество проданных товаров'
FROM Product p JOIN Sale s ON p.id = s.product_id
JOIN Category c ON p.category_id = c.id
JOIN Producer pr ON pr.id = p.producer_id
Group BY c.name, pr.name
END;

GO

Use Logistic;
EXEC GetSaleStatistic;
*/

/*
2. Написать хранимую процедуру, которая показывает список товаров, отвечающих набору критериев. Критерии: название продукта, категория, производитель. Кроме того, список должен быть отсортирован по номеру поля, указанному в 4-м параметре,
в направлении, указанном в 5-м параметре (пригодится sp_executesq1).*/
/*
CREATE PROCEDURE FindProduct
@name NVARCHAR(100), @category INT, @producer INT
AS
BEGIN
	SELECT p.id, p.name, c.name, pr.name, p.measurement_id, p.quantity, p.price
	FROM Product p JOIN Category c ON p.category_id = c.id
	JOIN Producer pr ON p.producer_id = pr.id
	WHERE p.name LIKE '%' + @name + '%' AND p.category_id = @category AND pr.id = @producer
END;

GO

Use Logistic;
EXEC FindProduct @name = 'Курица', @category = 2, @producer = 4;
*/

/*
3. Написать хранимую процедуру, которая показывает список производителей и общее количество товаров, произведённых каждым из них.*/
/*
--drop procedure GetProducerStatistic;
--go
CREATE PROCEDURE GetProducerStatistic
AS
BEGIN
	SELECT pr.name, COUNT(1) as 'общее количество произведённых товаров'
	FROM Product p 	JOIN Producer pr ON p.producer_id = pr.id
	GROUP BY pr.name
END;

GO

Use Logistic;
EXEC GetProducerStatistic;
*/

/*
4. Создать хранимую процедуру, которая показывает название продукта, который был продан в максимальном количестве.*/
/*--drop procedure GetTopSaleProduct;
--go
CREATE PROCEDURE GetTopSaleProduct
AS
BEGIN
	SELECT TOP 1 p.id, p.name, SUM(s.quantity) as 'количество проданных единиц товара'
	FROM Product p 	JOIN Sale s ON s.product_id = p.id
	GROUP BY p.id, p.name
	ORDER BY 3 DESC
END;

GO

Use Logistic;
EXEC GetTopSaleProduct;*/

/*
5. Создать хранимую процедуру, которая возвращает общее количество проданных товаров и общего дохода. */
/*
--drop procedure GetSumProfit;
--go
CREATE PROCEDURE GetSumProfit
AS
BEGIN
	SELECT SUM(p.price * s.quantity)  as 'общая выручка'
	FROM Product p 	JOIN Sale s ON s.product_id = p.id
END;

GO

Use Logistic;
EXEC GetSumProfit;
*/

/*

TRIGGERS (выполнить минимум 3 задания):
1. При продаже товара (добавлении записи в таблицу Sale), его количество должно уменьшаться (в таблице Product). 
Use Logistic;
GO

CREATE TRIGGER RecountOnSale
ON Sale
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE p
	SET p.quantity = p.quantity - i.quantity
	FROM Product p JOIN inserted i ON p.id = i.product_id
END;
*/
/*
2. Нельзя продать товар, которого нет на складе магазина (по количеству).*/
/*
Use Logistic;
GO

CREATE TRIGGER CheckAvaliableCount
ON Sale
INSTEAD OF INSERT
AS
BEGIN    
    DECLARE @goodsOnBoard INT;

    -- Для каждой записи в вставляемой или обновляемой таблице проверяю доступность товара на складе
    SELECT @goodsOnBoard = d.quantity - ISNULL(SUM(s.quantity), 0)  -- Оставшееся количество товара на складе
    FROM Delivery d 
    LEFT JOIN Sale s ON s.delivery_id = d.id  
    LEFT JOIN inserted i ON i.delivery_id = d.id
    WHERE d.id = (SELECT delivery_id FROM inserted)  -- Фильтрация по каждому товару из вставляемых данных
	GROUP BY d.id, d.quantity;

    
    IF (SELECT quantity FROM inserted) > @goodsOnBoard
    BEGIN
        PRINT 'Нет столько товара на складе. Продажа не состоялась.';
        ROLLBACK TRANSACTION;  -- Откат
    END
    ELSE
    BEGIN
        IF EXISTS (SELECT 1 FROM inserted)
        BEGIN
            INSERT INTO Sale (delivery_id, quantity)
            SELECT delivery_id, quantity FROM inserted; 
        END
    END
END;
*/


/*----предварительные тесты-----

-----остаток, который можно продать---------
--SELECT d.id, d.quantity - SUM(s.quantity)
--FROM Delivery d JOIN Sale s ON s.delivery_id = d.id
--GROUP BY d.id, d.quantity


SELECT d.id, p.quantity as 'всего товара', d.quantity as 'досталено', s.quantity as 'продано'
FROM Delivery d JOIN Sale s ON s.delivery_id = d.id JOIN Product p ON p.id = d.product_id
order by 1*/


/*
3. Нельзя продать больше 100 единиц одного товара одному покупателю.
*/
/*
USE Logistic;
GO

CREATE TRIGGER CheckSellingCount
ON Sale
INSTEAD OF INSERT
AS
BEGIN    
    IF (SELECT quantity FROM inserted) > 100
    BEGIN
        PRINT 'Не больше 100 единиц товара в одни руки! Продажа не состоялась.';
        ROLLBACK TRANSACTION;  -- Откат
    END
    ELSE
    BEGIN
        INSERT INTO Sale (delivery_id, quantity)
        SELECT delivery_id, quantity FROM inserted;
    END
END;
*/

/*
4. При удалении товара из таблицы Product, данные о нём должны копироваться в резервную таблицу ProductArchive.*/
/*
USE Logistic;
GO

CREATE TRIGGER SaveBackup
ON Product
AFTER DELETE
AS
BEGIN    
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ProductArchive')
		BEGIN
			CREATE TABLE ProductArchive
			(
			id INT PRIMARY KEY NOT NULL,
			name VARCHAR(100), 
			category_id INT NOT NULL,
			quantity INT NULL,
			producer_id INT NOT NULL, 
			measurement_id INT NOT NULL,
			discount_id INT NULL
			)
		END

		INSERT INTO ProductArchive(id, name, category_id, quantity, producer_id, measurement_id, discount_id) Select d.id, d.name, d.category_id, d.quantity, d.producer_id, d.measurement_id, d.discount_id  FROM deleted d;

END;
*/

/*
5. Если новый товар добавляется в таблицу Product, он должен быть удалён из таблицы ProductArchive (если такой товар там есть).*/

/*
USE Logistic;
GO

CREATE TRIGGER CleanBackup
ON Product
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ProductArchive')
    BEGIN
        --если добавляется несколько товаров
        DECLARE @name NVARCHAR(100);
        
        DECLARE productCursor CURSOR FOR
        SELECT name FROM inserted;

        OPEN productCursor;
        
        FETCH NEXT FROM productCursor INTO @name;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            DELETE FROM ProductArchive WHERE name = @name;
            FETCH NEXT FROM productCursor INTO @name;
        END

        CLOSE productCursor;
        DEALLOCATE productCursor;
    END
END;
*/

/*
6. Если продаётся товар производителя "Дед Тарас", то в таблицу Sale пишем на 1 товар больше, но только если
такое количество есть в наличии.*/
/*
USE Logistic;
GO

CREATE TRIGGER AddEXTRAforSpecialProducer
ON Sale
AFTER INSERT
AS
BEGIN
    DECLARE @productId INT, @quantity INT, @producerName NVARCHAR(100), @availableQuantity INT;

    SELECT @productId = i.product_id, @quantity = i.quantity
    FROM inserted i;

    SELECT @producerName = pr.name
    FROM Product p
    JOIN Producer pr ON p.producer_id = pr.id
    WHERE p.id = @productId;

    IF @producerName = 'Мясной кусок'
    BEGIN
        SELECT @availableQuantity = p.quantity
        FROM Product p
        WHERE p.id = @productId;
		-- я просто добавляю еще 1 единицу товара. триггер CheckAvaliableCount автоматически еще раз вызовется и проверит можно ли добавить еще 1 единицу товара
       INSERT INTO Sale (product_id, delivery_id, quantity, date_of_sale, discount_id)
       SELECT @productId, i.delivery_id, 1, GETDATE(), 35
       FROM inserted i
       WHERE i.product_id = @productId;
    END
END;

*/

