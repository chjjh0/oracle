update member set mem_id = 'chjjh0' where member.mem_id like '°¡¿À°¶1'
;

ALTER TABLE member
ADD (password VARCHAR2(20));

ALTER TABLE MEMBER
ADD (SSN VARCHAR2(20)); 

INSERT INTO member.password VALUES (1);
update member SET password = '1';

ALTER TABLE MEMBER RENAME COLUMN MEM_ID TO MEMID;
ALTER TABLE MEMBER RENAME COLUMN TEAM_ID TO TEAMID;

