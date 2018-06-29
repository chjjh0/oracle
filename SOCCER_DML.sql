SELECT * FROM TAB;

--001
SELECT COUNT(*) 
"���̺��� ��"
FROM TAB;

--002
SELECT TEAM.TEAM_NAME AS "���� �౸�� ���" 
FROM TEAM 
order by team_name DESC;

--003
select distinct 
nvl2(position, position, '����') 
"������"
from player;

--select position from player
--WHERE ROWID IN(SELECT MAX(ROWID) FROM PLAYER GROUP BY position;

SELECT PLAYER_NAME �̸�
FROM PLAYER
WHERE TEAM_ID = 'K02'
    AND POSITION = 'GK'
ORDER BY PLAYER_NAME;

select team_id, team_name from team;


--SQL_TEST_005 :
--������(ID: K02) && Ű�� 170 �̻� ���� && ���� ��

SELECT PLAYER_NAME AS "�̸�"
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
    AND HEIGHT >= '170' 
    AND PLAYER_NAME LIKE '��%'
ORDER BY PLAYER_NAME
;
    
SELECT SUBSTR(PLAYER_NAME,1,1) �׽�Ʈ��
FROM PLAYER
;



    
--SQL_TEST_006 :
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- Ű ��������

SELECT
PLAYER_NAME || '����' �̸� ,
nvl2(height, height, '0') || 'cm' Ű, 
nvl2(weight, weight, '0') || 'kg' ������,
ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)),0) "BMI������"
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
order by height desc
;

-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- MF �������� ����
-- ���� ��������
--OR PLAYER.TEAM_ID LIKE 'K10'
SELECT TEAM_NAME, TEAM_ID
FROM TEAM;

SELECT
TEAM_NAME, PLAYER_NAME
FROM TEAM A JOIN PLAYER
ON PLAYER.TEAM_ID LIKE 'K02'
OR PLAYER.TEAM_ID LIKE 'K10' 
    AND PLAYER.POSITION LIKE 'MF'
    AND PLAYER.PLAYER_NAME LIKE '��%'
ORDER BY TEAM_NAME
;
-- 008
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
--GK �������� ����
-- ����, ����� ��������
SELECT
    T.TEAM_NAME,
    P.POSITION,
    P.PLAYER_NAME
    FROM PLAYER P
    INNER JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
    WHERE T.TEAM_ID = P.TEAM_ID
        AND T.TEAM_ID IN('k02', 'k10')
        AND P.POSITION LIKE 'gk'
ORDER BY T.TEAM_NAME, P.PLAYER_NAME
;
-- 009
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- Ű�� 180 �̻� 183 ������ ������
-- Ű, ����, ����� ��������
SELECT
    P.HEIGHT || 'cm' Ű,
    T.TEAM_NAME ����,
    P.PLAYER_NAME �̸�
FROM PLAYER P
    INNER JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.TEAM_ID IN('K02', 'K10')
    AND P.HEIGHT BETWEEN 180 AND 183 
ORDER BY P.HEIGHT, T.TEAM_NAME, P.PLAYER_NAME
;

SELECT
    P.HEIGHT || 'cm' Ű,
    T.TEAM_NAME ����,
    P.PLAYER_NAME �̸�
FROM PLAYER P
    INNER JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.TEAM_ID IN('K02', 'K10')
    AND P.HEIGHT BETWEEN 180 AND 183 
ORDER BY P.HEIGHT, T.TEAM_NAME, P.PLAYER_NAME
;

SELECT
    P.HEIGHT || 'cm' Ű,
    T.TEAM_NAME ����,
    P.PLAYER_NAME �̸�
FROM PLAYER P
    INNER JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.TEAM_ID IN('K02', 'K10')
    AND P.HEIGHT BETWEEN 180 AND 183 
ORDER BY P.HEIGHT, T.TEAM_NAME, P.PLAYER_NAME
;


-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- Ű�� 185 �̻� 190 ������ ������
-- ����, ����� ��������


-- ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������
SELECT 
NVL2(PLAYER.POSITION, TEAM.TEAM_NAME, '0') ����, 
NVL2(PLAYER.POSITION, PLAYER.PLAYER_NAME, '0') �̸�,
PLAYER.POSITION
FROM TEAM INNER JOIN PLAYER
ON PLAYER.TEAM_ID LIKE 'K02'
OR TEAM.TEAM_ID LIKE 'K10'
ORDER BY TEAM_NAME, PLAYER_NAME
;

-- SOCCER_SQL_010
--  ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������
SELECT 
T.TEAM_NAME ����,
P.PLAYER_NAME �̸�,
NVL2(P.POSITION, '', '����') ������
FROM PLAYER P
    INNER JOIN TEAM T
    ON P.POSITION IS NULL
ORDER BY T.TEAM_NAME, P.PLAYER_NAME
;

