/*
VARIABLES:

1. Показать среднее арифметическое трёх вещественных чисел, хранящихся в переменных*/
/*
DECLARE @min float = 5;
DECLARE @max float = 15;
DECLARE @number1 float = @min + (RAND() * (@max - @min));;
DECLARE @number2 float = @min + (RAND() * (@max - @min));
DECLARE @number3 float = @min + (RAND() * (@max - @min));
PRINT 'число 1: ' + CAST(@number1 AS NVARCHAR)
PRINT 'число 2: ' + CAST(@number2 AS NVARCHAR)
PRINT 'число 3: ' + CAST(@number3 AS NVARCHAR)
PRINT 'Среднее арифметическое чисел: ' + CAST(@number1 AS NVARCHAR) + ', ' + CAST(@number2 AS NVARCHAR) + ', '+ CAST(@number3 AS NVARCHAR) + ' = ' + CAST((@number1+@number2+@number3)/ 3 AS NVARCHAR);


DECLARE @Average float;
SELECT @Average = AVG(Value) 
FROM (VALUES (@number1), (@number2), (@number3)) AS T(Value);
PRINT 'Среднее арифметическое чисел: ' + CAST(@number1 AS NVARCHAR) + ', ' + CAST(@number2 AS NVARCHAR) + ', '+ CAST(@number3 AS NVARCHAR) + ' = ' + CAST(@Average AS NVARCHAR);
*/


/*
2. Показать количество цифр числа, хранящегося в переменной
*/
/*
DECLARE @maxNumber int = 100000000;
DECLARE @number int = rand() * @maxNumber +1;
PRINT @number;
DECLARE @promt NVARCHAR(100) = 'number ' + CAST(@number as nvarchar) + ' has ';
DECLARE @count int = 0;
WHILE @number > 0
BEGIN
SET @number /= 10;
SET @count +=1;
END

PRINT @promt + CAST(@count AS NVARCHAR) + ' DIGITS';
*/

/*
3. Показать горизонтальную линию из звёздочек длиной @L*/
/*
DECLARE @L INT = RAND() * 10 + 1;
PRINT @L;
DECLARE @promt NVARCHAR(11) = '';
WHILE @L > 0
BEGIN
	SET @promt += '*';
	SET @L -=1;
END
PRINT @promt;
*/

/*
4. Скрипт проверяет, какое сейчас время суток на сервере, и выдаёт приветствие "добрый вечер!" или "добрый день!"*/
/*
DECLARE @currentTime NVARCHAR(20) = GETDATE();
SET @currentTime = TRIM(@currentTime);
--PRINT @currentTime;
DECLARE @Len INT = LEN(@currentTime);
--PRINT @Len;
DECLARE @dayTime NVARCHAR(2);
SELECT @dayTime = SUBSTRING(@currentTime, @Len - 1, 2);
PRINT @dayTime;

DECLARE @res NVARCHAR(20) = CASE @dayTime
WHEN 'AM' THEN 'Добрый день!'
WHEN 'PM' THEN 'Добрый вечер!'
ELSE 'Привет!'
 END 

PRINT @res

GO

DECLARE @currentTime DATETIME = GETDATE();
DECLARE @hour INT = DATEPART(HOUR, @currentTime);
PRINT @hour
DECLARE @res NVARCHAR(20);
IF @hour < 12
    SET @res = 'Добрый день!';
ELSE
    SET @res = 'Добрый вечер!';

PRINT @res;
*/

/*
5. Скрипт генерирует случайный сложный пароль длиной от @M до @N*/
/*
DECLARE @M INT = 6;
DECLARE @N INT = 20;
DECLARE @LEN INT =  @M + (RAND() * (@N - @M));
DECLARE @PASSWORD NVARCHAR(MAX) = '';
DECLARE @RandCode INT;
WHILE @LEN > 0
BEGIN
SET @RandCode = FLOOR(RAND() * (126 - 32 + 1)) + 32; 
SET @PASSWORD += CHAR(@RandCode);
SET @LEN -=1;
END
PRINT @PASSWORD
*/

/*
6. Показать факториалы всех чисел от 0 до 25*/
/*
DECLARE @fact DECIMAL(30, 0) = 1;
DECLARE @count INT = 25;
DECLARE @i INT = 0;
WHILE @i <= @count
BEGIN
	PRINT CAST(@i AS NCHAR)  + CAST(@fact AS NVARCHAR(100));
	SET @fact *= (@i + 1);
	SET @i += 1;
END*/

