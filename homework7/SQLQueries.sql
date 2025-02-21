--USE Logistic;

/*

Файл
Д3.txt
Изменить
Просмотр
+
SUBQUERIES (в решении обязательно использовать минимум один подзапрос!):


CREATE TABLE:
1. написать запросы на создание шести таблиц БД Издательства (картинка прилагается тут)
=======
=======
VIEWS (факультативно):
1. Показать все продажи, где есть продукты из отдела "Молочка".
2. Показать все продукты из категории "Мясо", у которых количество на складе меньше 50 единиц.
3. Показать наиболее продаваемые товары из отдела "Канцтовары" за последние 3 месяца.
4. Показать статистику продаж по всем продуктам "Молочка" и "Мясо" в разрезе каждого месяца за последний год.
5. Показать товары из отдела "Канцтовары", которые так и не были ни разу проданы за последние 90 дней.
*/

--1. Показать самый популярный товар магазина (больше всего раз продавался)
/*

SELECT p.id, p.name, COUNT(1)
FROM Product p JOIN Delivery d ON d.product_id = p.id
GROUP BY p.id, p.name
HAVING COUNT(1) >= (SELECT MAX(SaleCount)  FROM 
							(SELECT COUNT(1) as SaleCount FROM Delivery GROUP BY Delivery.product_id) 
							AS subJuery)
ORDER BY 1
*/

--2. Если общее количество товаров всех категорий принять за 100%, необходимо посчитать, сколько товаров каждой категории (в процентном отношении) было продано
-----вариант № 1----------
/*
SELECT  p.category_id, c.name, COUNT(1) AS 'Количество товаров в категории', 
FORMAT(  COUNT(1) * 100.0 / (SELECT COUNT(1) FROM Product),'N2'   )  AS '% продаж относительно общего количества товаров'  --ROUND(COUNT(1) * 100.0 / (SELECT COUNT(1),2) FROM Product)  AS '%% продаж относительно общего количества товаров' 
FROM Product p JOIN Category c ON c.id = p.category_id
JOIN Delivery d ON d.product_id = p.id
GROUP BY p.category_id, c.name;

------ВАРИАНТ 2 с использованием COMMON TABLE EXPRESSION---------
WITH TotalProducts AS (
    SELECT COUNT(1) AS TotalCount FROM Product)

SELECT  
    p.category_id, 
    c.name, 
    COUNT(1) AS 'Количество товаров в категории',
    FORMAT(COUNT(1) * 100.0 / (SELECT TotalCount FROM TotalProducts), 'N2') AS 'Процент от общего числа товаров'
FROM Product p
JOIN Category c ON c.id = p.category_id
JOIN Delivery d ON d.product_id = p.id
GROUP BY p.category_id, c.name;


-------ВАРИАНТ № 3 с использованием переменной, в которую выбирается количество всех продуктов---------------
DECLARE @TotalCount INT;
SELECT @TotalCount = COUNT(1) FROM Product;

SELECT  c.id, C.name, COUNT(1) AS 'Количество товаров в категории', FORMAT(COUNT(1) * 100.0 / @TotalCount, 'N2') AS 'Процент от общего числа товаров'
FROM Product p JOIN Category c ON c.id = p.category_id
JOIN Delivery d ON d.product_id = p.id
GROUP BY c.id, C.name
*/

--3. Показать названия поставщиков, которые не поставляли йогурт
/*
SELECT s.id, s.name 
FROM Supplier s
WHERE s.id NOT IN (	SELECT s.id
					FROM Product p JOIN Delivery d ON d.product_id = p.id
					JOIN Supplier s ON s.id = d.supplier_id
					WHERE p.name LIKE '%Йогурт%');

---или вот так, методом исключения первого попадения в условие---
SELECT s.id, s.name 
FROM Supplier s
WHERE NOT EXISTS (	SELECT 1
					FROM Product p JOIN Delivery d ON d.product_id = p.id
					WHERE d.supplier_id = s.id and p.name LIKE '%Йогурт%');
*/


