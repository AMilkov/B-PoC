
-- CNAME is not present in the provided data set, so we have only 2 fields
DROP TABLE IF EXISTS BAJAJ_DM.F_customer;
CREATE TABLE BAJAJ_DM.F_customer (
  CUSTOMERKEY int(11) DEFAULT NULL,
  CUSTOMERID int(11) DEFAULT NULL
) ENGINE=MDB DEFAULT CHARSET=utf8 PARTITION BY KEY(CUSTOMERID);

INSERT INTO BAJAJ_DM.F_customer (CUSTOMERKEY, CUSTOMERID) (
    SELECT CUSTOMERKEY, CUSTOMERID FROM bajaj_orig.DimCustomer
);
