CREATE TABLE TEAMZ
(
    TEAMID      VARCHAR2 (20) PRIMARY KEY,
    NAME    VARCHAR2 (20)
);
DROP TABLE TEAMZ;
CREATE TABLE MEMBER
(
    MEMID   VARCHAR2 (20) PRIMARY KEY,
    TEAMID  VARCHAR2 (20),
    NAME    VARCHAR2 (20),
    AGE     DECIMAL,
    ROLL    VARCHAR2 (20),
    SSN     VARCHAR2 (20)
);                         
  
ALTER TABLE MEMBER
    ADD CONSTRAINT TEAM_fk_TEAMID FOREIGN KEY (TEAMID)
            REFERENCES TEAMZ (TEAMID);

INSERT INTO TEAMZ (TEAMID, NAME)
     VALUES ('ATEAM', '저스티스');

INSERT INTO TEAMZ (TEAMID, NAME)
     VALUES ('HTEAM', '엘카로');

INSERT INTO TEAMZ (TEAMID, NAME)
     VALUES ('CTEAM', '가오갤');

INSERT INTO TEAMZ (TEAMID, NAME)
     VALUES ('STEAM', '어벤저스');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('저스티스1',
             'ATEAM',
             '형준',
             '34',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('저스티스2',
             'ATEAM',
             '세인',
             '35',
             '',
             '');
             
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('저스티스3',
             'ATEAM',
             '희태',
             '21',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('저스티스4',
             'ATEAM',
             '상훈',
             '29',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('저스티스5',
             'ATEAM',
             '태형',
             '25',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('엘카로1',
             'HTEAM',
             '혜리',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('엘카로2',
             'HTEAM',
             '지은',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('엘카로3',
             'HTEAM',
             '준',
             '27',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('엘카로4',
             'HTEAM',
             '재경',
             '30',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('엘카로5',
             'HTEAM',
             '단아',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('가오갤1',
             'CTEAM',
             '최정훈',
             '32',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('가오갤2',
             'CTEAM',
             '윤호',
             '31',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('가오갤3',
             'CTEAM',
             '가은',
             '29',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('가오갤4',
             'CTEAM',
             '정훈',
             '23',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('가오갤5',
             'CTEAM',
             '승태',
             '30',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('어벤져스1',
             'STEAM',
             '승호',
             '27',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('어벤져스2',
             'STEAM',
             '소진',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('어벤져스3',
             'STEAM',
             '이슬',
             '29',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('어벤져스4',
             'STEAM',
             '진태',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('어벤져스5',
             'STEAM',
             '누리',
             '30',
             '',
             '');
             
UPDATE MEMBER SET ROLL = (
CASE WHEN MEMID LIKE '%1'
THEN '팀장'
ELSE '팀원'
END
) ;
ALTER TABLE MEMBER ADD PASSWORD VARCHAR2(20); 
UPDATE MEMBER SET PASSWORD = '1';           

RENAME TEAMW TO TEAM; 
RENAME TEAMZ TO PROJECT_TEAM;
ALTER TABLE TEAMW RENAME COLUMN ID TO TEAM_ID;
ALTER TABLE TEAMW RENAME COLUMN MEM_NAME TO NAME;
ALTER TABLE TEAMW RENAME COLUMN MEM_AGE TO AGE;

DELETE MEMBER WHERE NAME LIKE '최정훈';



DROP TABLE MEMBER;
SELECT * FROM MEMBER;

UPDATE MEMBER SET MEMID = 'chjjh0'
WHERE NAME LIKE '최정훈';

UPDATE MEMBER SET PASSWORD = '3'
WHERE MEMID LIKE 'chjjh0'
AND PASSWORD <> '3';