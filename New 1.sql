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

