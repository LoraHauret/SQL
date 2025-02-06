--([date_of_delivery]>=CONVERT([date],getdate()))

USE Store;
/*1. Посчитать возможную выручку за хлеб и молоко (с учётом скидок на эти товары)*/
/*
select	name as 'наименование товара', 
		price as 'цена', 
		discount as 'скидка', 
		(price - price * discount/100) * quantity as 'выручка с учетом скидки' 
from Product
where name LIKE '%Хлеб%' or name like '%Молоко%'
*/



/*2. Получить информацию о том, каких товаров вчера и сегодня доставили более 10 штук (getdate, dateadd)*/
/*
select *
from Product
where quantity>=10 AND date_of_delivery IN(CAST(GETDATE() AS DATE), CAST(GETDATE()-1 AS DATE))
*/




/*3. Показать названия и цены товаров, доставленных на протяжении последнего месяца.*/
/*
SELECT name as 'наименование товара', price as 'цена'  --, date_of_delivery
FROM Product
WHERE date_of_delivery BETWEEN DATEADD(MONTH, -1, GETDATE())  AND GETDATE() 
ORDER BY 1
*/								


/*4. Показать на экран названия и цены товаров с категорией "Кондитерские изделия", но только не торговой марки "Roshen"*/
/*
SELECT name as 'наименование товара', price as 'цена' --, category, producer
FROM Product
WHERE category LIKE 'Сыры'  AND producer NOT LIKE 'FromageFermier'
ORDER BY 2

SELECT name as 'наименование товара', price as 'цена' --, category, producer
FROM Product
WHERE category = 'Сыры'  AND producer <> 'FromageFermier'
ORDER BY 2
*/

/*5. Показать на экран все товары, название которых начинается на букву "К", и категория которых содержит букву "А"*/

/*
SELECT name, category
FROM Product
WHERE name LIKE 'К%' AND category LIKE '%а%'
*/

/*6. Показать на экран все товары, названия которых начинаются с "В" и по "Л" включительно */
/*SELECT *
FROM Product
WHERE name BETWEEN 'В' AND 'М'
order by name
*/

/*
SELECT *
FROM Product
WHERE name LIKE '[В-Л]%'
order by name
*/		


/*7. Показать все товары стоимостью меньше 50 гривен, и датой поставки неделю назад от текущей даты */ 
-- У меня в базе нет таких товаров, поэтому я поставила дату поставки 2 дня назад
/*
SELECT name as 'наименование товара', price as 'цена', date_of_delivery as 'дата поставки'
FROM Product
WHERE price < 50.00 AND date_of_delivery = CAST(GETDATE()-2 AS DATE)
ORDER by 1
*/

/*8. Показать все товары категории "Безалкогольные напитки", количество которых более 100*/
-- У меня в базе нет таких товаров, поэтому я поставила количество напитков больше 30
/*SELECT *
FROM Product
WHERE category = 'напитки' AND quantity > 30	
*/

/*9. Получить информацию о товарах ценой от 100 до 200 гривен, отсортировать цену по возрастанию*/
/*	
SELECT name as 'наименование товара', price as 'цена'
FROM Product
WHERE price BETWEEN 100 AND 200			
ORDER by 2
*/

/*10. Уменьшить цены на все товары на 5% */
/*SELECT name as 'наименование товара', price as 'цена', price - price * 5/100 as 'стоимость со скидкой 5%'
FROM Product
order by 1
*/

/*11. Проставить сегодняшнюю дату доставки на все товары, в которых такая информация отсутствует*/
/*
-- для проверки верности выборки
--SELECT *
--FROM Product
--where date_of_delivery IS NULL

UPDATE Product
SET date_of_delivery = CAST(GETDATE() AS DATE)
WHERE date_of_delivery IS NULL

-- для проверки верности заполнения даты
--SELECT *
--FROM Product
--WHERE name LIKE '%кот%'
	*/				
					

/*12. Удалить все товары, количество которых меньше 100, а цена более 70 гривен*/
/*																																							 
 --select *
 --from Product
 --where price>70 and price < 100 --6 подходящих позиций. Всего 79 позиций (до удаления 6 продуктов)

DELETE FROM Product
WHERE price > 70 AND price < 100;

--select *
--from Product  Всего 73 позиции после удаления продуктов
*/


