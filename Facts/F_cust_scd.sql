DROP TABLE IF EXISTS BAJAJ_DM.F_cust_scd;
CREATE TABLE BAJAJ_DM.F_cust_scd (
  CUSTOMERID int(11) DEFAULT NULL,
   MAILINGADDRESS varchar(3) NULL
) ENGINE=MDB DEFAULT CHARSET=utf8 PARTITION BY KEY(CUSTOMERID);

INSERT INTO BAJAJ_DM.F_cust_scd (CUSTOMERID, MAILINGADDRESS) (
    SELECT CUSTOMERID, MAILINGADDRESS FROM bajaj_orig.DimCustSCD
);


