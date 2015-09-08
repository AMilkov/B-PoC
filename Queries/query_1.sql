
-- Original multi-join approach
SELECT A.APPLID,
     A.LMS_BUCKET,
     B.LMS_BUCKET AS LMS_BUCKET_1,
     C.LMS_BUCKET AS LMS_BUCKET_2,
     D.LMS_BUCKET AS LMS_BUCKET_3,
     E.LMS_BUCKET AS LMS_BUCKET_4,
     F.LMS_BUCKET AS LMS_BUCKET_5,
     G.LMS_BUCKET AS LMS_BUCKET_6,
     H.LMS_BUCKET AS LMS_BUCKET_7,
     I.LMS_BUCKET AS LMS_BUCKET_8,
     J.LMS_BUCKET AS LMS_BUCKET_9,
     K.LMS_BUCKET AS LMS_BUCKET_10
FROM BAJAJ_DM.F_monthly1 A
     INNER JOIN BAJAJ_DM.F_monthly1 B ON A.APPLID=B.APPLID
     INNER JOIN BAJAJ_DM.F_monthly1 C ON A.APPLID=C.APPLID
     INNER JOIN BAJAJ_DM.F_monthly1 D ON A.APPLID=D.APPLID
     INNER JOIN BAJAJ_DM.F_monthly1 E ON A.APPLID=E.APPLID
     INNER JOIN BAJAJ_DM.F_monthly1 F ON A.APPLID=F.APPLID
     INNER JOIN BAJAJ_DM.F_monthly1 G ON A.APPLID=G.APPLID
     INNER JOIN BAJAJ_DM.F_monthly1 H ON A.APPLID=H.APPLID
     INNER JOIN BAJAJ_DM.F_monthly1 I ON A.APPLID=I.APPLID
     INNER JOIN BAJAJ_DM.F_monthly1 J ON A.APPLID=J.APPLID
     INNER JOIN BAJAJ_DM.F_monthly1 K ON A.APPLID=K.APPLID
WHERE A.BUSINESS_DATE='2014-07-31'  
     AND B.BUSINESS_DATE='2014-08-31'
     AND C.BUSINESS_DATE='2014-09-30'
     AND D.BUSINESS_DATE='2014-10-31'
     AND E.BUSINESS_DATE='2014-11-30'
     AND F.BUSINESS_DATE='2014-12-31'
     AND G.BUSINESS_DATE='2015-01-31'
     AND H.BUSINESS_DATE='2015-02-28'
     AND I.BUSINESS_DATE='2015-03-31'
     AND J.BUSINESS_DATE='2015-04-30'
     AND K.BUSINESS_DATE='2015-05-31';
-- 102874 rows in set (7.54 sec)

