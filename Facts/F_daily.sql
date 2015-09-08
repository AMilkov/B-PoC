
DROP TABLE IF EXISTS BAJAJ_DM.F_daily;
CREATE TABLE BAJAJ_DM.F_daily (
  AGREEMENTNO varchar(20) DEFAULT NULL,
  PARENT_AGREEMENTNO varchar(20) DEFAULT NULL,
  d_productflag_id TINYINT NOT NULL
) ENGINE=MDB DEFAULT CHARSET=utf8 PARTITION BY KEY(AGREEMENTNO);

INSERT INTO BAJAJ_DM.F_daily (
AGREEMENTNO, 
PARENT_AGREEMENTNO,
d_productflag_id
) (
    SELECT 
        AGREEMENTNO, 
        PARENT_AGREEMENTNO,
        BAJAJ_DM.D_productflag_daily.id
    FROM bajaj_orig.factdaily
    JOIN BAJAJ_DM.D_productflag_daily on bajaj_orig.factdaily.PRODUCTFLAG=BAJAJ_DM.D_productflag_daily.name
);

