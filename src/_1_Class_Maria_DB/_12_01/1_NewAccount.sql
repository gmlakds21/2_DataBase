Create database bigdata;	-- database 이름

Create user 'bigdata'@'%'	-- 계정 이름
    identified by 'bigdata2020';	-- 계정 비밀번호

GRANT SELECT, INSERT, UPDATE,
    DELETE, CREATE, DROP, REFERENCES, INDEX,
    ALTER, CREATE TEMPORARY TABLES,
    LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW,
    CREATE ROUTINE, ALTER ROUTINE, TRIGGER
    ON bigdata.* TO 'bigdata'@'%' -- database 이름, 계정 이름
    WITH GRANT OPTION;

flush privileges;