/*
7. Показать все простые числа от 3 до 1 000 000*/
/*
DECLARE @min INT = 3, @max INT = 1000000;
DECLARE @isPrime BIT = 1;
WHILE @min <= @max
BEGIN
	DECLARE @current INT = 2;

	WHILE @current * @current <= @min
	BEGIN 
	--PRINT ' @min /2 '+ CAST(@min /2 AS NVARCHAR(100)) 
	--PRINT ' @min %2 '+ CAST(@min % 2 AS NVARCHAR(100)) 
	 IF @min % @current = 0
	 BREAK
	 SET @current +=1;
	END

	IF @min % @current != 0
	begin
	PRINT 'простое число: '+ CAST(@min AS NVARCHAR(100))
	--PRINT ' current'+ CAST(@current AS NVARCHAR(100))
	--PRINT ' var'+ CAST(@min AS NVARCHAR(100))
	PRINT ' '
	end
	SET @min +=1;
END
*/

/*
8. Показать таблицу Пифагора (результаты - выборка 10 на 10, в табличном виде, селектом)*/
/*
DECLARE  @max INT = 10;
DECLARE @i INT = 1, @j INT;

DECLARE @resPifagor TABLE
(
i INT,
j INT,
res INT
);

WHILE @i <=@max
BEGIN
    SET @j = 1;
	WHILE @j <=@max
	BEGIN
	INSERT INTO @resPifagor(i, j, res) 
	VALUES (@i, @j, @i * @j)
	SET @j +=1;
	END
	SET @i +=1;
END

SELECT i, 
       [1] AS 'Column1', 
       [2] AS 'Column2',
       [3] AS 'Column3',
       [4] AS 'Column4',
       [5] AS 'Column5',
       [6] AS 'Column6',
       [7] AS 'Column7',
       [8] AS 'Column8',
       [9] AS 'Column9',
       [10] AS 'Column10'
FROM (
    SELECT i, j, res
    FROM @resPifagor
) AS SourceTable
PIVOT (
    MAX(res)
    FOR j IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10])
) AS PivotTable
ORDER BY i;

*/
/*
9. Показать номера всех счастливых трамвайных билетов
*/

/*DECLARE @ticketNumbers TABLE
(
    number INT
);

DECLARE @max INT = 999999, 
        @i INT = 0;

WHILE @i <= @max
BEGIN
    DECLARE @RIGHT INT = @i / 1000,
            @LEFT INT = @i % 1000,
            @countLeft INT = 0,
            @countRight INT = 0;

    WHILE @RIGHT > 0
    BEGIN
        SET @countRight = @countRight + @RIGHT % 10;
        SET @RIGHT = @RIGHT / 10;
    END

    WHILE @LEFT > 0
    BEGIN
        SET @countLeft = @countLeft + @LEFT % 10;                
        SET @LEFT = @LEFT / 10;
    END

    IF @countRight = @countLeft
        INSERT INTO @ticketNumbers VALUES(@i);

    SET @i = @i + 1;
END

SELECT * FROM @ticketNumbers;
*/


