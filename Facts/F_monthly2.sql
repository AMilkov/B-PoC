-- Monthly fact table partitioned by CUSTOMERKEY 
DROP TABLE IF EXISTS BAJAJ_DM.F_monthly2;
CREATE TABLE BAJAJ_DM.F_monthly2 (
  `BUSINESS_DATE` date NOT NULL,
  `EXISTING_LANNO` varchar(20) DEFAULT NULL,
  `AGREEMENTNO` varchar(20) DEFAULT NULL,
  `CUSTOMERKEY` int(11) DEFAULT NULL,
  d_parent_lan_product_id INTEGER NOT NULL,
  d_productflag_id INTEGER NOT NULL,
  `AMTFIN` decimal(16,2) DEFAULT NULL
) ENGINE=MDB DEFAULT CHARSET=utf8 PARTITION BY KEY(CUSTOMERKEY);

INSERT INTO BAJAJ_DM.F_monthly2 (
    BUSINESS_DATE,
    EXISTING_LANNO,
    AGREEMENTNO,
    CUSTOMERKEY,
    d_parent_lan_product_id,
    d_productflag_id,
    AMTFIN
)
(
    SELECT
        BUSINESS_DATE,
        EXISTING_LANNO,
        AGREEMENTNO,
        CUSTOMERKEY,
        BAJAJ_DM.D_parent_lan_product.id,
        BAJAJ_DM.D_productflag.id,
        AMTFIN
    FROM bajaj_orig.facmonthly
    JOIN BAJAJ_DM.D_productflag on bajaj_orig.facmonthly.PRODUCTFLAG=BAJAJ_DM.D_productflag.name
    JOIN BAJAJ_DM.D_parent_lan_product on bajaj_orig.facmonthly.PARENT_LAN_PRODUCT=BAJAJ_DM.D_parent_lan_product.name
);

