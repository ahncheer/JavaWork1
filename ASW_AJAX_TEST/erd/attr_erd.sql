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




CREATE TABLE attraction
(
	attr_id number NOT NULL,
	attr_content clob,
	attr_name varchar2(20) NOT NULL,
	attr_img varchar2(30),
	attr_cardimg varchar2(30),
	PRIMARY KEY (attr_id)
);



INSERT ALL
	INTO ATTRACTION (attr_id, attr_content, attr_name, attr_img, attr_cardimg)
		VALUES (0, '설명1', '이름1', '사진1', '카드사진')
		INTO ATTRACTION (attr_id, attr_content, attr_name, attr_img, attr_cardimg)
		VALUES (2, '설명1', '이름1', '사진1', '카드사진')
		INTO ATTRACTION (attr_id, attr_content, attr_name, attr_img, attr_cardimg)
		VALUES (3, '설명1', '이름1', '사진1', '카드사진')
		INTO ATTRACTION (attr_id, attr_content, attr_name, attr_img, attr_cardimg)
		VALUES (4, '설명1', '이름1', '사진1', '카드사진')
		INTO ATTRACTION (attr_id, attr_content, attr_name, attr_img, attr_cardimg)
		VALUES (5, '설명1', '이름1', '사진1', '카드사진')
SELECT * FROM DUAL;   

SELECT * FROM ATTRACTION ;