/*
10. Реализовать на языке Transact-SQL игровой автомат "однорукий бандит". В начале игры есть некий стартовый капитал, например,
пять тысяч гривен. Для начала игры необходимо нажать F5. стоимость одного нажатия - 10 гривен. При нажатии генерирутся
три случайных числа (от 0 до 7). Если все три числа одинаковые, назначить приз (например, 50 гривен).
Кроме трёх случайных чисел показывать текущее состояние счёта. Игра завершается поражением, если закончились деньги.
Сбалансировать игру (можно сделать минимум 50 нажатий на F5 до проигрыша).
*/
/*
IF NOT EXISTS(SELECT* FROM sys.databases WHERE name = 'SlotMachine')
BEGIN
CREATE DATABASE SlotMachine
ON
(
NAME = 'SlotMachine',
FILENAME = 'D:\DB\projects\homework8\SlotMachine.mdf',
SIZE = 10MB,
MAXSIZE = 100MB,
FILEGROWTH=100MB
)
LOG ON
(
NAME = 'SlotMachine_log',
FILENAME = 'D:\DB\projects\homework8\SlotMachine.ldf',
SIZE = 5MB,
MAXSIZE = 50MB,
FILEGROWTH=50MB
)

END

GO

use SlotMachine;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Wallet')
BEGIN
CREATE TABLE Wallet
(
id INT Identity(1,1) PRIMARY KEY NOT NULL,
moneyCount INT NULL,
tryNumber INT NULL
)

INSERT INTO Wallet VALUES(5000, 0);
END

GO

DECLARE @moneyCount INT, @tryNumber INT;
SELECT @tryNumber = tryNumber, @moneyCount = moneyCount FROM Wallet WHERE id = 1;

IF @tryNumber < 50
BEGIN
    IF @moneyCount >= 10 
    BEGIN
        UPDATE Wallet
        SET tryNumber = tryNumber + 1, moneyCount = moneyCount - 10
        WHERE id = 1;

        SELECT @moneyCount = moneyCount, @tryNumber = tryNumber FROM Wallet WHERE id = 1;

        PRINT 'Текущий счет: ' + CAST(@moneyCount AS VARCHAR) + ' грн.';
        PRINT 'Количество попыток: ' + CAST(@tryNumber AS VARCHAR);

        -- Генерация случайных чисел
        DECLARE @number1 INT = FLOOR(RAND() * 8); -- Случайное число от 0 до 7
        DECLARE @number2 INT = FLOOR(RAND() * 8);
        DECLARE @number3 INT = FLOOR(RAND() * 8);

        PRINT 'Число 1: ' + CAST(@number1 AS VARCHAR);
        PRINT 'Число 2: ' + CAST(@number2 AS VARCHAR);
        PRINT 'Число 3: ' + CAST(@number3 AS VARCHAR);

        -- Проверка на выигрыш
        IF @number1 = @number2 AND @number2 = @number3
        BEGIN
            PRINT 'ВЫИГРЫШ 50 грн.!!';
            UPDATE Wallet
            SET moneyCount = moneyCount + 50
            WHERE id = 1;
        END
        ELSE
        BEGIN
            PRINT 'Попробуйте снова!';
        END
    END
    ELSE
    BEGIN
        PRINT 'На Вашем счету недостаточно денег для игры.';
    END
END
ELSE
BEGIN
    PRINT 'Вы исчерпали количество попыток. Игра завершена.';
END

SELECT * FROM Wallet;
*/

/*
============================================================================================

STRINGS:

1. Ввести строку, а затем символ. Показать на экран индексы и количество совпадений.
*/
/*
DECLARE @userString NVARCHAR(100), 
		@charToFind NCHAR(1);

SET @userString = 'Нажал кабан на баклажан.';
SET @charToFind = 'а';

DECLARE @ind INT = 1, @count INT = 0;
WHILE @ind <= LEN(@userString)
	BEGIN
		IF SUBSTRING(@userString, @ind, 1) = @charToFind
			BEGIN
				PRINT 'Символ найден на позиции: ' + CAST(@ind	AS NVARCHAR);
				SET @count = @count + 1;
			END
			SET @ind = @ind +1;
	END
	PRINT 'Количество найденных символов = ' + CAST(@count AS NVARCHAR);
*/

/*
2. Подсчитать количество слов во введённом предложении.*/
/*
DECLARE @temp TABLE		--CREATE TABLE #temp
(
word NVARCHAR(100)
);

DECLARE @userString NVARCHAR(100)= 'Нажал кабан на баклажан.';

INSERT INTO @temp(word)
SELECT VALUE FROM STRING_SPLIT(@userString, ' ');

DECLARE @wordCount INT = 0;

SELECT @wordCount = COUNT(1) FROM @temp;
PRINT @wordCount;

SELECT @wordCount =  COUNT(1)
					  FROM  STRING_SPLIT(@userString, ' ') ; 
PRINT @wordCount;
*/

