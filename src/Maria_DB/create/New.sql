create database playground5;

create user 'playground5'@'%'
    identified by 'playground2020';

GRANT SELECT, INSERT, UPDATE,
    DELETE, CREATE, DROP, REFERENCES, INDEX,
    ALTER, CREATE TEMPORARY TABLES,
    LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW,
    CREATE ROUTINE, ALTER ROUTINE, TRIGGER
    ON playground5.* TO 'playground5'@'%'
    WITH GRANT OPTION;

flush privileges;
