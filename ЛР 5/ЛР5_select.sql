-- гюбдюммъ 1 --

USE WebStor;

SELECT EMPL_NUM, [NAME], AGE, TITLE			/*гюдю╙лн б╡донб╡дм╡ йнкнмйх б╡донб╡дмн╞ рюакхж╡*/
	FROM [dbo].[SALESREPS]					
		WHERE AGE > 45						/*янпрс╙лн гю б╡йнл*/
			ORDER BY AGE DESC;				/*бонпъдйнбс╙лн гю яоюдюммъл б╡йс*/


-- гюбдюммъ 2 --

SELECT DISTINCT MFR, [PRODUCT]
	FROM [dbo].[ORDERS]
		WHERE ORDER_DATE BETWEEN '20080101' AND '20081231';


-- гюбдбммъ 3 --


SELECT TOP 10 WITH TIES QTY, REP 
	FROM [dbo].[ORDERS]
		WHERE ORDER_DATE BETWEEN '20080101' AND '20081231'
			ORDER BY QTY DESC; 