--4*. Показать на экран список производителей, которые живут в той же стране, что и фирма 000 "Зеленоглазое такси"
------------------------1-----------------------------
/*
SELECT p.id, p.name,  pcnt.id, pcnt.name 
FROM Producer p JOIN Address pa ON p.address_id = pa.id
JOIN City pc ON pa.city_id = pc.id
JOIN Region prgn ON prgn.id = pc.region_id
JOIN Country pcnt ON prgn.country_id = pcnt.id
GROUP BY p.id, p.name,  pcnt.id , pcnt.name 
HAVING pcnt.id =  (SELECT cnt.id
				FROM Organisation org JOIN Address a ON org.address_id = a.id
				JOIN City c ON a.city_id = c.id
				JOIN Region rgn ON rgn.id = c.region_id
				JOIN Country cnt ON rgn.country_id = cnt.id
				WHERE org.name LIKE '%Зеленоглазое такси%'
				);

------------------2-----------------------
DECLARE @CountryID INT;
SELECT @CountryID =  cnt.id
				FROM Organisation org JOIN Address a ON org.address_id = a.id
				JOIN City c ON a.city_id = c.id
				JOIN Region rgn ON rgn.id = c.region_id
				JOIN Country cnt ON rgn.country_id = cnt.id
				WHERE org.name LIKE '%Зеленоглазое такси%';

SELECT p.id, p.name,  pcnt.id, pcnt.name 
FROM Producer p JOIN Address pa ON p.address_id = pa.id
JOIN City pc ON pa.city_id = pc.id
JOIN Region prgn ON prgn.id = pc.region_id
JOIN Country pcnt ON prgn.country_id = pcnt.id
WHERE pcnt.id =  @CountryID;
*/

-- 5. Показать всех производителей, количество наименований товаров которых в магазине больше, чем количество наименований всех товаров фирмы ООО «Крустикс»
/*
SELECT pr.id, pr.name AS 'ПРОИЗВОДИТЕЛЬ', COUNT(1) AS 'КОЛИЧЕСТВО ТОВАРОВ В МАГАЗИНЕ'
FROM Product p JOIN Producer pr ON p.producer_id = pr.id
GROUP BY pr.id, pr.name
HAVING COUNT(1) > (SELECT COUNT(1) FROM Product p1 JOIN Producer pr1 ON p1.producer_id = pr1.id WHERE pr1.id = 49) --Крустикс
ORDER BY 1

---------------------2----------------------
DECLARE @CountGoods INT;
SELECT @CountGoods = COUNT(1) FROM Product p1 JOIN Producer pr1 ON p1.producer_id = pr1.id WHERE pr1.id = 49;

SELECT pr.id, pr.name AS 'ПРОИЗВОДИТЕЛЬ', COUNT(1) AS 'КОЛИЧЕСТВО ТОВАРОВ В МАГАЗИНЕ'
FROM Product p JOIN Producer pr ON p.producer_id = pr.id
GROUP BY pr.id, pr.name
HAVING COUNT(1) > @CountGoods --Крустикс
ORDER BY 1*/

--6. Показать общее количество продаж по каждому дню, начиная от 15.11.2024, и по сей день. Отсортировать по убыванию даты 
/*
SELECT s.date_of_sale AS 'ДАТА', COUNT(1) AS 'КОЛИЧЕСТВО ПРОДАЖ', SUM(p.price) AS 'СУММА ПРОДАЖ (грн.)'
FROM Sale s JOIN Product p ON s.product_id = p.id
WHERE s.date_of_sale BETWEEN CAST('2025-02-01' AS DATE) AND CAST(GETDATE() AS DATE) 
GROUP BY s.date_of_sale
ORDER BY 1 DESC;

----------------------------------------------------

SELECT SalesData.date_of_sale AS 'ДАТА', COUNT(1) AS 'КОЛИЧЕСТВО ПРОДАЖ', SUM(SalesData.price) AS 'СУММА ПРОДАЖ (грн.)'
FROM (SELECT s.date_of_sale, p.price
     FROM Sale s JOIN Product p ON s.product_id = p.id
     WHERE s.date_of_sale BETWEEN CAST('2025-02-01' AS DATE) AND CAST(GETDATE() AS DATE)
    ) AS SalesData
GROUP BY
    SalesData.date_of_sale
ORDER BY
    SalesData.date_of_sale DESC;

*/


--7*. Вычислить количество товаров каждой категории, которые пора списать (их количество известно, и они не продавались вот уже три месяца) ( 4 и 7 можно не делать :) )

