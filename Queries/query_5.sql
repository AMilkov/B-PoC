-- Using F_monthly2
SELECT FM.BUSINESS_DATE, FM.AGREEMENTNO ,FMPL.name, FDP.d_productflag_id
FROM BAJAJ_DM.F_monthly2 FM
JOIN BAJAJ_DM.F_daily FDC ON FM.AGREEMENTNO  = FDC.AGREEMENTNO
JOIN BAJAJ_DM.F_daily FDP ON FDP.AGREEMENTNO = FDC.PARENT_AGREEMENTNO
JOIN BAJAJ_DM.D_parent_lan_product FMPL ON FMPL.id = FM.d_parent_lan_product_id
JOIN BAJAJ_DM.D_productflag_daily FDPF ON FDPF.id = FDP.d_productflag_id
WHERE FM.BUSINESS_DATE='2015-04-30'
AND FMPL.name <> FDPF.name;
-- Empty set (0.01 sec)