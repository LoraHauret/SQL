--USE Logistic;

/*

����
�3.txt
��������
��������
+
SUBQUERIES (� ������� ����������� ������������ ������� ���� ���������!):


CREATE TABLE:
1. �������� ������� �� �������� ����� ������ �� ������������ (�������� ����������� ���)
=======
=======
VIEWS (�������������):
1. �������� ��� �������, ��� ���� �������� �� ������ "�������".
2. �������� ��� �������� �� ��������� "����", � ������� ���������� �� ������ ������ 50 ������.
3. �������� �������� ����������� ������ �� ������ "����������" �� ��������� 3 ������.
4. �������� ���������� ������ �� ���� ��������� "�������" � "����" � ������� ������� ������ �� ��������� ���.
5. �������� ������ �� ������ "����������", ������� ��� � �� ���� �� ���� ������� �� ��������� 90 ����.
*/

--1. �������� ����� ���������� ����� �������� (������ ����� ��� ����������)
/*

SELECT p.id, p.name, COUNT(1)
FROM Product p JOIN Delivery d ON d.product_id = p.id
GROUP BY p.id, p.name
HAVING COUNT(1) >= (SELECT MAX(SaleCount)  FROM 
							(SELECT COUNT(1) as SaleCount FROM Delivery GROUP BY Delivery.product_id) 
							AS subJuery)
ORDER BY 1
*/

--2. ���� ����� ���������� ������� ���� ��������� ������� �� 100%, ���������� ���������, ������� ������� ������ ��������� (� ���������� ���������) ���� �������
-----������� � 1----------
/*
SELECT  p.category_id, c.name, COUNT(1) AS '���������� ������� � ���������', 
FORMAT(  COUNT(1) * 100.0 / (SELECT COUNT(1) FROM Product),'N2'   )  AS '% ������ ������������ ������ ���������� �������'  --ROUND(COUNT(1) * 100.0 / (SELECT COUNT(1),2) FROM Product)  AS '%% ������ ������������ ������ ���������� �������' 
FROM Product p JOIN Category c ON c.id = p.category_id
JOIN Delivery d ON d.product_id = p.id
GROUP BY p.category_id, c.name;

------������� 2 � �������������� COMMON TABLE EXPRESSION---------
WITH TotalProducts AS (
    SELECT COUNT(1) AS TotalCount FROM Product)

SELECT  
    p.category_id, 
    c.name, 
    COUNT(1) AS '���������� ������� � ���������',
    FORMAT(COUNT(1) * 100.0 / (SELECT TotalCount FROM TotalProducts), 'N2') AS '������� �� ������ ����� �������'
FROM Product p
JOIN Category c ON c.id = p.category_id
JOIN Delivery d ON d.product_id = p.id
GROUP BY p.category_id, c.name;


-------������� � 3 � �������������� ����������, � ������� ���������� ���������� ���� ���������---------------
DECLARE @TotalCount INT;
SELECT @TotalCount = COUNT(1) FROM Product;

SELECT  c.id, C.name, COUNT(1) AS '���������� ������� � ���������', FORMAT(COUNT(1) * 100.0 / @TotalCount, 'N2') AS '������� �� ������ ����� �������'
FROM Product p JOIN Category c ON c.id = p.category_id
JOIN Delivery d ON d.product_id = p.id
GROUP BY c.id, C.name
*/

--3. �������� �������� �����������, ������� �� ���������� ������
/*
SELECT s.id, s.name 
FROM Supplier s
WHERE s.id NOT IN (	SELECT s.id
					FROM Product p JOIN Delivery d ON d.product_id = p.id
					JOIN Supplier s ON s.id = d.supplier_id
					WHERE p.name LIKE '%������%');

---��� ��� ���, ������� ���������� ������� ��������� � �������---
SELECT s.id, s.name 
FROM Supplier s
WHERE NOT EXISTS (	SELECT 1
					FROM Product p JOIN Delivery d ON d.product_id = p.id
					WHERE d.supplier_id = s.id and p.name LIKE '%������%');
*/


--4*. �������� �� ����� ������ ��������������, ������� ����� � ��� �� ������, ��� � ����� 000 "������������ �����"
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
				WHERE org.name LIKE '%������������ �����%'
				);

------------------2-----------------------
DECLARE @CountryID INT;
SELECT @CountryID =  cnt.id
				FROM Organisation org JOIN Address a ON org.address_id = a.id
				JOIN City c ON a.city_id = c.id
				JOIN Region rgn ON rgn.id = c.region_id
				JOIN Country cnt ON rgn.country_id = cnt.id
				WHERE org.name LIKE '%������������ �����%';

SELECT p.id, p.name,  pcnt.id, pcnt.name 
FROM Producer p JOIN Address pa ON p.address_id = pa.id
JOIN City pc ON pa.city_id = pc.id
JOIN Region prgn ON prgn.id = pc.region_id
JOIN Country pcnt ON prgn.country_id = pcnt.id
WHERE pcnt.id =  @CountryID;
*/