/*
3. Определить, является ли строка палиндромом. Примеры палиндромов:
   Нажал кабан на баклажан.
   Я так нежен, Катя.*/

   /*
--IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = 'PROCEDURE' AND ROUTINE_NAME = 'isAlpha')
--BEGIN
--	DROP PROCEDURE isAlpha;
--END
--
--GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = 'PROCEDURE' AND ROUTINE_NAME = 'isAlpha')
BEGIN
    EXEC('
    CREATE PROCEDURE isAlpha
        @char NVARCHAR(1),
        @res BIT OUTPUT
    AS
    BEGIN
        SET @res = 0;
        IF (UNICODE(@char) BETWEEN 65 AND 90) 
            OR (UNICODE(@char) BETWEEN 97 AND 122)  
            OR (UNICODE(@char) BETWEEN 1040 AND 1103)  
        BEGIN
            SET @res = 1; 
        END
    END
    ');
END;



GO

--IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = 'PROCEDURE' AND ROUTINE_NAME = 'isAlpha')
--BEGIN
--	PRINT 'PROCEDURE IS ON BOARD!';
--END


  DECLARE @userString NVARCHAR(100)= 'Нажал кабан на баклажан.', @str NVARCHAR(100) = '';
  DECLARE @i INT = 1, @j INT = LEN(@userString);
  DECLARE @result BIT, @curChar NCHAR(1);

  SET @userString = LOWER(@userString);
  WHILE @i <=@j
  BEGIN
	SET @curChar = SUBSTRING(@userString, @i, 1)
	EXEC isAlpha @char = @curChar, @res = @result OUTPUT;
	--PRINT @result;
	IF @result = 1
	BEGIN
		SET @str = @str + @curChar;
	END
	SET @i = @i +1;
  END
 --print @str;
  
  SET @i = 1;
  SET @j = LEN(@str);
  SET @result = 1;

  WHILE @i < @j
  BEGIN
  --print @i
  --print @j
  --print 'i ' + CAST(SUBSTRING(@str, @i, 1) as nvarchar) +  ' j ' + CAST(SUBSTRING(@str, @j, 1) as nvarchar) 

	IF SUBSTRING(@str, @i, 1) != SUBSTRING(@str, @j, 1)
	BEGIN
		SET @result = 0;
		--BREAK;
	END

	SET @i = @i + 1; 
    SET @j = @j - 1; 
  END

  IF @result = 0
	PRINT 'Строка ''' + @userString + ''' НЕ является палиндромом';
  ELSE
	PRINT 'Строка ''' + @userString + ''' является палиндромом';*/


   /*
4. Посчитать, сколько раз заданное слово содержится в строке.*/
/*

DECLARE @temp TABLE		--CREATE TABLE #temp
(
word NVARCHAR(100)
);

DECLARE @userString NVARCHAR(100)= 'Нажал кабан на баклажан. Нажал кабан на баклажан.';
DECLARE @wordToSearch NVARCHAR(100) = 'баклажан';
INSERT INTO @temp(word)
SELECT VALUE FROM STRING_SPLIT(@userString, ' ');

DECLARE @wordCount INT = 0;

SELECT @wordCount = COUNT(1) FROM @temp where word like '%' + @wordToSearch + '%';
PRINT 'количество слов ' + @wordToSearch + ' = ' + CAST(@wordCount AS NVARCHAR);
*/

