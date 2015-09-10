-- Customers ordered by AMTFIN
SELECT DC.CUSTOMERID,FM.d_productflag_id,FM.AMTFIN
FROM BAJAJ_DM.F_monthly2 FM
JOIN BAJAJ_DM.F_customer DC ON FM.CUSTOMERKEY=DC.CUSTOMERKEY
WHERE FM.BUSINESS_DATE='2015-05-31'
ORDER BY FM.AMTFIN DESC;
-- 2626087 rows in set (39 sec)


-- Alternative high concurency & high performance approach to the ranking task
-- Technique to compute the RANK only once during the incremental daily or monthly ETL process
DROP TABLE IF EXISTS BAJAJ_DM.rank_statistics_2015_05;
CREATE TABLE BAJAJ_DM.rank_statistics_2015_05 (
    rank BIGINT NOT NULL AUTO_INCREMENT,
    BUSINESS_DATE DATE NOT NULL,
    CUSTOMERKEY int(11) DEFAULT NULL,
    AMTFIN decimal(16,2) DEFAULT NULL,
    PRIMARY KEY (rank)
) ENGINE = MyISAM;
ALTER TABLE BAJAJ_DM.rank_statistics_2015_05 AUTO_INCREMENT = 1;
INSERT INTO BAJAJ_DM.rank_statistics_2015_05 (BUSINESS_DATE, CUSTOMERKEY, AMTFIN)
(
    SELECT '2015-05-31', CUSTOMERKEY, AMTFIN
    FROM BAJAJ_DM.F_monthly2
    WHERE BUSINESS_DATE='2015-05-31'
    ORDER BY AMTFIN DESC
);
-- Query OK, 13133853 rows affected (1 min 15.62 sec)

-- List of the top 1M clients ranked by AMTFIN
SELECT * FROM BAJAJ_DM.rank_statistics_2015_05 ORDER BY rank LIMIT 1000000;
-- 1000000 rows in set (4 sec)

-- Same as above, but with grouping on CUSTOMERKEY and calculating loan totals per customer 
DROP TABLE IF EXISTS BAJAJ_DM.rank_statistics_totals_2015_05;
CREATE TABLE BAJAJ_DM.rank_statistics_totals_2015_05 (
    rank BIGINT NOT NULL AUTO_INCREMENT,
    BUSINESS_DATE DATE NOT NULL,
    CUSTOMERKEY int(11) DEFAULT NULL,
    AMTFIN decimal(16,2) DEFAULT NULL,
    PRIMARY KEY (rank)
) ENGINE = MyISAM;
ALTER TABLE BAJAJ_DM.rank_statistics_totals_2015_05 AUTO_INCREMENT = 1;
INSERT INTO BAJAJ_DM.rank_statistics_totals_2015_05 (BUSINESS_DATE, CUSTOMERKEY, AMTFIN)
(
    SELECT MAX('2015-05-31'), CUSTOMERKEY, SUM(AMTFIN)
    FROM BAJAJ_DM.F_monthly2
    WHERE BUSINESS_DATE='2015-05-31'
    GROUP BY CUSTOMERKEY
    ORDER BY SUM(AMTFIN) DESC
);
-- Query OK, 7552905 rows affected (1 min 18.04 sec)

-- List of the top 1M clients ranked by AMTFIN with calculated totals
SELECT * FROM BAJAJ_DM.rank_statistics_totals_2015_05 ORDER BY rank LIMIT 1000000;
-- 
