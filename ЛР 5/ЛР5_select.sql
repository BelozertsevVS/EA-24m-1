-- �������� 1 --

USE WebStor;

SELECT EMPL_NUM, [NAME], AGE, TITLE			/*������� ²���²�Ͳ ������� ²���²��ί �����ֲ*/
	FROM [dbo].[SALESREPS]					
		WHERE AGE > 45						/*����Ӫ�� �� ²���*/
			ORDER BY AGE DESC;				/*���������Ӫ�� �� ��������� ²��*/


-- �������� 2 --

SELECT DISTINCT MFR, [PRODUCT]
	FROM [dbo].[ORDERS]
		WHERE ORDER_DATE BETWEEN '20080101' AND '20081231';


-- �������� 3 --


SELECT TOP 10 WITH TIES QTY, REP 
	FROM [dbo].[ORDERS]
		WHERE ORDER_DATE BETWEEN '20080101' AND '20081231'
			ORDER BY QTY DESC; 


