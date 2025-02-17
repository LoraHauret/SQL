use Logistic;

--GROUP BY AND HAVING:
--1. Показать товары, средняя цена продажи которых была больше 50 гривен
/*SELECT p.id, p.name, p.price,   SUM((p.price - p.price* dsc.percnt) * d.quantity)  / SUM(d.quantity) as 'средняя цена продажи'
FROM Product p JOIN Delivery d
ON p.id = d.product_id
JOIN Discount dsc
ON dsc.id = p.discount_id
group by p.id, p.name, p.price
having  SUM((p.price - p.price* dsc.percnt) * d.quantity)  / SUM(d.quantity) > 50
*/

--select  AVG(p1.price * d1.quantity),'average price' --3262,1153
--from Product p1 JOIN Delivery d1
--ON p1.id = d1.product_id
--order by 2
--2. Вывести количество товаров каждой категории, средняя цена поставки которых больше 100 гривен
/*
SELECT ct.id, ct.name as 'название категории', COUNT(p.id)as 'количество товаров в категории', AVG(d.price)
FROM Delivery d JOIN Product p 
ON p.id = d.product_id
JOIN Category ct
ON ct.id = p.category_id
GROUP BY ct.id, ct.name
HAVING AVG(d.price) > 100
*/

--3. Показать категории "Фрукты" и "Конфеты", принадлежащие им товары, и общую сумму их продажи
/*

Select c.id, c.name as 'название категории', SUM(p.price * d.quantity) as 'общая сумма продаж по категории'
From Product  p JOIN Category c
ON p.category_id = c.id
JOIN Delivery d ON d.product_id = p.id	
WHERE c.id in (4, 10)
group by c.id, c.name

*/

-----------для проверки наличия товаров по указанным категориям-------
/*
Select c.id, c.name, p.id, p.name, c.id, c.name, p.name, p.price, d.quantity, p.price* d.quantity
From Product  p JOIN Category c
ON p.category_id = c.id
JOIN Delivery d ON d.product_id = p.id	
WHERE c.id in (4, 10)
*/
--4. Показать информацию о производителе, его полном адресе, и количестве товаров, которые он выпускает. Общая стоимость продаж товаров каждого производителя при этом должна быть от 500 до -2000- гривен
/*
SELECT pr.id, pr.name 'производитель', a.street +' ' + c.name +' ' + r.name+' '  + cnt.name as 'адрес', COUNT(pr.id) as 'количество выпускаемых товаров', SUM(p.price * d.quantity) as 'общая стоимость продаж'--p.name, p.price, d.product_id, d.quantity, p.price *d.quantity 
FROM Producer pr JOIN Product p ON pr.id = p.producer_id
--JOIN 
JOIN Address a ON a.id = p.producer_id 
JOIN City c ON a.city_id = c.id
JOIN Region r ON r.id = c.region_id
JOIN Country cnt ON r.country_id = cnt.id
LEFT JOIN Delivery d ON d.product_id = p.id
group by pr.id, pr.name, a.street +' ' + c.name +' ' + r.name+' '  + cnt.name
having SUM(p.price * d.quantity)>2000
order by 1
*/
/*
-------------для проверки------------
SELECT pr.id, pr.name 'производитель', a.street +' ' + c.name +' ' + r.name+' '  + cnt.name as 'адрес', p.name, p.price, d.product_id, d.quantity, p.price *d.quantity 
FROM Producer pr JOIN Product p ON pr.id = p.producer_id
JOIN Address a ON a.id = p.producer_id 
JOIN City c ON a.city_id = c.id
JOIN Region r ON r.id = c.region_id
JOIN Country cnt ON r.country_id = cnt.id
JOIN Delivery d ON d.product_id = p.id
order by 2
*/


--5. Показать категорию, товаров которой в магазине меньше всего
/*
Select TOP 1 c.id, c.name as 'название категории', MIN(p.id) as 'количество товаров'
From Product  p JOIN Category c
ON p.category_id = c.id
JOIN Delivery d ON d.product_id = p.id	
group by c.id, c.name
order by 3 
*/


--6. Показать количество товаров каждой категории, при этом учитывая только те товары, стоимость поставки которых превышала 400 гривен. Условие: выведенная информация касается только трёх определённых поставщиков
SELECT c.id, c.name, COUNT(p.id) as 'количество товаров', SUM(d.price) as 'стоимость доставки > 400 грн.'
FROM Product p JOIN Category c ON p.category_id = c.id
JOIN Delivery d ON p.id = d.product_id
group by c.id, c.name
HAVING SUM(d.price) > 400 AND c.id in(2,3,9)
order by 1