/*13. Удалить все алкогольные напитки и кондитерские изделия																								 */
/*													

-- сначала их стоит добавить
--INSERT INTO Product (name, category, price, discount, quantity, measurement, producer, country, supplier, date_of_delivery, expire_date)
--VALUES
--('Hirsch Gold', 'Алкогольные напитки', 600, 10, 50, 'бутылка', 'Hirsch Distillery', 'Austria', 'ABC Spirits', '2025-01-15', '2027-01-15'),
--('Bacardi Superior', 'Алкогольные напитки', 450, 15, 100, 'бутылка', 'Bacardi Limited', 'Puerto Rico', 'Spirits International', '2024-12-01', '2026-12-01'),
--('Smirnoff Vodka', 'Алкогольные напитки', 350, 5, 150, 'бутылка', 'Smirnoff', 'Russia', 'Global Drinks', '2025-01-10', '2027-01-10'),
--('Jack Daniel''s', 'Алкогольные напитки', 800, 12, 200, 'бутылка', 'Jack Daniel''s Distillery', 'USA', 'Brown-Forman', '2024-11-20', '2026-11-20'),
--('Moët & Chandon', 'Алкогольные напитки', 1200, 20, 30, 'бутылка', 'Moët Hennessy', 'France', 'Moët Hennessy', '2024-10-05', '2027-10-05'),
--('Sierra Tequila', 'Алкогольные напитки', 550, 8, 80, 'бутылка', 'Sierra Tequila', 'Mexico', 'Tequila Imports', '2024-11-12', '2026-11-12'),
--('Baileys Irish Cream', 'Алкогольные напитки', 700, 10, 120, 'бутылка', 'Diageo', 'Ireland', 'Diageo Global', '2024-12-05', '2026-12-05'),
--('Chivas Regal', 'Алкогольные напитки', 950, 15, 60, 'бутылка', 'Chivas Brothers', 'Scotland', 'Pernod Ricard', '2024-09-25', '2026-09-25'),
--('Absolut Vodka', 'Алкогольные напитки', 400, 7, 200, 'бутылка', 'Absolut Company', 'Sweden', 'Pernod Ricard', '2025-02-01', '2027-02-01'),
--('Captain Morgan Spiced Rum', 'Алкогольные напитки', 500, 10, 150, 'бутылка', 'Diageo', 'Jamaica', 'Diageo Global', '2024-12-15', '2026-12-15'),
--('Шоколадка Alpen Gold', 'кондитерские изделия', 35, 5, 200, 'плитка', 'Alpen Gold', 'Germany', 'Sweet World', '2025-01-10', '2026-01-10'),
--('Торт Наполеон', 'кондитерские изделия', 250, 10, 50, 'шт', 'Sweets Bakery', 'Ukraine', 'Sweets Co.', '2025-02-01', '2025-04-01'),
--('Печенье Jaffa Cakes', 'кондитерские изделия', 45, 8, 150, 'упаковка', 'McVitie''s', 'UK', 'Global Confectionery', '2025-01-05', '2026-01-05'),
--('Медовый торт', 'кондитерские изделия', 300, 15, 40, 'шт', 'Honey Treats', 'Ukraine', 'Bakery Delights', '2025-01-15', '2025-03-15'),
--('Шоколад Milka', 'кондитерские изделия', 60, 7, 100, 'плитка', 'Milka', 'Austria', 'Chocolate World', '2025-01-20', '2026-01-20'),
--('Пирог с яблоками', 'кондитерские изделия', 120, 10, 80, 'шт', 'Apple Delight Bakery', 'Ukraine', 'Bakery Suppliers', '2025-02-01', '2025-05-01'),
--('Карамелька Toffifee', 'кондитерские изделия', 75, 5, 300, 'упаковка', 'Storck', 'Germany', 'Sweet World', '2025-01-25', '2027-01-25'),
--('Марципановые конфеты', 'кондитерские изделия', 90, 12, 250, 'коробка', 'Lübecker Marzipan', 'Germany', 'Premium Sweets', '2025-01-30', '2026-01-30'),
--('Кекс с изюмом', 'кондитерские изделия', 150, 8, 120, 'шт', 'Home Bakery', 'Ukraine', 'Fresh Sweets', '2025-01-18', '2025-03-18'),
--('Трюфели Lindt', 'кондитерские изделия', 120, 10, 100, 'коробка', 'Lindt', 'Switzerland', 'Lux Sweet Suppliers', '2025-02-05', '2026-02-05');


--SELECT *
--FROM Product
--WHERE category IN ('кондитерские изделия', 'Алкогольные напитки')

DELETE FROM Product
WHERE category IN ('кондитерские изделия', 'Алкогольные напитки');

*/

/*14. Показать на экран все товары, в названии которых содержится РОВНО 3 буквы "О" (в любых местах названия, не обязательно подряд)						 */
/*	
SELECT *
FROM Product
WHERE name LIKE '%о%о%о%' AND LEN(name) - LEN(REPLACE(name, 'о', '')) = 3;
*/

/*15. Удалить все товары, названия которых состоят из 5 букв*/
/*																												

--SELECT *
--FROM Product
--WHERE LEN(name) = 5;

DELETE FROM Product
WHERE LEN(name) = 5;
*/

