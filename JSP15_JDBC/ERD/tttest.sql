-- usepath Table Create SQL
CREATE TABLE attraction
(
    attractionId      INT             NOT NULL, 
    maxPerson         INT             NOT NULL, 
    time              INT             NOT NULL, 
    content           CLOB            NULL, 
    price             INT             NOT NULL, 
    attr_name         VARCHAR2(20)    NOT NULL, 
    comment           VARCHAR2(20)    NULL, 
    location          CHAR(2)         NOT NULL, 
    minAge            INT             NULL, 
    maxAge            INT             NULL, 
    minHeight         INT             NULL, 
    maxHeight         INT             NULL, 
    attr_img          VARCHAR2(20)    NULL, 
    attr_authorize    INT             NOT NULL, 
    attr_regDate      DATE            NULL, 
    CONSTRAINT ATTRACTION_PK PRIMARY KEY (attractionId)
)

CREATE SEQUENCE attraction_SEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER attraction_AI_TRG
BEFORE INSERT ON attraction 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT attraction_SEQ.NEXTVAL
    INTO :NEW.attractionId
    FROM DUAL;
END;

--DROP TRIGGER attraction_AI_TRG;
--DROP SEQUENCE attraction_SEQ;

COMMENT ON TABLE attraction IS '기구'
COMMENT ON COLUMN attraction.attractionId IS '기구번호'
COMMENT ON COLUMN attraction.maxPerson IS '최대탑승인원'
COMMENT ON COLUMN attraction.time IS '소요시간'
COMMENT ON COLUMN attraction.content IS '간단한 설명'
COMMENT ON COLUMN attraction.price IS '가격'
COMMENT ON COLUMN attraction.attr_name IS '기구이름'
COMMENT ON COLUMN attraction.comment IS '기구 한줄평'
COMMENT ON COLUMN attraction.location IS '위치'
COMMENT ON COLUMN attraction.minAge IS '최소나이'
COMMENT ON COLUMN attraction.maxAge IS '최대나이'
COMMENT ON COLUMN attraction.minHeight IS '최소신장'
COMMENT ON COLUMN attraction.maxHeight IS '최대신장'
COMMENT ON COLUMN attraction.attr_img IS '기구 이미지'
COMMENT ON COLUMN attraction.attr_authorize IS '권한'
COMMENT ON COLUMN attraction.attr_regDate IS '등록일'

INSERT INTO attraction VALUES 
(attraction_SEQ.NEXTVAL, )







