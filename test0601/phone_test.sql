 --  
 -- Table structure for table brand  
 --  
 CREATE TABLE brand_test2 (  
  brand_id number NOT NULL,  
  brand_name varchar2(250) NOT NULL,  
  PRIMARY KEY (brand_id)  
 );  
 --  
 -- Dumping data for table brand  
 --  

 INSERT INTO brand_test2 (brand_id, brand_name) VALUES (1, 'Samsung');
 INSERT INTO brand_test2 (brand_id, brand_name) VALUES (2, 'Sony');
 INSERT INTO brand_test2 (brand_id, brand_name) VALUES (3, 'Motorola');  
 INSERT INTO brand_test2 (brand_id, brand_name) VALUES (4, 'Xiaomi');

SELECT * FROM BRAND_TEST2;
 -- --------------------------------------------------------  
 --  
 -- Table structure for table product  
 --  
 CREATE TABLE product2 (  
  product_id number NOT NULL,  
  product_name varchar2(250) NOT NULL,  
  brand_id number NOT NULL,  
  PRIMARY KEY (product_id)  
 ) ;  
 --  
 -- Dumping data for table product  
 --  
 INSERT all 
	INTO product2 (product_id, product_name, brand_id) VALUES   (1, 'Samsung Galaxy A9', 1)
	INTO product2 (product_id, product_name, brand_id) VALUES   (2, 'Samsung Galaxy S7', 1)
	INTO product2 (product_id, product_name, brand_id) VALUES   (3, 'Samsung Galaxy S6 edge', 1)
	INTO product2 (product_id, product_name, brand_id) VALUES   (4, 'Xperia Z5 Premium', 2)
	INTO product2 (product_id, product_name, brand_id) VALUES  (5, 'Xperia M5 Dual', 2)
	INTO product2 (product_id, product_name, brand_id) VALUES   (6, 'Xperia C5 uplta', 2)
	INTO product2 (product_id, product_name, brand_id) VALUES   (7, 'Moto G Turbo', 3)
	INTO product2 (product_id, product_name, brand_id) VALUES   (8, 'Moto X Force', 3)
	INTO product2 (product_id, product_name, brand_id) VALUES   (9, 'Redmi 3 Pro', 4)
	INTO product2 (product_id, product_name, brand_id) VALUES   (10, 'Mi 5', 4) 
SELECT * FROM DUAL;

SELECT * FROM product2;
