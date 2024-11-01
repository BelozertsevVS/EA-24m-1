-- Оператори порівняння. Предикати. Логічні оператори. Строкові функції. Функії дати та часу. Математичні функції


/*
Оператори порівняння дозволяють здійснювати порівняння значень у SQL Server. Основні оператори порівняння включають:

= (дорівнює)

> (більше)

< (менше)

>= (більше або дорівнює)

<= (менше або дорівнює)

<> (не дорівнює)

!= (не дорівнює, не є стандартом ISO)

!< (не менше, не є стандартом ISO)

!> (не більше, не є стандартом ISO)

*/


-- =
SELECT *
FROM [dbo].[OFFICES] AS f;

SELECT *
FROM [dbo].[OFFICES] AS f
WHERE f.CITY = 'Los Angeles'
;


-- >, <, <=, >=, !=  ......

SELECT *
FROM [dbo].[OFFICES] AS f;

SELECT *
  FROM [dbo].[OFFICES] AS f
 WHERE f.[TARGET] >= 350000;




 -- Предикати

/* 

IS NULL / IS NOT NULL: для перевірки на порожні значення

BETWEEN / NOT BETWEEN: для перевірки входження в діапазон

IN / NOT IN: для перевірки належності до списку значень

LIKE / NOT LIKE: для порівняння з шаблоном

*/


-- IS NULL / IS NOT NULL
SELECT *
  FROM [dbo].[SALESREPS] AS s
;

SELECT *
  FROM [dbo].[SALESREPS] AS s
WHERE [MANAGER] IS NOT NULL
;

-- BETWEEN / NOT BETWEEN
SELECT *
  FROM [dbo].[SALESREPS] AS s
;

SELECT *
  FROM [dbo].[SALESREPS] AS s
WHERE s.HIRE_DATE BETWEEN '20060101' AND '20061231'
;

SELECT *
  FROM [dbo].[SALESREPS] AS s
WHERE YEAR(s.HIRE_DATE) = 2006
;


-- IN / NOT IN
SELECT *
  FROM [dbo].[SALESREPS] AS s
;

SELECT *
  FROM [dbo].[SALESREPS] AS s
WHERE s.REP_OFFICE NOT IN (11, 12, 13)
;

SELECT *
  FROM [dbo].[SALESREPS] AS s
WHERE s.REP_OFFICE BETWEEN 11 AND 13
;

-- LIKE / NOT LIKE
SELECT *
  FROM [dbo].[PRODUCTS] p
 WHERE p.DESCRIPTION LIKE 'Size 1 Wiget'
;

-- Підстановочні символи
--  %  (Заміщає будь-яку кількість символів (включаючи 0). 
--      Його можна використовувати на початку, в кінці або посередині рядка.)
SELECT *
  FROM [dbo].[PRODUCTS] p
 WHERE p.DESCRIPTION LIKE 'S%'
;

--  _
-- Заміщає один будь-який символ. Використовується для пошуку рядків, що відповідають точній кількості 
-- символів із можливістю однієї змінної позиції

SELECT *
  FROM [dbo].[PRODUCTS] p
 WHERE p.DESCRIPTION LIKE '_a%'
;

--  []
-- Дозволяють вказати набір символів для підстановки в певну позицію. 
-- Вони шукають будь-який з символів у заданому діапазоні чи наборі.
SELECT *
  FROM [dbo].[PRODUCTS] p;

SELECT *
  FROM [dbo].[PRODUCTS] p
 WHERE p.DESCRIPTION LIKE '[A-C]%'
;

-- [^]
-- Використовується всередині квадратних дужок, щоб вказати будь-який символ, крім зазначених
SELECT *
  FROM [dbo].[PRODUCTS] p;

SELECT *
  FROM [dbo].[PRODUCTS] p
 WHERE p.DESCRIPTION LIKE '[^s]%'
;



-- Логічні оператори
/*

NOT - інвертує значення предиката

OR  - повертає TRUE, якщо будь-яка з умов істинна

AND - повертає TRUE, якщо всі умови істинні 

*/


-- AND
SELECT *
FROM [dbo].[ORDERS] o
;

SELECT *
FROM [dbo].[ORDERS] o
WHERE o.ORDER_DATE BETWEEN '20070101' AND '20071231'
                   AND o.PRODUCT LIKE '2A44_' 
				   AND o.AMOUNT >= 20000
;


-- OR
SELECT *
FROM [dbo].[ORDERS] o
;

SELECT *
  FROM [dbo].[ORDERS] o
 WHERE o.CUST = 2117 OR o.CUST = 2114 OR o.CUST = 2103
;


-- Приклад помилки у використанні AND та OR
SELECT *
FROM [dbo].[ORDERS] o
WHERE o.ORDER_DATE BETWEEN '20070101' AND '20071231'
AND o.CUST = 2117 OR o.CUST = 2114 OR o.CUST = 2103
;

SELECT *
FROM [dbo].[ORDERS] o
WHERE (o.ORDER_DATE BETWEEN '20080101' AND '20081231')
      AND (o.MFR = 'ACI' OR o.MFR = 'REI'); 

SELECT *
FROM [dbo].[ORDERS] o
WHERE o.ORDER_DATE BETWEEN '20080101' AND '20081231'
      AND o.MFR = 'ACI' OR o.MFR = 'REI'; 


-- Строкові функції

/*
UPPER / LOWER           перетворює всі літери рядка у верхній регістр / перетворює всі літери рядка у нижній регістр
LEN / DATALENGTH        повертає кількість символів у рядку, не враховуючи хвостові пробіли / повертає кількість байтів, займаних рядком, включаючи хвостові пробіли 
CONCAT / CONCAT_WS      об'єднання строк
REPLACE                 заміна символів у рядку
LEFT / RIGHT            вибірка символів з початку або кінця рядка

*/

-- UPPER / LOWER

SELECT p.[DESCRIPTION],
       UPPER(p.[DESCRIPTION]) AS UpperDescr,
       LOWER(p.[DESCRIPTION]) AS LowerDescr
  FROM [dbo].[PRODUCTS] p;


-- LEN / DATALENGTH
SELECT p.[DESCRIPTION],
       LEN(p.[DESCRIPTION]) AS [LEN],
       DATALENGTH(p.[DESCRIPTION]) AS DATALENGTH,
	   p.[PRODUCT_ID],
	   LEN(p.PRODUCT_ID) AS [LEN],
       DATALENGTH(p.PRODUCT_ID) AS DATALENGTH
  FROM [dbo].[PRODUCTS] p;

