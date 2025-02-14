/*
INNER JOINS:
1. �������� �������� � ��������� �������, ������������ ������� �������� ��� "������" ��� ��� ������ ����
2. ������� ��� ������ � ��������� �� ����������, ��� ������������� ������� �� �������� ���� [���], � ��������� ������� �� "�����"
3. �������� �������� � ��������� ������� � ��������� ���������� � ������ �������������. �������: ������ ������������� �� �������, �� ������� � �� ������, ���� �������� ����� 50 ������, � ���� �������� �� 10.02.2025 � �� ��� ����
4. �������� ��� ������������ � �������������� ������, ������� ���� ������� ����� 100. �������� ���������� � ���������� � �������������
5. ������� ������ �� ������� ���������� � �������� ������� � ��������� ����: �������� ������ � ��� ����������, ���������,
���� �������� � ����� ��������� ������������ �������. �������: ������ ��� ��������� � ������� �����������. ������������� �������� ������� � ���������� �������
6. ������� ������ �� ������� � �������� ������� � ��������� ����: �������� ������ � ��� �������������, ������ ����� (������, �����, �����) ������������� � ����� ������, ���������, ���� ������� � ����� ��������� �������.
�������: ���������� ���������� �� ������ �������� ���� ��������� � ������� ��������������.
������������� ����� ��������� ������ � ������� ��������
OUTER JOINS:
1. �������� �������� ������� � �� ��������������, �� � � ��� ����� ��� ��������������, � ������� ��� �������
2. �������� ������ �� ���������, � ������� �� ��������� �� ���� �����
3. �������� �������� �������, ���� �� �������� � �����������, � ��� ����� ��� �����������, ������� ������ �� ������ ���������
4. �������� ������� (�������), � ������� ��� �� ������ ������������� (������)
5. �������� �� �������� ���������, ��� ��� ������� ����� ��� ���� ޻ (EX����)
6. �������� ��������������, ������� �� ��������� �������� �������� ��������� (�����
*/
use Logistic;
--1. �������� �������� � ��������� �������, ������������ ������� �������� ��� "������" ��� ��� ������ ����
/*SELECT p.id, p.name, p.category_id, d.id, d.supplier_id, s.id, s.name
FROM Product p JOIN Category c
ON c.id = p.category_id
JOIN Delivery d
ON d.product_id = p.id
JOIN Supplier s
ON s.id = d.supplier_id
where s.name IN('����� ������', '���������') */

-- 2. ������� ��� ������ � ��������� �� ����������, ��� ������������� ������� �� �������� ���� [���], � ��������� ������� �� "�����"
/*
select p.id as 'id ��������', p.name as '�������� ��������', s.name as '���������'
from Delivery d JOIN Product p
on d.product_id = p.id
JOIN Category c
ON c.id = p.category_id
JOIN Supplier s
ON d.supplier_id = s.id
WHERE s.name NOT LIKE '%[���]%' AND c.name NOT LIKE '�����'
order by p.category_id
*/


--3. �������� �������� � ��������� ������� � ��������� ���������� � ������ �������������. �������: ������ ������������� �� �������, �� ������� � �� ������, ���� �������� ����� 50 ������, � ���� �������� �� 10.02.2025 � �� ��� ����

/*
select p.name as '�������', s.name as '���������', addr.street+ ' '+ City.name + ' ' + rgn.name + ' ' + cntr.name
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
WHERE cntr.name NOT IN('�������', '�������', '������') AND d.price < 50  AND CAST(d.date_of_delivery AS DATE) BETWEEN '2025-02-10' AND CAST(GETDATE() AS DATE)
*/

--4. �������� ��� ������������ � �������������� ������, ������� ���� ������� ����� 100. �������� ���������� � ���������� � �������������
/*
select p.id as 'ID', p.name as '�������', c.name as '���������', p.price as '����', d.quantity as '�������', 
pd.name as '�������������', paddr.street + ' ' + pc.name + ' ' + prgn.name + ' ' + pcnt.name as '����� �������������',
s.name as '���������',  saddr.street + ' ' + sc.name + ' ' + srgn.name + ' ' + scnt.name as '����� ����������'

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
--5. ������� ������ �� ������� ���������� � �������� ������� � ��������� ����: �������� ������ � ��� ����������, ���������,
--���� �������� � ����� ��������� ������������ �������. �������: ������ ��� ��������� � ������� �����������. ������������� �������� ������� � ���������� �������
/*
SELECT p.name as '�������', c.name as '���������', s.id, s.name as '���������', d.date_of_delivery as '���� ��������', d.quantity * p.price + d.price '����� ���������'
FROM Delivery d JOIN Product p
ON d.product_id = p.id
JOIN Category c
ON p.category_id = c.id
JOIN Supplier s
ON d.supplier_id = s.id
WHERE s.name in('������ �����', '���������� ������', '���� �����')
ORDER BY p.name
*/


