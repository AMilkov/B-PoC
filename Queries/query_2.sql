-- Using F_monthly1
SELECT B.EXISTING_LANNO, Case WHEN B.POS=0 THEN 'BALIC_LOAN_TAKEN' ELSE 'BALIC_LOAN_NOT_TAKEN' END AS BALIC_LOAN_STATUS
FROM BAJAJ_DM.F_monthly1 A
INNER JOIN
(
    SELECT EXISTING_LANNO, BUSINESS_DATE, SUM(POS) AS POS FROM BAJAJ_DM.F_monthly1
    WHERE d_balic_flag=1
    GROUP BY EXISTING_LANNO, BUSINESS_DATE
) B
ON A.AGREEMENTNO=B.EXISTING_LANNO AND A.BUSINESS_DATE=B.BUSINESS_DATE
WHERE A.BUSINESS_DATE='2015-05-31';
-- 1722 rows in set (2.12 sec)


-- NB: This query can be further improved by creating separate fact or dimension table to store the sub-query result set. The current size of the set is 28,656 rows.