-- SOCCER_SQL_011
--  ���� ��Ÿ����� �����Ͽ�
-- ���̸�, ��Ÿ��� �̸� ���
SELECT
T.TEAM_NAME ����,
S.STADIUM_NAME �����
FROM TEAM T
LEFT JOIN STADIUM S
ON T.STADIUM_ID LIKE S.STADIUM_ID
ORDER BY T.STADIUM_ID
;

-- SOCCER_SQL_012
-- ���� ��Ÿ���, �������� �����Ͽ�
-- 2012�� 3�� 17�Ͽ� ���� �� ����� 
-- ���̸�, ��Ÿ���, ������� �̸� ���
-- �������̺� join �� ã�Ƽ� �ذ��Ͻÿ�.
SELECT 
    T.TEAM_NAME ����,
    ST.STADIUM_NAME �����,
    SC.AWAYTEAM_ID ������ID,
    SC.SCHE_DATE �����ٳ�¥
FROM STADIUM ST
JOIN SCHEDULE SC
    ON ST.STADIUM_ID LIKE SC.STADIUM_ID
JOIN TEAM T
    ON T.TEAM_ID LIKE ST.HOMETEAM_ID
WHERE
    SC.SCHE_DATE LIKE '20120317' 
ORDER BY T.TEAM_NAME
;

-- SOCCER_SQL_013
-- 2012�� 3�� 17�� ��⿡ 
-- ���� ��ƿ���� �Ҽ� ��Ű��(GK)
-- ����, ������,���� (����������), 
-- ��Ÿ���, ��⳯¥�� ���Ͻÿ�
-- �������� ���̸��� ������ ���ÿ�
SELECT 
    P.PLAYER_NAME �̸�,
    P.POSITION ������,
    T.TEAM_NAME ����,
    ST.STADIUM_NAME ��Ÿ���,
    SC.SCHE_DATE ����
FROM STADIUM ST
JOIN SCHEDULE SC
    ON ST.STADIUM_ID LIKE SC.STADIUM_ID
JOIN TEAM T
    ON ST.STADIUM_ID LIKE T.STADIUM_ID
JOIN PLAYER P
    ON P.TEAM_ID LIKE T.TEAM_ID
WHERE
    SC.SCHE_DATE LIKE '20120317'
    AND P.TEAM_ID LIKE 'K03'
    AND P.POSITION LIKE 'GK'
ORDER BY P.PLAYER_NAME
;

-- SOCCER_SQL_014
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�
select
    s.stadium_name ��Ÿ���,
    k.sche_date ��⳯¥,
    ht.region_name || ' ' || ht.team_name Ȩ��,
    at.region_name || ' ' || at.team_name ������,
    k.home_score "Ȩ�� ����",
    k.away_score "������ ����"
from
    schedule k
    join stadium s
        on k.stadium_id like s.stadium_id
    join team ht
        on k.hometeam_id like ht.team_id
    join team at
        on k.hometeam_id like at.team_id
       ; 
   
-- SOCCER_SQL_015
-- STADIUM �� ��ϵ� ��� �߿���
-- Ȩ���� ���� �������� ���� ��������
-- ī��Ʈ ���� 20 , �ϻ� �ؿ� ����, �Ⱦ絵 ����






-- SOCCER_SQL_016
-- �Ҽ��� �Ｚ������� ���� �������
-- �巡�������� �������� ���� ����
SELECT 
    T.TEAM_NAME ����,
    P.PLAYER_NAME ������,
    P.POSITION ������,
    P.BACK_NO ��ѹ�,
    P.HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID IN ( 
    (SELECT T.TEAM_ID FROM TEAM WHERE T.TEAM_NAME IN ('�Ｚ�������', '�巡����')
    ))
;



-- 018
-- ��ȣ�� ������ �Ҽ����� ������, ��ѹ��� �����Դϱ�
SELECT
    T.TEAM_NAME ����,
    P.PLAYER_NAME �̸�,
    P.POSITION ������,
    P.BACK_NO ���ȣ
FROM PLAYER P
JOIN TEAM T
    ON P.TEAM_ID LIKE T.TEAM_ID
WHERE
    P.PLAYER_NAME LIKE '��ȣ��'
ORDER BY T.TEAM_NAME
;
    
