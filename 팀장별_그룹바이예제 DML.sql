/* Formatted on 2018/06/28 ���� 7:11:33 (QP5 v5.326) */
---------------------------------------------------------------------------------
--UPDATE TEAMW
--SET MEM_NAME = '����'
--WHERE MEM_NAME LIKE '�¿�';

  SELECT Z1.TEAM_ID              ��,
         COUNT (Z1.MEM_NAME)     ���,
         SUM (Z1.MEM_AGE)        ������,
         MAX (Z1.MEM_AGE)        �����ִ�ġ,
         MIN (Z1.MEM_AGE)        �����ּ�ġ,
         AVG (Z1.MEM_AGE)        �������
    FROM TEAMW Z1
GROUP BY Z1.TEAM_ID
ORDER BY AVG (Z1.MEM_AGE) DESC;

  SELECT Z1.TEAM_NAME           ����,
         COUNT (W.MEM_NAME)     ������,
         SUM (W.MEM_AGE)        ������,
         MAX (W.MEM_AGE)        �����ִ�ġ,
         MIN (W.MEM_AGE)        �����ּ�ġ,
         AVG (W.MEM_AGE)        �������
    FROM TEAMW W JOIN TEAMZ Z1 ON W.TEAM_ID LIKE Z1.TEAM_ID
GROUP BY Z1.TEAM_NAME;

  SELECT (SELECT Z2.TEAM_NAME
            FROM TEAMZ Z2
           WHERE Z2.TEAM_ID LIKE Z1.TEAM_ID)
             ����,
         COUNT (W.MEM_NAME)
             ������,
         SUM (W.MEM_AGE)
             ������,
         MAX (W.MEM_AGE)
             �����ִ�ġ,
         MIN (W.MEM_AGE)
             �����ּ�ġ,
         AVG (W.MEM_AGE)
             �������
    FROM TEAMW W JOIN TEAMZ Z1 ON W.TEAM_ID LIKE Z1.TEAM_ID
GROUP BY Z1.TEAM_ID;


  SELECT (SELECT Z2.TEAM_NAME
            FROM TEAMZ Z2
           WHERE Z2.TEAM_ID LIKE Z1.TEAM_ID)
             ����,
         COUNT (W.MEM_NAME)
             ������,
         SUM (W.MEM_AGE)
             ������,
         MAX (W.MEM_AGE)
             �����ִ�ġ,
         MIN (W.MEM_AGE)
             �����ּ�ġ,
         AVG (W.MEM_AGE)
             �������
    FROM TEAMW W JOIN TEAMZ Z1 ON W.TEAM_ID LIKE Z1.TEAM_ID
GROUP BY Z1.TEAM_ID
  HAVING AVG (W.MEM_AGE) >= 28                      -- GROUP�� �������� HAVING���� �ش�
ORDER BY Z1.TEAM_ID;

SELECT AVG (mem_age) FROM TEAMW;


SELECT Z.TEAM_ID       ��ID,
       Z.TEAM_NAME     ����,
       W.MEM_ID        ID,
       W.MEM_NAME      �̸�,
       W.MEM_AGE       ����,
       W.ROLL          ����
  FROM TEAMW W JOIN TEAMZ Z ON W.TEAM_ID LIKE Z.TEAM_ID;

DESC TEAMW;

UPDATE TEAMW
   SET ROLL =
           CASE
               WHEN mem_name IN ('����',
                                 '����',
                                 '������',
                                 '��ȣ')
               THEN
                   '����'
               ELSE
                   '����'
           END;

SELECT * FROM TEAMZ;
SELECT * FROM TEAMW;

ALTER TABLE TEAMW
    ADD ROLL VARCHAR (20);                           -- Į���� �߰��Ҷ�

ALTER TABLE TEAMW
    DROP (ROLL);                    -- Į�� ��ü�� ���ﶧ

UPDATE TEAMW
   SET ROLL = ''
 WHERE ROLL IS NOT NULL;                    -- Į�� ���븸 ���ﶧ

DROP TABLE TEAMW;
DROP TABLE TEAMZ;

DESC TEAMW;
---------------------------------------------------------------------------------

INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM1',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');
             
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM2',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');
             
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM3',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM4',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM5',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');             
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM6',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM7',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');    
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM8',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');   
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM9',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');       
INSERT INTO MEMBER (MEMID,
                   TEAMID,
                   NAME,
                   AGE,
                   ROLL,
                   SSN,
                   PASSWORD,
                   GENDER)
     VALUES ('NEWMEM10',
             'ATEAM',
             '����',
             '35',
             '����',
             '880921-2',
             '1',
             '');

SELECT B.*
FROM 
(SELECT ROWNUM "SEQ", A.* 
FROM (SELECT * FROM MEMBER) A) B    
WHERE B.SEQ BETWEEN 11 AND 20;                

CREATE SEQUENCE IMG_SEQ START WITH 1000 INCREMENT BY 1;

CREATE TABLE IMAGE(
    IMG_SEQ DECIMAL PRIMARY KEY,
    IMGNAME VARCHAR2(20),
    EXTENSION VARCHAR2(10),
    USERID VARCHAR(20),
    CONSTRAINT FK_IMAGE_MEMBER
    FOREIGN KEY (USERID)
    REFERENCES MEMBER (MEM_ID)
);

INSERT INTO IMAGE (IMG_SEQ, IMGNAME, EXTENSION, USERID)
VALUES (IMG_SEQ.NEXTVAL, '', '', '');