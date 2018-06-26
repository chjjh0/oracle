SELECT * FROM TAB;

--001
SELECT COUNT(*) 
"테이블의 수"
FROM TAB;

--002
SELECT TEAM.TEAM_NAME AS "현재 축구팀 목록" 
FROM TEAM 
order by team_name DESC;

--003
select distinct 
nvl2(position, position, '신입') 
"포지션"
from player;

--select position from player
--WHERE ROWID IN(SELECT MAX(ROWID) FROM PLAYER GROUP BY position;

SELECT PLAYER_NAME 이름
FROM PLAYER
WHERE TEAM_ID = 'K02'
    AND POSITION = 'GK'
ORDER BY PLAYER_NAME;

select team_id, team_name from team;


--SQL_TEST_005 :
--수원팀(ID: K02) && 키가 170 이상 선수 && 성이 고씨

SELECT PLAYER_NAME AS "이름"
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
    AND HEIGHT >= '170' 
    AND PLAYER_NAME LIKE '고%'
ORDER BY PLAYER_NAME
;
    
SELECT SUBSTR(PLAYER_NAME,1,1) 테스트값
FROM PLAYER
;



    
--SQL_TEST_006 :
-- 수원팀(ID: K02) 선수들 이름,
-- 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시
-- 키 내림차순

SELECT
PLAYER_NAME || '선수' 이름 ,
nvl2(height, height, '0') || 'cm' 키, 
nvl2(weight, weight, '0') || 'kg' 몸무게,
ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)),0) "BMI비만지수"
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
order by height desc
;

-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 이
-- MF 포지션인 선수
-- 팀명 오름차순
--OR PLAYER.TEAM_ID LIKE 'K10'
SELECT TEAM_NAME, TEAM_ID
FROM TEAM;

SELECT
TEAM_NAME, PLAYER_NAME
FROM TEAM A JOIN PLAYER
ON PLAYER.TEAM_ID LIKE 'K02'
OR PLAYER.TEAM_ID LIKE 'K10' 
    AND PLAYER.POSITION LIKE 'MF'
    AND PLAYER.PLAYER_NAME LIKE '고%'
ORDER BY TEAM_NAME
;

-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 이
-- 키가 185 이상 190 이하인 선수들
-- 팀명, 사람명 오름차순


-- 모든 선수들 중
-- 포지션을 배정받지 못한 선수들의 팀과 이름
-- 팀명, 사람명 오름차순
SELECT 
NVL2(PLAYER.POSITION, TEAM.TEAM_NAME, '0') 팀명, 
NVL2(PLAYER.POSITION, PLAYER.PLAYER_NAME, '0') 이름,
PLAYER.POSITION
FROM TEAM INNER JOIN PLAYER
ON PLAYER.TEAM_ID LIKE 'K02'
OR TEAM.TEAM_ID LIKE 'K10'
ORDER BY TEAM_NAME, PLAYER_NAME
;