-- 019
-- ������Ƽ���� MF ���Ű�� ���Դϱ�? 174.87
SELECT DISTINCT
    (SELECT P.POSITION
     FROM PLAYER P
     WHERE 
     IN P.TEAM_ID 'K10' 
     P.POSITION IN 'MF')) ������,
    (SELECT ROUND(AVG(P.HEIGHT), 1)
     FROM PLAYER P
     WHERE P.POSITION LIKE 'MF' IN (SELECT P.TEAM_ID) ���Ű 
FROM PLAYER P
WHERE P.POSITION
;
--FROM PLAYER P
--JOIN TEAM T
--    ON P.TEAM_ID LIKE T.TEAM_ID
--WHERE
--    T.TEAM_NAME LIKE '��Ƽ��'
--ORDER BY T.TEAM_NAME
    
-- 020
-- 2012�� ���� ������ ���Ͻÿ�
SELECT
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201201%') "1��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201202%') "2��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201203%') "3��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201204%') "4��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201205%') "5��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201206%') "6��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201207%') "7��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201208%') "8��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201209%') "9��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201210%') "10��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201211%') "11��",
    (SELECT COUNT(*) FROM SCHEDULE SC WHERE SC.SCHE_DATE LIKE '201212%') "12��"
FROM DUAL
;
 
-- 021
-- 2012�� ���� ����� ����(GUBUN IS YES)�� ���Ͻÿ�
-- ����� 1��:20��� �̷�������...
-- 022
-- 2012�� 9�� 14�Ͽ� ������ ���� ���� ����Դϱ�
-- Ȩ��: ?   ������: ? �� ���


--ALTER TABLE ATEAM
----ADD CONSTRAINT FOREIGN KEY(ATEAM.TEAM_ID) REFERENCES ATEAMZ(TEAM_ID);
--
--
--DROP TABLE CTEAM
--;

CREATE TABLE TEAMZ
(
TEAM_ID VARCHAR2(20) PRIMARY KEY,
TEAM_NAME VARCHAR2(20)
)
;

CREATE TABLE TEAMW
(
MEM_ID VARCHAR2(20) PRIMARY KEY,
TEAM_ID VARCHAR2(20),
MEM_NAME VARCHAR2(20),
MEM_AGE DECIMAL
)
;

ALTER TABLE TEAMW ADD ROLL VARCHAR2(20);

UPDATE TEAMW SET ROLL = '����'
WHERE TEAMW.ROLL IS NULL
;

INSERT INTO TEAMW
VALUES
(
'C1','CTEAM','������','32', '����'
)
;
INSERT INTO TEAMW
VALUES
(
'C2','CTEAM','��ȣ','31', ''
)
;
INSERT INTO TEAMW
VALUES
(
'C3','CTEAM','����','30', ''
)
;
INSERT INTO TEAMW
VALUES
(
'C4','CTEAM','����','29', ''
)
;
INSERT INTO TEAMW
VALUES
(
'C5','CTEAM','����','23', ''
)
;





CREATE TABLE DTEAM
(
MEM_ID VARCHAR2(20) PRIMARY KEY,
TEAM_ID VARCHAR2(20),
MEM_NAME VARCHAR2(20),
MEM_AGE DECIMAL
);
INSERT INTO ATEAMZ VALUES(
    'ATEAM', '����Ƽ��'
);
INSERT INTO BTEAMZ VALUES(
    'BTEAM', '��ī��'
);
INSERT INTO CTEAMZ VALUES(
    'CTEAM', '������'
);
INSERT INTO DTEAMZ VALUES(
    'DTEAM', '�����'
);

INSERT INTO DTEAM 
(
    MEM_ID,
    TEAM_ID,
    MEM_NAME,
    MEM_AGE
)
VALUES(
    'D5', 'DTEAM', '����', '30'
);

UPDATE ATEAM SET MEM_NAME = '����'
WHERE MEM_NAME LIKE '�¿�';


SELECT
    PLAYER_NAME,
    POSITION,
    CASE
        WHEN POSITION IS NULL THEN '����'
        WHEN POSITION LIKE 'GK' THEN '��Ű��'
        WHEN POSITION LIKE 'FW' THEN '���ݼ�'
        WHEN POSITION LIKE 'MF' THEN '�̵��ʴ�'
        WHEN POSITION LIKE 'DF' THEN '�����'
        ELSE POSITION

--MODIFY ATEAM
--CONSTRAINT TEAM_ID FOREIGN KEY (TEAM_ID) REFERENCES ATEAM(TEAM_ID)
--;

ALTER TABLE ATEAM
ADD CONSTRAINT TEAM_ID
FOREIGN KEY(TEAM_ID) REFERENCES ATEAMZ(TEAM_ID);
;
desc ATEAM;

select MEM_ID
from ATEAM

--ALTER TABLE ATEAM
--UPDATE MEM_NAME  
--;
-- COUNT ������
SELECT 
    COUNT(*) ������
FROM 
    ATEAM A
GROUP BY 
    A.TEAM_ID
;
-- SUM ����������
SELECT
    SUM(A.MEM_AGE) ����������
FROM
    ATEAM A
GROUP BY
    A.TEAM_ID
;
-- ���� �����ִ�ġ
SELECT
    MAX(A.MEM_AGE) �հ�
FROM
    ATEAM A
GROUP BY
    A.TEAM_ID
