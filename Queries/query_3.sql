-- Using F_monthly1
SELECT  C.AGREEMENTNO CHILD_AGREEMENTNO ,
    P.AGREEMENTNO PARENT_AGREEMENTNO,
    C.CUSTOMERKEY CHILD_CUSTOMERKEY,
    P.CUSTOMERKEY PARENT_CUSTOMERKEY
FROM BAJAJ_DM.F_monthly1 C
    INNER JOIN BAJAJ_DM.F_monthly1 P ON C.EXISTING_LANNO=P.AGREEMENTNO
WHERE   C.BUSINESS_DATE='2015-05-31'
    AND P.BUSINESS_DATE='2015-05-31'
    AND C.CUSTOMERKEY<>P.CUSTOMERKEY;

-- Using F_monthly2
SELECT  C.AGREEMENTNO CHILD_AGREEMENTNO ,
    P.AGREEMENTNO PARENT_AGREEMENTNO,
    C.CUSTOMERKEY CHILD_CUSTOMERKEY,
    P.CUSTOMERKEY PARENT_CUSTOMERKEY
FROM BAJAJ_DM.F_monthly2 C
    INNER JOIN BAJAJ_DM.F_monthly2 P ON C.EXISTING_LANNO=P.AGREEMENTNO
WHERE   C.BUSINESS_DATE='2015-05-31'
    AND P.BUSINESS_DATE='2015-05-31'
    AND C.CUSTOMERKEY<>P.CUSTOMERKEY;


--- PARENT LAN Customerkey Recon
-- Indication that something is not OK! CUSTOMERKEY should match

SELECT  C.AGREEMENTNO CHILD_AGREEMENTNO ,
                                P.AGREEMENTNO PARENT_AGREEMENTNO,
                                C.CUSTOMERKEY CHILD_CUSTOMERKEY,
                                P.CUSTOMERKEY PARENT_CUSTOMERKEY
FROM FACMONTHLY C
                INNER JOIN FACMONTHLY P ON C.EXISTING_LANNO=P.AGREEMENTNO
WHERE C.BUSINESS_DATE='31-Jul-15'
and P.BUSINESS_DATE='31-Jul-15'
AND C.CUSTOMERKEY<>P.CUSTOMERKEY;
