﻿-- USE WebStor;

/* SELECT 
    [EMPL_NUM], 
    [NAME], 
    [AGE], 
    [TITLE]
FROM 
    [dbo].[SALESREPS]
WHERE 
    [AGE] > 45
ORDER BY 
    [AGE] DESC; */

/* SELECT DISTINCT 
    [MFR], 
    [PRODUCT]
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR([ORDER_DATE]) = 2008; */

/* SELECT TOP 1 WITH TIES
    [REP], 
    COUNT(*) AS [ORDER_COUNT]
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR([ORDER_DATE]) = 2008
GROUP BY 
    [REP]
ORDER BY 
    [ORDER_COUNT] DESC; */
