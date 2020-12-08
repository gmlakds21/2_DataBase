create database playground7;

create user 'playground7'@'%'
    identified by 'playground2020';

GRANT SELECT, INSERT, UPDATE,
    DELETE, CREATE, DROP, REFERENCES, INDEX,
    ALTER, CREATE TEMPORARY TABLES,
    LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW,
    CREATE ROUTINE, ALTER ROUTINE, TRIGGER
    ON playground7.* TO 'playground7'@'%'
    WITH GRANT OPTION;

flush privileges;
