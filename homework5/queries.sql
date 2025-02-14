/*
INNER JOINS:
1. Показать названия и категории товаров, поставщиками которых являются ООО "Паньки" или ООО «Какие люди»
2. Выбрать все товары с указанием их поставщика, имя производителя которых не содержит букв [АКМ], и категория которых не "Крупы"
3. Показать названия и категории товаров с указанием поставщика и страны производителя. Условие: страна производителя не Украина, не Молдова и не Польша, цена поставки менее 50 гривен, а дата поставки от 10.02.2025 и по сей день
4. Показать все кондитерские и безалкогольные товары, которых было продано более 100. Показать информацию о поставщике и производителе
5. Сделать запрос на выборку информации о поставке товаров в следующем виде: название товара и его поставщика, категории,
Дата поставки и общую стоимость поставленных товаров. Условие: только трёх указанных в запросе поставщиков. Отсортировать названия товаров в алфавитном порядке
6. Сделать запрос на выборку о продажах товаров в следующем виде: название товара и его производителя, полный адрес (страна, город, улица) производителя в одной ячейке, категории, дате продажи и общей стоимости продажи.
Условие: выведенная информация не должна касаться двух указанных в запросе производителей.
Отсортировать общую стоимость продаж в порядке убывания
OUTER JOINS:
1. Показать названия товаров и их производителей, но и в том числе тех производителей, у которых нет товаров
2. Показать только те категории, к которым не относится ни один товар
3. Показать названия товаров, даты их поставки и поставщиков, в том числе тех поставщиков, которые ничего не успели поставить
4. Показать области (регионы), в которых нет ни одного производителя (ЕХСЕРТ)
5. Показать те названия категорий, где нет товаров фирмы ООО «Нли Ю» (EXСЕРТ)
6. Показать производителей, которые не выпускают продукты молочной категории (ЕХСЕР
*/
use Logistic;
--1. Показать названия и категории товаров, поставщиками которых являются ООО "Паньки" или ООО «Какие люди»
/*SELECT p.id, p.name, p.category_id, d.id, d.supplier_id, s.id, s.name
FROM Product p JOIN Category c
ON c.id = p.category_id
JOIN Delivery d
ON d.product_id = p.id
JOIN Supplier s
ON s.id = d.supplier_id
where s.name IN('Лавка молока', 'ЭкоМолоко') */

-- 2. Выбрать все товары с указанием их поставщика, имя производителя которых не содержит букв [АКМ], и категория которых не "Крупы"
/*
select p.id as 'id продукта', p.name as 'Название продукта', s.name as 'Поставщик'
from Delivery d JOIN Product p
on d.product_id = p.id
JOIN Category c
ON c.id = p.category_id
JOIN Supplier s
ON d.supplier_id = s.id
WHERE s.name NOT LIKE '%[АКМ]%' AND c.name NOT LIKE 'Крупы'
order by p.category_id
*/


--3. Показать названия и категории товаров с указанием поставщика и страны производителя. Условие: страна производителя не Украина, не Молдова и не Польша, цена поставки менее 50 гривен, а дата поставки от 10.02.2025 и по сей день

/*
select p.name as 'продукт', s.name as 'поставщик', addr.street+ ' '+ City.name + ' ' + rgn.name + ' ' + cntr.name
from Product p JOIN Delivery d
ON d.product_id = p.id
JOIN Supplier s
ON s.id = d.supplier_id
JOIN Producer prc
ON prc.id = p.producer_id
JOIN Address addr
ON addr.id = prc.address_id
JOIN City
ON City.id = addr.city_id
JOIN Region rgn
ON City.region_id = rgn.id
JOIN Country cntr
ON cntr.id = rgn.country_id
WHERE cntr.name NOT IN('Украина', 'Молдова', 'Польша') AND d.price < 50  AND CAST(d.date_of_delivery AS DATE) BETWEEN '2025-02-10' AND CAST(GETDATE() AS DATE)
*/

--4. Показать все кондитерские и безалкогольные товары, которых было продано более 100. Показать информацию о поставщике и производителе
/*
select p.id as 'ID', p.name as 'продукт', c.name as 'категория', p.price as 'цена', d.quantity as 'продано', 
pd.name as 'производитель', paddr.street + ' ' + pc.name + ' ' + prgn.name + ' ' + pcnt.name as 'адрес производителя',
s.name as 'поставщик',  saddr.street + ' ' + sc.name + ' ' + srgn.name + ' ' + scnt.name as 'адрес поставщика'

from Product p JOIN Producer pd
ON p.producer_id = pd.id
JOIN Address paddr
ON pd.address_id = paddr.id
JOIN City pc
ON pc.id = paddr.city_id
JOIN Region prgn
ON pc.region_id = prgn.id
JOIN Country pcnt
ON pcnt.id = prgn.country_id

JOIN Delivery d
ON d.product_id = p.id
JOIN Category c
ON p.category_id = c.id

JOIN Supplier s
ON d.supplier_id = s.id
JOIN Address saddr
ON s.address_id = saddr.id
JOIN City sc
ON saddr.city_id = sc.id
JOIN Region srgn
ON sc.region_id = srgn.id
JOIN Country scnt
ON srgn.country_id = scnt.id
WHERE c.id IN(9, 10) AND d.quantity > 100

*/
--5. Сделать запрос на выборку информации о поставке товаров в следующем виде: название товара и его поставщика, категории,
--Дата поставки и общую стоимость поставленных товаров. Условие: только трёх указанных в запросе поставщиков. Отсортировать названия товаров в алфавитном порядке
/*
SELECT p.name as 'Продукт', c.name as 'Категория', s.id, s.name as 'Поставщик', d.date_of_delivery as 'Дата доставки', d.quantity * p.price + d.price 'общая стоимость'
FROM Delivery d JOIN Product p
ON d.product_id = p.id
JOIN Category c
ON p.category_id = c.id
JOIN Supplier s
ON d.supplier_id = s.id
WHERE s.name in('Чистое масло', 'Фермерский урожай', 'Вкус жизни')
ORDER BY p.name
*/


