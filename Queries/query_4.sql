-- Using F_monthly1
SELECT  
    C.AGREEMENTNO CHILD_AGREEMENTNO,
    P.AGREEMENTNO PARENT_AGREEMENTNO,
    CC.CUSTOMERID CHILD_CUSTOMERID,
    CP.CUSTOMERID PARENT_CUSTOMERID
FROM BAJAJ_DM.F_monthly1 C
    INNER JOIN BAJAJ_DM.F_monthly1 P ON C.EXISTING_LANNO=P.AGREEMENTNO
    INNER JOIN BAJAJ_DM.F_customer CC ON C.CUSTOMERKEY=CC.CUSTOMERKEY
    INNER JOIN BAJAJ_DM.F_customer CP ON P.CUSTOMERKEY=CP.CUSTOMERKEY  
WHERE C.BUSINESS_DATE='2015-05-31'
    AND P.BUSINESS_DATE='2015-05-31'
    AND CC.CUSTOMERKEY<>CP.CUSTOMERKEY;

-- Using F_monthly2
SELECT  
    C.AGREEMENTNO CHILD_AGREEMENTNO,
    P.AGREEMENTNO PARENT_AGREEMENTNO,
    CC.CUSTOMERID CHILD_CUSTOMERID,
    CP.CUSTOMERID PARENT_CUSTOMERID
FROM BAJAJ_DM.F_monthly2 C
    INNER JOIN BAJAJ_DM.F_monthly2 P ON C.EXISTING_LANNO=P.AGREEMENTNO
    INNER JOIN BAJAJ_DM.F_customer CC ON C.CUSTOMERKEY=CC.CUSTOMERKEY
    INNER JOIN BAJAJ_DM.F_customer CP ON P.CUSTOMERKEY=CP.CUSTOMERKEY  
WHERE C.BUSINESS_DATE='2015-05-31'
    AND P.BUSINESS_DATE='2015-05-31'
    AND CC.CUSTOMERKEY<>CP.CUSTOMERKEY;
-- 304 rows in set (13.86 sec)


--- PARENT LAN CustomerID Recon
-- Same as the previous one
SELECT  C.AGREEMENTNO CHILD_AGREEMENTNO ,
                                P.AGREEMENTNO PARENT_AGREEMENTNO,
                                CC.CUSTOMERID CHILD_CUSTOMERID,
                                CP.CUSTOMERID PARENT_CUSTOMERID
FROM FACMONTHLY C
                INNER JOIN FACMONTHLY P ON C.EXISTING_LANNO=P.AGREEMENTNO
                INNER JOIN DimCustomer CC ON C.CUSTOMERKEY=CC.CUSTOMERKEY
                INNER JOIN DimCustomer CP ON P.CUSTOMERKEY=CP.CUSTOMERKEY  
WHERE C.BUSINESS_DATE='31-Jul-15'
and P.BUSINESS_DATE='31-Jul-15'
AND CC.CUSTOMERKEY<>CP.CUSTOMERKEY;
