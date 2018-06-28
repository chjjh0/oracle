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
-- 008
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 이
--GK 포지션인 선수
-- 팀명, 사람명 오름차순
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
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 이
-- 키가 180 이상 183 이하인 선수들
-- 키, 팀명, 사람명 오름차순
SELECT
    P.HEIGHT || 'cm' 키,
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 이름
FROM PLAYER P
    INNER JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.TEAM_ID IN('K02', 'K10')
    AND P.HEIGHT BETWEEN 180 AND 183 
ORDER BY P.HEIGHT, T.TEAM_NAME, P.PLAYER_NAME
;

SELECT
    P.HEIGHT || 'cm' 키,
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 이름
FROM PLAYER P
    INNER JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.TEAM_ID IN('K02', 'K10')
    AND P.HEIGHT BETWEEN 180 AND 183 
ORDER BY P.HEIGHT, T.TEAM_NAME, P.PLAYER_NAME
;

SELECT
    P.HEIGHT || 'cm' 키,
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 이름
FROM PLAYER P
    INNER JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.TEAM_ID IN('K02', 'K10')
    AND P.HEIGHT BETWEEN 180 AND 183 
ORDER BY P.HEIGHT, T.TEAM_NAME, P.PLAYER_NAME
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

-- SOCCER_SQL_010
--  모든 선수들 중
-- 포지션을 배정받지 못한 선수들의 팀과 이름
-- 팀명, 사람명 오름차순
SELECT 
T.TEAM_NAME 팀명,
P.PLAYER_NAME 이름,
NVL2(P.POSITION, '', '미정') 포지션
FROM PLAYER P
    INNER JOIN TEAM T
    ON P.POSITION IS NULL
ORDER BY T.TEAM_NAME, P.PLAYER_NAME
;

-- SOCCER_SQL_011
--  팀과 스타디움을 조인하여
-- 팀이름, 스타디움 이름 출력
SELECT
T.TEAM_NAME 팀명,
S.STADIUM_NAME 경기장
FROM TEAM T
LEFT JOIN STADIUM S
ON T.STADIUM_ID LIKE S.STADIUM_ID
ORDER BY T.STADIUM_ID
;

-- SOCCER_SQL_012
-- 팀과 스타디움, 스케줄을 조인하여
-- 2012년 3월 17일에 열린 각 경기의 
-- 팀이름, 스타디움, 어웨이팀 이름 출력
-- 다중테이블 join 을 찾아서 해결하시오.
SELECT 
    T.TEAM_NAME 팀명,
    ST.STADIUM_NAME 경기장,
    SC.AWAYTEAM_ID 원정팀ID,
    SC.SCHE_DATE 스케줄날짜
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
-- 2012년 3월 17일 경기에 
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함), 
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오
SELECT 
    P.PLAYER_NAME 이름,
    P.POSITION 포지션,
    T.TEAM_NAME 팀명,
    ST.STADIUM_NAME 스타디움,
    SC.SCHE_DATE 일정
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
-- 홈팀이 3점이상 차이로 승리한 경기의 
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오
select
    s.stadium_name 스타디움,
    k.sche_date 경기날짜,
    ht.region_name || ' ' || ht.team_name 홈팀,
    at.region_name || ' ' || at.team_name 원정팀,
    k.home_score "홈팀 점수",
    k.away_score "원정팀 점수"
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
-- STADIUM 에 등록된 운동장 중에서
-- 홈팀이 없는 경기장까지 전부 나오도록
-- 카운트 값은 20 , 일산 밑에 마산, 안양도 있음






-- SOCCER_SQL_016
-- 소속이 삼성블루윙즈 팀인 선수들과
-- 드래곤즈팀인 선수들의 선수 정보
SELECT 
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 선수명,
    P.POSITION 포지션,
    P.BACK_NO 백넘버,
    P.HEIGHT 키
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID IN ( 
    (SELECT T.TEAM_ID FROM TEAM WHERE T.TEAM_NAME IN ('삼성블루윙즈', '드래곤즈')
    ))
;