--6. ������� ������ �� ������� � �������� ������� � ��������� ����: �������� ������ � ��� �������������, ������ ����� (������, �����, �����) ������������� � ����� ������, ���������, ���� ������� � ����� ��������� �������.
--�������: ���������� ���������� �� ������ �������� ���� ��������� � ������� ��������������.
/*
SELECT p.id, p.name as '�������', pr.name as '�������������', a.street + ' ' + ct.name + ' ' + rgn.name + ' ' + cnt.name as '����� �������������', c.name as '���������', d.date_of_delivery as '���� ��������', d.quantity * p.price + d.price as '����� ����� ������ + ��������', *
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
--1. �������� �������� ������� � �� ��������������, �� � � ��� ����� ��� ��������������, � ������� ��� �������
/*SELECT p.name as '�������� ������', pr.name as '�������������'
FROM Product p RIGHT JOIN Producer pr
ON p.producer_id = pr.id
order by 1*/

--2. �������� ������ �� ���������, � ������� �� ��������� �� ���� �����
/*
SELECT p.name as '�������', c.name as '���������'
FROM Product p RIGHT JOIN Category c
ON p.category_id = c.id
WHERE p.name IS NULL
order by 2
*/

--3. �������� �������� �������, ���� �� �������� � �����������, � ��� ����� ��� �����������, ������� ������ �� ������ ���������

---------------------- ��� �� ���������? -------------
/*
SELECT s.id as 'id ����������', s.name '��� ����������', d.id as '����� ���������', d.price as '��������� ��������', d.date_of_delivery as '���� ��������', p.id as 'id ��������', p.name as '�������'
FROM Supplier s LEFT JOIN Delivery d
ON s.id = d.supplier_id
LEFT JOIN Product p
ON d.product_id = p.id

SELECT p.name as '�������', d.date_of_delivery as '���� ��������', s.name as '���������', zs.name
FROM Product p LEFT JOIN Delivery d
ON d.product_id = p.id
LEFT JOIN Supplier s
ON s.id = d.supplier_id
RIGHT JOIN Supplier zs
ON d.supplier_id = zs.id
order by 2 DESC
*/

--4. �������� ������� (�������), � ������� ��� �� ������ ������������� (������)
/*
SELECT rgn.id, rgn.name
FROM Region rgn LEFT JOIN City ct -- ��� �������
ON rgn.id = ct.region_id

EXCEPT


SELECT argn.id, argn.name    -- �������, ��� ���� ���� �� ���� �������������
FROM Address a
JOIN City ac 
ON a.city_id = ac.id
JOIN Region argn 
ON argn.id = ac.region_id
JOIN Producer pr 
ON pr.address_id = a.id;
*/

/*
SELECT rgn.id, rgn.name   -- ��� ������� ��� ��������������
FROM Region rgn
LEFT JOIN City ct 
ON rgn.id = ct.region_id
GROUP BY rgn.id, rgn.name

EXCEPT

SELECT argn.id, argn.name   -- ������� c ���������������
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
--from Address a join City c on a.city_id = c.id -- ������������ ������ � ���������������� �� �������� (65 �������) ��������� id 66
--order by 3
--
--select c.name as 'region', COUNT(c.id) as 'city count', COUNT(a.id) as 'address count'  --������ ���������� ������� � ������ ������. 65
--from Address a join City c on a.city_id = c.id 
--group by c.name
--order by 1 DESC



--5. �������� �� �������� ���������, ��� ��� ������� ����� ��� ���� ޻ (EX����)
/*
SELECT c.id as 'id ���������', c.name as '���������'
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
WHERE pr.name LIKE '������� �����'
GROUP BY c.id, c.name

*/

--6. �������� ��������������, ������� �� ��������� �������� �������� ��������� (�����T)
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


