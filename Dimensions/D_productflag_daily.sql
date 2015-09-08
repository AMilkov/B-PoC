
DROP TABLE IF EXISTS BAJAJ_DM.D_productflag_daily;
CREATE TABLE BAJAJ_DM.`D_productflag_daily` (
    id TINYINT NOT NULL,
    `name` varchar(20) NOT NULL
)ENGINE=MDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `BAJAJ_DM`.`temporary_table`;
CREATE TABLE `BAJAJ_DM`.`temporary_table` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  primary key (id),
  unique index name_unq_idx (name))
ENGINE = INNODB;

ALTER TABLE BAJAJ_DM.temporary_table AUTO_INCREMENT = 1;
insert into BAJAJ_DM.temporary_table (name)
select distinct PRODUCTFLAG from bajaj_orig.factdaily;

insert into BAJAJ_DM.D_productflag_daily (id, name)
select id, name from BAJAJ_DM.temporary_table;
DROP TABLE IF EXISTS `BAJAJ_DM`.`temporary_table`;

