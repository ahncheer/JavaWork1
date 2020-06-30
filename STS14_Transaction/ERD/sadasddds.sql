CREATE TABLE T_USER
(
    user_uid          INT             NOT NULL, 
    userId       VARCHAR2(20)    NOT NULL, 
    userPw       VARCHAR2(20)    NOT NULL, 
    userName     VARCHAR2(20)    NOT NULL, 
    userEmail    VARCHAR2(20)    NULL, 
    CONSTRAINT USER_PK PRIMARY KEY (user_uid),
    CONSTRAINT USER_UK UNIQUE (userId, userEmail)
);


CREATE TABLE T_BOARD
(
	boardUid INT NOT NULL,
	subject VARCHAR2(20) NOT NULL,
	writer VARCHAR2(20),
	content VARCHAR2(20),
	viewCnt INT NOT NULL  CHECK(viewCnt >= 0),
	regDate DATE,
	CONSTRAINT BOARD_PK PRIMARY KEY (boardUid)
);