;
UPDATE TEAMW 
SET ROLL = CASE
    WHEN TEAMW.ID = '%1' THEN '����'
    ELSE '����'
    END
;



WHERE TEAMW.ROLL LIKE '����'
;

UPDATE TEAMW SET ROLL = (CASE
    WHEN TEAM.ID LIKE '%1' THEN '����'
    ELSE '����'
END)




WHERE (SELECT
    PLAYER_NAME,
    POSITION,
    CASE
        WHEN POSITION IS NULL THEN '����'
        WHEN POSITION LIKE 'GK' THEN '��Ű��'
        WHEN POSITION LIKE 'FW' THEN '���ݼ�'
        WHEN POSITION LIKE 'MF' THEN '�̵��ʴ�'
        WHEN POSITION LIKE 'DF' THEN '�����'
        ELSE POSITION
    END ������
FROM
    PLAYER
WHERE
    TEAM_ID = 'K08'
;
-- VER1
SELECT
ROWNUM "NO.",
A.*
FROM
(SELECT 
  T.TEAM_NAME ����,
  P.PLAYER_NAME ������,
  P.POSITION ������,
  P.BACK_NO ��ѹ�,
  P.HEIGHT Ű
FROM 
PLAYER P
  JOIN TEAM T
    ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
  T.TEAM_ID IN (SELECT TEAM.TEAM_ID FROM TEAM WHERE TEAM.TEAM_NAME LIKE '�Ｚ�������')
  AND P.HEIGHT IS NOT NULL
ORDER BY P.HEIGHT DESC 
) A

WHERE ROWNUM <= 1
;

--VER2 
WITH VIEWTEST AS(
SELECT 
  T.TEAM_NAME ����,
  P.PLAYER_NAME ������,
  P.POSITION ������,
  P.BACK_NO ��ѹ�,
  P.HEIGHT Ű
FROM 
PLAYER P
  JOIN TEAM T
    ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
  T.TEAM_ID IN (SELECT TEAM.TEAM_ID FROM TEAM WHERE TEAM.TEAM_NAME LIKE '�Ｚ�������')
    AND P.HEIGHT IS NOT NULL 
ORDER BY P.HEIGHT DESC
)

SELECT 
ROWNUM "NO.",
V.*
--V.����,
--V.������,
--V.������,
--V.��ѹ�,
--V.Ű
FROM VIEWTEST V
WHERE ROWNUM >= 10
;

--2�� ��
SELECT 
    B.*
FROM(SELECT
ROWNUM "NOO",
A.*
FROM
(SELECT 
  T.TEAM_NAME ����,
  P.PLAYER_NAME ������,
  P.POSITION ������,
  P.BACK_NO ��ѹ�,
  P.HEIGHT Ű
FROM 
PLAYER P
  JOIN TEAM T
  ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
  T.TEAM_ID IN (SELECT TEAM.TEAM_ID FROM TEAM WHERE TEAM.TEAM_NAME LIKE '�Ｚ�������')
  AND P.HEIGHT IS NOT NULL
ORDER BY P.HEIGHT DESC 
) A ) B
WHERE
    B.NOO BETWEEN 11 AND 20
;

-- 026
-- ���� ��Ű���� ��� Ű����
-- ���� ���Ű�� ū ������

SELECT DISTINCT
    T.TEAM_NAME ����
FROM
    TEAM T
JOIN
    PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE
    T.TEAM_ID LIKE 'K01'

;
--VER1
SELECT
    A.��ID,
    MAX(A."���Ű") �ִ�
FROM
(SELECT 
    (SELECT T.TEAM_NAME FROM TEAM T WHERE T.TEAM_ID IN P.TEAM_ID) ����,
    AVG(P.HEIGHT) ���Ű
FROM PLAYER P
WHERE P.POSITION IN 'GK'
GROUP BY TEAM_ID
ORDER BY TEAM_ID) A
GROUP BY A.��ID
;
--VER2
SELECT
    *
FROM
(SELECT 
    (SELECT T.TEAM_NAME FROM TEAM T WHERE T.TEAM_ID IN P.TEAM_ID) ����,
    AVG(P.HEIGHT) ���Ű
FROM PLAYER P
WHERE P.POSITION IN 'GK'
GROUP BY TEAM_ID
ORDER BY TEAM_ID) A
WHERE A.���Ű = (SELECT MAX(A.���Ű) AS A.���Ű FROM A
;

-- 027
-- �� ���ܺ� ������ ���Ű�� �Ｚ �����������
-- ���Ű���� ���� ���� �̸��� �ش� ���� ���Ű�� 
-- ���Ͻÿ�
-- 028
-- 2012�� ��� �߿��� �������� ���� ū ��� ����
-- 029
-- �¼������ ��Ÿ��� ���� �ű��
-- 030
-- 2012�� ���� �¸� ������ �����ű��


