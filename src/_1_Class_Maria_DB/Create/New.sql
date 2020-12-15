Create database Sungjuk;

Create user 'Sungjuk'@'%'
    identified by 'Sungjuk2020';

GRANT SELECT, INSERT, UPDATE,
    DELETE, CREATE, DROP, REFERENCES, INDEX,
    ALTER, CREATE TEMPORARY TABLES,
    LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW,
    CREATE ROUTINE, ALTER ROUTINE, TRIGGER
    ON Sungjuk.* TO 'Sungjuk'@'%'
    WITH GRANT OPTION;

flush privileges;