--6. Сделать запрос на выборку о продажах товаров в следующем виде: название товара и его производителя, полный адрес (страна, город, улица) производителя в одной ячейке, категории, дате продажи и общей стоимости продажи.
--Условие: выведенная информация не должна касаться двух указанных в запросе производителей.
/*
SELECT p.id, p.name as 'продукт', pr.name as 'производитель', a.street + ' ' + ct.name + ' ' + rgn.name + ' ' + cnt.name as 'адрес производителя', c.name as 'категория', d.date_of_delivery as 'дата поставки', d.quantity * p.price + d.price as 'общая сумма товара + доставка', *
FROM Product p JOIN Delivery d
ON p.id = d.product_id
JOIN Producer pr
ON pr.id = p.producer_id

JOIN Address a
ON pr.address_id = a.id

JOIN City ct
ON a.city_id = ct.id

JOIN Region rgn
ON rgn.id = ct.region_id

JOIN Country cnt
ON cnt.id = rgn.country_id

JOIN Category c
ON p.category_id = c.id
where pr.id NOT in(65, 66)
order by 2
*/
--1. Показать названия товаров и их производителей, но и в том числе тех производителей, у которых нет товаров
/*SELECT p.name as 'Название товара', pr.name as 'Производитель'
FROM Product p RIGHT JOIN Producer pr
ON p.producer_id = pr.id
order by 1*/

--2. Показать только те категории, к которым не относится ни один товар
/*
SELECT p.name as 'Продукт', c.name as 'Категория'
FROM Product p RIGHT JOIN Category c
ON p.category_id = c.id
WHERE p.name IS NULL
order by 2
*/

--3. Показать названия товаров, даты их поставки и поставщиков, в том числе тех поставщиков, которые ничего не успели поставить

---------------------- это ли ожидается? -------------
/*
SELECT s.id as 'id поставщика', s.name 'имя поставщика', d.id as 'номер накладной', d.price as 'стоимость доставки', d.date_of_delivery as 'дата доставки', p.id as 'id продукта', p.name as 'продукт'
FROM Supplier s LEFT JOIN Delivery d
ON s.id = d.supplier_id
LEFT JOIN Product p
ON d.product_id = p.id

SELECT p.name as 'Продукт', d.date_of_delivery as 'Дата поставки', s.name as 'Поставщик', zs.name
FROM Product p LEFT JOIN Delivery d
ON d.product_id = p.id
LEFT JOIN Supplier s
ON s.id = d.supplier_id
RIGHT JOIN Supplier zs
ON d.supplier_id = zs.id
order by 2 DESC
*/

--4. Показать области (регионы), в которых нет ни одного производителя (ЕХСЕРТ)
/*
SELECT rgn.id, rgn.name
FROM Region rgn LEFT JOIN City ct -- Все регионы
ON rgn.id = ct.region_id

EXCEPT


SELECT argn.id, argn.name    -- Регионы, где есть хотя бы один производитель
FROM Address a
JOIN City ac 
ON a.city_id = ac.id
JOIN Region argn 
ON argn.id = ac.region_id
JOIN Producer pr 
ON pr.address_id = a.id;
*/

/*
SELECT rgn.id, rgn.name   -- Все регионы без производителей
FROM Region rgn
LEFT JOIN City ct 
ON rgn.id = ct.region_id
GROUP BY rgn.id, rgn.name

EXCEPT

SELECT argn.id, argn.name   -- Регионы c производителями
FROM Address a
JOIN City ac 
ON a.city_id = ac.id
JOIN Region argn 
ON argn.id = ac.region_id
JOIN Producer pr 
ON pr.address_id = a.id
GROUP BY argn.id, argn.name;
*/

--select*
--from Address a join City c on a.city_id = c.id -- существующие адреса с соответствующими им городами (65 адресов) последний id 66
--order by 3
--
--select c.name as 'region', COUNT(c.id) as 'city count', COUNT(a.id) as 'address count'  --выдаст количество адресов в каждом городе. 65
--from Address a join City c on a.city_id = c.id 
--group by c.name
--order by 1 DESC



--5. Показать те названия категорий, где нет товаров фирмы ООО «Нли Ю» (EXСЕРТ)
/*
SELECT c.id as 'id категории', c.name as 'Категория'
FROM Product p JOIN Category c
ON p.category_id = c.id
JOIN Producer pr
ON p.producer_id = pr.id

EXCEPT

SELECT c.id , c.name 
FROM Product p JOIN Category c
ON p.category_id = c.id
JOIN Producer pr
ON p.producer_id = pr.id
WHERE pr.name LIKE 'Вершина вкуса'
GROUP BY c.id, c.name

*/

--6. Показать производителей, которые не выпускают продукты молочной категории (ЕХСЕРT)
/*
SELECT pr.id, pr.name
FROM Product p JOIN Category c
ON p.category_id = c.id
JOIN Producer pr
ON p.producer_id = pr.id

EXCEPT

SELECT pr.id, pr.name
FROM Product p JOIN Category c
ON p.category_id = c.id
JOIN Producer pr
ON p.producer_id = pr.id
WHERE c.id = 1
GROUP BY pr.id, pr.name
*/