/*16. Удалить все товары, дата доставки которых была более 3 месяцев назад от текущей даты*/
/* 

INSERT INTO Product (name, category, price, discount, quantity, measurement, producer, country, supplier, date_of_delivery, expire_date)
VALUES
('Hirsch Gold', 'Алкогольные напитки', 600, 10, 50, 'бутылка', 'Hirsch Distillery', 'Austria', 'ABC Spirits', '2024-07-15', '2027-01-15'),
('Bacardi Superior', 'Алкогольные напитки', 450, 15, 100, 'бутылка', 'Bacardi Limited', 'Puerto Rico', 'Spirits International', '2024-11-01', '2026-12-01'),
('Smirnoff Vodka', 'Алкогольные напитки', 350, 5, 150, 'бутылка', 'Smirnoff', 'Russia', 'Global Drinks', '2024-09-10', '2027-01-10'),
('Jack Daniel''s', 'Алкогольные напитки', 800, 12, 200, 'бутылка', 'Jack Daniel''s Distillery', 'USA', 'Brown-Forman', '2024-09-20', '2026-11-20'),
('Moët & Chandon', 'Алкогольные напитки', 1200, 20, 30, 'бутылка', 'Moët Hennessy', 'France', 'Moët Hennessy', '2024-10-05', '2027-10-05'),
('Sierra Tequila', 'Алкогольные напитки', 550, 8, 80, 'бутылка', 'Sierra Tequila', 'Mexico', 'Tequila Imports', '2024-11-12', '2026-11-12'),
('Baileys Irish Cream', 'Алкогольные напитки', 700, 10, 120, 'бутылка', 'Diageo', 'Ireland', 'Diageo Global', '2024-12-05', '2026-12-05'),
('Chivas Regal', 'Алкогольные напитки', 950, 15, 60, 'бутылка', 'Chivas Brothers', 'Scotland', 'Pernod Ricard', '2024-09-25', '2026-09-25'),
('Absolut Vodka', 'Алкогольные напитки', 400, 7, 200, 'бутылка', 'Absolut Company', 'Sweden', 'Pernod Ricard', '2025-02-01', '2027-02-01'),
('Captain Morgan Spiced Rum', 'Алкогольные напитки', 500, 10, 150, 'бутылка', 'Diageo', 'Jamaica', 'Diageo Global', '2024-10-15', '2026-12-15'),
('Шоколадка Alpen Gold', 'кондитерские изделия', 35, 5, 200, 'плитка', 'Alpen Gold', 'Germany', 'Sweet World', '2024-07-10', '2026-01-10'),
('Торт Наполеон', 'кондитерские изделия', 250, 10, 50, 'шт', 'Sweets Bakery', 'Ukraine', 'Sweets Co.', '2024-08-01', '2025-04-01'),
('Печенье Jaffa Cakes', 'кондитерские изделия', 45, 8, 150, 'упаковка', 'McVitie''s', 'UK', 'Global Confectionery', '2024-09-05', '2026-01-05'),
('Медовый торт', 'кондитерские изделия', 300, 15, 40, 'шт', 'Honey Treats', 'Ukraine', 'Bakery Delights', '2024-09-15', '2025-03-15'),
('Шоколад Milka', 'кондитерские изделия', 60, 7, 100, 'плитка', 'Milka', 'Austria', 'Chocolate World', '2025-01-20', '2026-01-20'),
('Пирог с яблоками', 'кондитерские изделия', 120, 10, 80, 'шт', 'Apple Delight Bakery', 'Ukraine', 'Bakery Suppliers', '2025-02-01', '2025-05-01'),
('Карамелька Toffifee', 'кондитерские изделия', 75, 5, 300, 'упаковка', 'Storck', 'Germany', 'Sweet World', '2025-01-25', '2027-01-25'),
('Марципановые конфеты', 'кондитерские изделия', 90, 12, 250, 'коробка', 'Lübecker Marzipan', 'Germany', 'Premium Sweets', '2025-01-30', '2026-01-30'),
('Кекс с изюмом', 'кондитерские изделия', 150, 8, 120, 'шт', 'Home Bakery', 'Ukraine', 'Fresh Sweets', '2025-01-18', '2025-03-18'),
('Трюфели Lindt', 'кондитерские изделия', 120, 10, 100, 'коробка', 'Lindt', 'Switzerland', 'Lux Sweet Suppliers', '2025-02-05', '2026-02-05');

--SELECT name, date_of_delivery, CAST(DATEADD(month, -3, GETDATE()) AS DATE), *
--FROM Product
--WHERE date_of_delivery <= CAST(DATEADD(month, -3, GETDATE()) AS DATE)
--order by 1
--
--SELECT*
--from Product
DELETE FROM Product
WHERE date_of_delivery <= CAST(DATEADD(month, -3, GETDATE()) AS DATE)


--DELETE FROM Product
--WHERE category = 'кондитерские изделия' or category= 'Алкогольные напитки'
*/

/*17. Показать 5 самых дорогих товаров*/
/*
SELECT TOP 5 *
FROM Product
order by price DESC
*/																																							 
/*18. Удалить все товары, информация о производителе которых неизвестна, или же если скидка на эти товары более 10%*/
/*
--INSERT INTO Product (name, category, price, discount, quantity, measurement, producer, country, supplier, date_of_delivery, expire_date)
--VALUES
--('Hirsch Gold', 'Алкогольные напитки', 600, 10, 50, 'бутылка', NULL, 'Austria', 'ABC Spirits', '2024-07-15', '2027-01-15')

--SELECT *
--FROM Product
--WHERE discount >10 OR producer IS NULL;
DELETE FROM Product
WHERE discount >10 OR producer IS NULL
*/