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
     VALUES ('ATEAM', '����Ƽ��');

INSERT INTO TEAMZ (TEAMID, NAME)
     VALUES ('HTEAM', '��ī��');

INSERT INTO TEAMZ (TEAMID, NAME)
     VALUES ('CTEAM', '������');

INSERT INTO TEAMZ (TEAMID, NAME)
     VALUES ('STEAM', '�����');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('����Ƽ��1',
             'ATEAM',
             '����',
             '34',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('����Ƽ��2',
             'ATEAM',
             '����',
             '35',
             '',
             '');
             
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('����Ƽ��3',
             'ATEAM',
             '����',
             '21',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('����Ƽ��4',
             'ATEAM',
             '����',
             '29',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('����Ƽ��5',
             'ATEAM',
             '����',
             '25',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('��ī��1',
             'HTEAM',
             '����',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('��ī��2',
             'HTEAM',
             '����',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('��ī��3',
             'HTEAM',
             '��',
             '27',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('��ī��4',
             'HTEAM',
             '���',
             '30',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('��ī��5',
             'HTEAM',
             '�ܾ�',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('������1',
             'CTEAM',
             '������',
             '32',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('������2',
             'CTEAM',
             '��ȣ',
             '31',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('������3',
             'CTEAM',
             '����',
             '29',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('������4',
             'CTEAM',
             '����',
             '23',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('������5',
             'CTEAM',
             '����',
             '30',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('�����1',
             'STEAM',
             '��ȣ',
             '27',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('�����2',
             'STEAM',
             '����',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('�����3',
             'STEAM',
             '�̽�',
             '29',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('�����4',
             'STEAM',
             '����',
             '26',
             '',
             '');

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN)
     VALUES ('�����5',
             'STEAM',
             '����',
             '30',
             '',
             '');
             
UPDATE MEMBER SET ROLL = (
CASE WHEN MEMID LIKE '%1'
THEN '����'
ELSE '����'
END
) ;
ALTER TABLE MEMBER ADD PASSWORD VARCHAR2(20); 
UPDATE MEMBER SET PASSWORD = '1';           

RENAME TEAMW TO TEAM; 
RENAME TEAMZ TO PROJECT_TEAM;
ALTER TABLE TEAMW RENAME COLUMN ID TO TEAM_ID;
ALTER TABLE TEAMW RENAME COLUMN MEM_NAME TO NAME;
ALTER TABLE TEAMW RENAME COLUMN MEM_AGE TO AGE;

DELETE MEMBER WHERE NAME LIKE '������';



DROP TABLE MEMBER;
SELECT * FROM MEMBER;

UPDATE MEMBER SET MEMID = 'chjjh0'
WHERE NAME LIKE '������';

UPDATE MEMBER SET PASSWORD = '3'
WHERE MEMID LIKE 'chjjh0'
AND PASSWORD <> '3';