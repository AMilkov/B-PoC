

-- RANK Customer AMTFIN with mailing_address='Y' cases
-- same as before but with some specific mailing_address
SELECT DC.CUSTOMERID,FM.PRODUCTFLAG,FM.AMTFIN,RANK() OVER ( PARTITION BY DC.CUSTOMERID ORDER BY FM.AMTFIN DESC )
FROM facmonthly FM
JOIN DimCustomer DC ON FM.CUSTOMERKEY=DC.CUSTOMERKEY
JOIN DimCustSCD DS ON DC.CUSTOMERID=DS.CUSTOMERID and DS.MAILINGADDRESS='Y'
WHERE FM.BUSINESS_DATE='2015-05-31'





---- Sassi rank emulation
SELECT CUSTOMERID, d_productflag_id, AMTFIN, rank FROM
(
SELECT DC.CUSTOMERID, FM.d_productflag_id, FM.AMTFIN,
 @curRank := IF(
  @curId = @prevId,
  IF(@prevVal = FM.AMTFIN, @curRank, @incRank),
  1
 ) AS rank,
 @incRank := IF (
  @curId = @prevId,
  @incRank := @incRank + 1,
  1
 ),
 @prevVal := FM.AMTFIN,
 @prevId := FM.CUSTOMERKEY

 FROM (
  SELECT @curRank :=0, @prevVal := NULL, @incRank := 1, @curId := 0, @prevId := NULL
 ) r,
 BAJAJ_DM.F_monthly2 FM  
 INNER JOIN bajaj_orig.DimCustomer DC ON FM.CUSTOMERKEY=DC.CUSTOMERKEY
 WHERE FM.BUSINESS_DATE='2015-05-31'
 ORDER BY FM.CUSTOMERKEY, FM.AMTFIN DESC
) s
LIMIT 100;