/*
============================================================================================

Основные отличия между вью и процедурой:
Характеристика	Представление (VIEW)	Хранимая процедура (Stored Procedure)
Цель	Представляет данные, как таблица.	Выполняет операции с данными (выборка, обновление, вставка и т.д.).
Логика	Нет логики, только запрос.	Содержит логику, может включать условия, циклы и т. д.
Параметры	Не принимает параметры.	Может принимать параметры для выполнения действий.
Изменение данных	Не изменяет данные (только читает).	Может изменять данные в базе (например, обновление, вставка).
Использование	Используется для выполнения простых запросов, как таблица.	Используется для выполнения более сложных операций.
Возврат данных	Всегда возвращает набор данных (результат SELECT).	Может возвращать данные через SELECT или параметры OUTPUT.
3. Похожие моменты:
И вью, и процедуры могут быть сохранены в базе данных.
Обе могут использоваться повторно после создания.
Процедуры могут также возвращать данные (например, через SELECT), но основной их задачей является выполнение операций, а не только отображение информации.

CURSORS:

1. Напишите запрос, который определяет тип каждой записи в таблице TRIANGLES с использованием длин её трёх сторон.
Для каждой записи в таблице выведите одно из следующих утверждений:
   Равносторонний: Это треугольник с равными длинами сторон.
   Равнобедренный: Это треугольник с двумя равными сторонами.
   Разносторонний: Это треугольник с разными длинами сторон.
   Не треугольник: Указанные значения A, B и C не могут образовать треугольник.
Таблица TRIANGLES описана следующим образом:
 A  B  C
20 20 20
20 20 21
20 21 22
20 21 60
Каждая строка в таблице обозначает длины трёх сторон треугольника.
Пример вывода:
  Равносторонний
  Равнобедренный
  Разносторонний
  Не треугольник
  */
  /*
  IF NOT EXISTS(SELECT* FROM sys.databases WHERE name = 'Geometry')
BEGIN
CREATE DATABASE Geometry
ON
(
NAME = 'Geometry',
FILENAME = 'D:\DB\projects\homework8\Geometry.mdf',
SIZE = 10MB,
MAXSIZE = 100MB,
FILEGROWTH=100MB
)
LOG ON
(
NAME = 'Geometry_log',
FILENAME = 'D:\DB\projects\homework8\Geometry.ldf',
SIZE = 5MB,
MAXSIZE = 50MB,
FILEGROWTH=50MB
)

END

GO

use Geometry;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Figure')
BEGIN
CREATE TABLE Figure
(
id INT Identity(1,1) PRIMARY KEY NOT NULL,
A DECIMAL(10,2) NOT NULL,
B DECIMAL(10,2) NOT NULL,
C DECIMAL(10,2) NOT NULL
)

INSERT INTO Figure VALUES(20, 20, 20),
						(20, 20, 21),
						(20, 21, 22),
						(20, 21, 60)
END

GO

DECLARE @A DECIMAL(10,2), @B DECIMAL(10,2), @C DECIMAL(10,2);
DECLARE figureCurs CURSOR FOR
SELECT A, B, C
FROM Figure;

OPEN figureCurs;

FETCH NEXT FROM figureCurs INTO @A, @B, @C;
WHILE @@FETCH_STATUS !=-1
BEGIN
	DECLARE @outStr NVARCHAR(100) = 'A: ' + CAST(@A AS NVARCHAR(5)) + ' B: ' + CAST(@B AS NVARCHAR(5)) + ' C: ' + CAST(@C AS NVARCHAR(5));

	IF @A + @B <= @C OR @A + @C <= @B OR @B + @C <= @A --@A * @A + @B * @B != @C *@C AND @A * @A + @C *@C != @B * @B AND @B * @B + @C *@C != @A * @A
	BEGIN
		SET @outStr = @outStr + ' - не треугольник';
	END
	ELSE IF @A = @B AND @B = @C
	BEGIN
		SET @outStr = @outStr + ' - равносторонний треугольник';
	END
	ELSE IF @A=@B OR @B=@C OR @A = @C
	BEGIN
		SET @outStr = @outStr + ' - равнобедренный треугольник';
	END
	ELSE IF @A!=@B AND @B!=@C AND @A != @C
	BEGIN
		SET @outStr = @outStr + ' - разносторонний треугольник';
	END

	PRINT @outStr;
	FETCH NEXT FROM figureCurs INTO @A, @B, @C;
END


CLOSE figureCurs;
DEALLOCATE figureCurs;
*/
  /*
2. Показать список всех таблиц определённой БД (которую не жалко), количество записей в каждой из её таблиц,
и общий размер каждой таблицы в байтах. Удалить все таблицы:
  размер которых менее 100КБ
  в которых нет записей
*/IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Cirle')
BEGIN
    CREATE TABLE Cirle
    (
        id INT Identity(1,1) PRIMARY KEY NOT NULL,
        radius DECIMAL(10,2) NOT NULL
    )

    INSERT INTO Cirle VALUES(20),
                            (30),
                            (40),
                            (50)
END
GO

DECLARE @summaryTable TABLE(
    TableName NVARCHAR(100),
    SchemaName NVARCHAR(100),
    RowCounts INT,
    TotalSpaceMB DECIMAL(10,2),
    UsedSpaceMB DECIMAL(10,2),
    UnusedSpaceMB DECIMAL(10,2)
);

INSERT INTO @summaryTable
SELECT 
    t.name AS TableName,
    s.name AS SchemaName,
    p.rows AS RowCounts,
    SUM(a.total_pages) * 8 / 1024 AS TotalSpaceMB,
    SUM(a.used_pages) * 8 / 1024 AS UsedSpaceMB,
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 / 1024 AS UnusedSpaceMB
FROM 
    sys.tables t
INNER JOIN 
    sys.indexes i ON t.object_id = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.object_id AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
INNER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.is_ms_shipped = 0
GROUP BY 
    t.name, s.name, p.rows
ORDER BY 
    TotalSpaceMB DESC;

SELECT * FROM @summaryTable;

DECLARE tableCurs CURSOR FOR
SELECT TableName, UsedSpaceMB
FROM @summaryTable
WHERE UsedSpaceMB < 100 OR RowCounts = 0; 

OPEN tableCurs;

DECLARE @tName NVARCHAR(100);
DECLARE @MB DECIMAL(10,2);

FETCH NEXT FROM tableCurs INTO @tName, @MB;

WHILE @@FETCH_STATUS != -1
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = 'DROP TABLE ' + QUOTENAME(@tName);

    EXEC sp_executesql @sql;

    FETCH NEXT FROM tableCurs INTO @tName, @MB;
END

CLOSE tableCurs;
DEALLOCATE tableCurs;
