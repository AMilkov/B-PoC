-- Prepare the Balic flag dimension
DROP TABLE IF EXISTS BAJAJ_DM.D_balic_flag;
CREATE TABLE BAJAJ_DM.D_balic_flag (
		id TINYINT NOT NULL,
		description varchar(20) NOT NULL
)ENGINE=MDB DEFAULT CHARSET=utf8;

INSERT INTO BAJAJ_DM.D_balic_flag (id, description) VALUES
(0, 'NOT_BALIC_PRODUCT'),
(1, 'BALIC_PRODUCT');

