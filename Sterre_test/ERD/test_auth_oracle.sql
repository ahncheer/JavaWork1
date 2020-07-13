
/* Drop Tables */

DROP TABLE sr_member_auth CASCADE CONSTRAINTS;
DROP TABLE st_member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE sr_member_auth
(
	userid varchar2(50) NOT NULL,
	auth varchar2(50) NOT NULL
);


CREATE TABLE st_member
(
	userid varchar2(50) NOT NULL,
	userpw varchar2(100) NOT NULL,
	username varchar2(100) NOT NULL,
	regdate date DEFAULT SYSDATE,
	usertel number NOT NULL,
	useremail varchar2(50) NOT NULL,
	useralarm number,
	enabled char(1) DEFAULT '1',
	PRIMARY KEY (userid)
);



/* Create Foreign Keys */

ALTER TABLE sr_member_auth
	ADD FOREIGN KEY (userid)
	REFERENCES st_member (userid)
;



