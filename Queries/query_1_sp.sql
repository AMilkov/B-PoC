
-- Single-pass query optimized for parallel processing 
SELECT APPLID,
    SUM(CASE WHEN BUSINESS_DATE='2014-07-31' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_1,
    SUM(CASE WHEN BUSINESS_DATE='2014-08-31' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_2,
    SUM(CASE WHEN BUSINESS_DATE='2014-09-30' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_3,
    SUM(CASE WHEN BUSINESS_DATE='2014-10-31' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_4,
    SUM(CASE WHEN BUSINESS_DATE='2014-11-30' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_5,
    SUM(CASE WHEN BUSINESS_DATE='2014-12-31' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_6,
    SUM(CASE WHEN BUSINESS_DATE='2015-01-31' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_7,
    SUM(CASE WHEN BUSINESS_DATE='2015-02-28' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_8,
    SUM(CASE WHEN BUSINESS_DATE='2015-03-31' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_9,
    SUM(CASE WHEN BUSINESS_DATE='2015-04-30' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_10,
    SUM(CASE WHEN BUSINESS_DATE='2015-05-31' THEN LMS_BUCKET ELSE 0 END) AS LMS_BUCKET_11
FROM BAJAJ_DM.F_monthly1
GROUP BY APPLID;
-- 16,719,588 rows in set (6 min 41.97 sec)
