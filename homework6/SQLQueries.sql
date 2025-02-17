use Logistic;

--GROUP BY AND HAVING:
--1. �������� ������, ������� ���� ������� ������� ���� ������ 50 ������
/*SELECT p.id, p.name, p.price,   SUM((p.price - p.price* dsc.percnt) * d.quantity)  / SUM(d.quantity) as '������� ���� �������'
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
--2. ������� ���������� ������� ������ ���������, ������� ���� �������� ������� ������ 100 ������
/*
SELECT ct.id, ct.name as '�������� ���������', COUNT(p.id)as '���������� ������� � ���������', AVG(d.price)
FROM Delivery d JOIN Product p 
ON p.id = d.product_id
JOIN Category ct
ON ct.id = p.category_id
GROUP BY ct.id, ct.name
HAVING AVG(d.price) > 100
*/

--3. �������� ��������� "������" � "�������", ������������� �� ������, � ����� ����� �� �������
/*

Select c.id, c.name as '�������� ���������', SUM(p.price * d.quantity) as '����� ����� ������ �� ���������'
From Product  p JOIN Category c
ON p.category_id = c.id
JOIN Delivery d ON d.product_id = p.id	
WHERE c.id in (4, 10)
group by c.id, c.name

*/

-----------��� �������� ������� ������� �� ��������� ����������-------
/*
Select c.id, c.name, p.id, p.name, c.id, c.name, p.name, p.price, d.quantity, p.price* d.quantity
From Product  p JOIN Category c
ON p.category_id = c.id
JOIN Delivery d ON d.product_id = p.id	
WHERE c.id in (4, 10)
*/
--4. �������� ���������� � �������������, ��� ������ ������, � ���������� �������, ������� �� ���������. ����� ��������� ������ ������� ������� ������������� ��� ���� ������ ���� �� 500 �� -2000- ������
/*
SELECT pr.id, pr.name '�������������', a.street +' ' + c.name +' ' + r.name+' '  + cnt.name as '�����', COUNT(pr.id) as '���������� ����������� �������', SUM(p.price * d.quantity) as '����� ��������� ������'--p.name, p.price, d.product_id, d.quantity, p.price *d.quantity 
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
-------------��� ��������------------
SELECT pr.id, pr.name '�������������', a.street +' ' + c.name +' ' + r.name+' '  + cnt.name as '�����', p.name, p.price, d.product_id, d.quantity, p.price *d.quantity 
FROM Producer pr JOIN Product p ON pr.id = p.producer_id
JOIN Address a ON a.id = p.producer_id 
JOIN City c ON a.city_id = c.id
JOIN Region r ON r.id = c.region_id
JOIN Country cnt ON r.country_id = cnt.id
JOIN Delivery d ON d.product_id = p.id
order by 2
*/


--5. �������� ���������, ������� ������� � �������� ������ �����
/*
Select TOP 1 c.id, c.name as '�������� ���������', MIN(p.id) as '���������� �������'
From Product  p JOIN Category c
ON p.category_id = c.id
JOIN Delivery d ON d.product_id = p.id	
group by c.id, c.name
order by 3 
*/


--6. �������� ���������� ������� ������ ���������, ��� ���� �������� ������ �� ������, ��������� �������� ������� ��������� 400 ������. �������: ���������� ���������� �������� ������ ��� ����������� �����������
SELECT c.id, c.name, COUNT(p.id) as '���������� �������', SUM(d.price) as '��������� �������� > 400 ���.'
FROM Product p JOIN Category c ON p.category_id = c.id
JOIN Delivery d ON p.id = d.product_id
group by c.id, c.name
HAVING SUM(d.price) > 400 AND c.id in(2,3,9)
order by 1
