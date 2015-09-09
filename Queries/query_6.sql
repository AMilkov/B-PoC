-- Customers ordered by AMTFIN
SELECT DC.CUSTOMERID,FM.d_productflag_id,FM.AMTFIN
FROM BAJAJ_DM.F_monthly2 FM
JOIN BAJAJ_DM.F_customer DC ON FM.CUSTOMERKEY=DC.CUSTOMERKEY
WHERE FM.BUSINESS_DATE='2015-05-31'
ORDER BY FM.AMTFIN DESC;
-- 2626087 rows in set (36.84 sec)


-- Alternative high concurency & high performance approach to the ranking task
-- Technique to compute the RANK during the incremental daily or monthly ETL process
INSERT INTO BAJAJ_DM.rank_statistics (BUSINESS_DATE, CUSTOMERKEY, AMTFIN)
(
    SELECT '2015-05-31', CUSTOMERKEY, AMTFIN
    FROM BAJAJ_DM.F_monthly2
    WHERE BUSINESS_DATE='2015-05-31'
    ORDER BY AMTFIN DESC
);




----------------------
-- RANK Customer AMTFIN
-- 10 loans for particular CUSTOMERID
-- AMTFIN amount taken,
-- rows: 16M, speed:
SELECT DC.CUSTOMERID,FM.PRODUCTFLAG,FM.AMTFIN,RANK() OVER ( PARTITION BY DC.CUSTOMERID ORDER BY FM.AMTFIN DESC )
FROM facmonthly FM
JOIN DimCustomer DC ON FM.CUSTOMERKEY=DC.CUSTOMERKEY
WHERE FM.BUSINESS_DATE='2015-05-31'