-- 5. �������� ���� ��������������, ���������� ������������ ������� ������� � �������� ������, ��� ���������� ������������ ���� ������� ����� ��� ���������
/*
SELECT pr.id, pr.name AS '�������������', COUNT(1) AS '���������� ������� � ��������'
FROM Product p JOIN Producer pr ON p.producer_id = pr.id
GROUP BY pr.id, pr.name
HAVING COUNT(1) > (SELECT COUNT(1) FROM Product p1 JOIN Producer pr1 ON p1.producer_id = pr1.id WHERE pr1.id = 49) --��������
ORDER BY 1

---------------------2----------------------
DECLARE @CountGoods INT;
SELECT @CountGoods = COUNT(1) FROM Product p1 JOIN Producer pr1 ON p1.producer_id = pr1.id WHERE pr1.id = 49;

SELECT pr.id, pr.name AS '�������������', COUNT(1) AS '���������� ������� � ��������'
FROM Product p JOIN Producer pr ON p.producer_id = pr.id
GROUP BY pr.id, pr.name
HAVING COUNT(1) > @CountGoods --��������
ORDER BY 1*/

--6. �������� ����� ���������� ������ �� ������� ���, ������� �� 15.11.2024, � �� ��� ����. ������������� �� �������� ���� 
/*
SELECT s.date_of_sale AS '����', COUNT(1) AS '���������� ������', SUM(p.price) AS '����� ������ (���.)'
FROM Sale s JOIN Product p ON s.product_id = p.id
WHERE s.date_of_sale BETWEEN CAST('2025-02-01' AS DATE) AND CAST(GETDATE() AS DATE) 
GROUP BY s.date_of_sale
ORDER BY 1 DESC;

----------------------------------------------------

SELECT SalesData.date_of_sale AS '����', COUNT(1) AS '���������� ������', SUM(SalesData.price) AS '����� ������ (���.)'
FROM (SELECT s.date_of_sale, p.price
     FROM Sale s JOIN Product p ON s.product_id = p.id
     WHERE s.date_of_sale BETWEEN CAST('2025-02-01' AS DATE) AND CAST(GETDATE() AS DATE)
    ) AS SalesData
GROUP BY
    SalesData.date_of_sale
ORDER BY
    SalesData.date_of_sale DESC;

*/


--7*. ��������� ���������� ������� ������ ���������, ������� ���� ������� (�� ���������� ��������, � ��� �� ����������� ��� ��� ��� ������) ( 4 � 7 ����� �� ������ :) )

---------------��������� � from ------------------
/*
SELECT c.id ID, c.name ���������, SUM(ProductStatus.ProductRest) as '������ ��� ��������'

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
------------------------���� ������������ � �������-----------------------------------
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
SELECT p.id, p.name, c.id, c.name, p.name, SUM(s.quantity) as '�������'--, SUM(d.quantity)
FROM Product p JOIN Sale s ON p.id = s.product_id
JOIN Category c ON p.category_id = c.id
GROUP BY p.id,p.name, c.id, c.name
order by 1

Select d.id deliveryid, p.id as productid, p.name, COUNT(1) AS '���������� ������', d.quantity, d.quantity - SUM(s.quantity) as '������� ������', DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) as '������ > n �������'
FROM Delivery d JOIN Product p ON d.product_id = p.id
JOIN Sale s ON s.delivery_id = d.id
GROUP BY d.id, p.id, p.name, d.quantity, d.date_of_delivery, date_of_sale
HAVING DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) >= 3*/
/*
SELECT d.id, d.product_id, DATEDIFF(MONTH, d.date_of_delivery, GETDATE()) as '������ > n �������'
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

--1. �������� ������� �� �������� ����� ������ �� ������������ (�������� ����������� ���)
--��������� � ��������� ����� CREATE_PUBLISHING_HOUSE.sql

USE Logistic;
--1. �������� ��� �������, ��� ���� �������� �� ������ "�������".
/*
SELECT *
FROM hw7_v_task1
*/
--2. �������� ��� �������� �� ��������� "����", � ������� ���������� �� ������ ������ 50 ������.
/*
SELECT *
FROM hw7_v_task2
*/

--3. �������� �������� ����������� ������ �� ������ "����" �� ��������� 3 ������.
/*
SELECT *
FROM hw7_v_task3
*/
--4. �������� ���������� ������ �� ���� ��������� "�������" � "����" � ������� ������� ������ �� ��������� ���.
/*
SELECT *
FROM hw7_v_task4
*/
--5. �������� ������ �� ������ "����", ������� ��� � �� ���� �� ���� ������� �� ��������� 90 ����.
/*
SELECT *
FROM hw7_v_task5
	
		*/
	