---------------подзапрос в from ------------------
/*
SELECT c.id ID, c.name КАТЕГОРИЯ, SUM(ProductStatus.ProductRest) as 'ТОВАРЫ ДЛЯ СПИСАНИЯ'

FROM (
	Select d.id AS deliveryid, p.id AS ProductId, p.name, p.category_id, d.quantity, d.quantity - SUM(s.quantity) as ProductRest, DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) AS LifeStatus
	FROM Delivery d JOIN Product p ON d.product_id = p.id
	JOIN Sale s ON s.delivery_id = d.id
	GROUP BY d.id, p.id, p.category_id, p.name, d.quantity, d.date_of_delivery
	HAVING DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) >= 3
	UNION ALL
	SELECT d.id AS deliveryid, p.id AS ProductId, p.name, p.category_id, d.quantity, d.quantity AS ProductRest,  DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) AS LifeStatus
	FROM Delivery d JOIN Product p ON d.product_id = p.id
	WHERE NOT EXISTS (
						SELECT 1
						FROM Sale s WHERE s.delivery_id = d.id
						)
	) as ProductStatus
JOIN Category c ON c.id = ProductStatus.category_id
WHERE ProductStatus.ProductRest > 0
GROUP BY c.id, c.name

*/
------------------------ЗОНА ТЕСТИРОВАНИЯ И ОТЛАДКИ-----------------------------------
/*
SELECT c.id, c.name, SUM(d.quantity)
FROM Product p JOIN Delivery d ON p.id = d.product_id
JOIN Category c ON p.category_id = c.id
WHERE DATEDIFF( MONTH, CAST(d.date_of_delivery AS DATE), CAST( GETDATE() AS DATE ) ) >=3 
	AND NOT EXISTS 
	( SELECT 1  FROM Sale s	WHERE s.product_id = p.id
								AND DATEDIFF( MONTH, CAST(s.date_of_sale AS DATE), CAST( GETDATE() AS DATE )) < 3)
GROUP BY c.id, c.name
*/
/*
SELECT p.id, p.name, c.id, c.name, p.name, SUM(s.quantity) as 'ПРОДАНО'--, SUM(d.quantity)
FROM Product p JOIN Sale s ON p.id = s.product_id
JOIN Category c ON p.category_id = c.id
GROUP BY p.id,p.name, c.id, c.name
order by 1

Select d.id deliveryid, p.id as productid, p.name, COUNT(1) AS 'КОЛИЧЕСТВО ПРОДАЖ', d.quantity, d.quantity - SUM(s.quantity) as 'остаток товара', DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) as 'товару > n месяцев'
FROM Delivery d JOIN Product p ON d.product_id = p.id
JOIN Sale s ON s.delivery_id = d.id
GROUP BY d.id, p.id, p.name, d.quantity, d.date_of_delivery, date_of_sale
HAVING DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) >= 3*/
/*
SELECT d.id, d.product_id, DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) as 'товару > n месяцев'
FROM Delivery d JOIN Sale s ON s.delivery_id = d.id 
GROUP BY d.id, d.product_id, d.date_of_delivery, date_of_sale
HAVING DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) >= 3
*/
/*
	
 SELECT  p1.category_id, d1.quantity
FROM Product p1 JOIN Delivery d1 ON d1.product_id = p1.id
WHERE  d1.product_id = p1.id
GROUP BY p1.category_id, d1.quantity
*/
/*
SELECT name, price, category_id
FROM Product p1
WHERE price > (
    SELECT AVG(price)
    FROM Product p2
    WHERE p1.category_id = p2.category_id
);*/



--CREATE VIEW vw_Delivery AS
--SELECT d.id as delivery_id, d.date_of_delivery as delivery_date, p.id as product_id, p.name as product_name, p.category_id as category_id
--FROM Delivery d join Product p ON d.product_id = p.id

--1. написать запросы на создание шести таблиц БД Издательства (картинка прилагается тут)
--выполнено в отдельном файле CREATE_PUBLISHING_HOUSE.sql

USE Logistic;
--1. Показать все продажи, где есть продукты из отдела "Молочка".
/*
SELECT *
FROM hw7_v_task1
*/
--2. Показать все продукты из категории "Мясо", у которых количество на складе меньше 50 единиц.
/*
SELECT *
FROM hw7_v_task2
*/

--3. Показать наиболее продаваемые товары из отдела "Мясо" за последние 3 месяца.
/*
SELECT *
FROM hw7_v_task3
*/
--4. Показать статистику продаж по всем продуктам "Молочка" и "Мясо" в разрезе каждого месяца за последний год.
/*
SELECT *
FROM hw7_v_task4
*/
--5. Показать товары из отдела "Мясо", которые так и не были ни разу проданы за последние 90 дней.
/*
SELECT *
FROM hw7_v_task5
	
		*/
	