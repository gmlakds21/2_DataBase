Create database Employees;

Create user 'Employees'@'%'
    identified by 'Employees2020';

GRANT SELECT, INSERT, UPDATE,
    DELETE, CREATE, DROP, REFERENCES, INDEX,
    ALTER, CREATE TEMPORARY TABLES,
    LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW,
    CREATE ROUTINE, ALTER ROUTINE, TRIGGER
    ON Employees.* TO 'Employees'@'%'
    WITH GRANT OPTION;

flush privileges;

create table employees (

    employee_id int,
    first_name  varchar(100),
    last_name   varchar(100),
    email       varchar(100),
    phone_number    varchar(100),
    hire_date       varchar(100),
    job_id          varchar(100)    default null,
    salary          int             default 0,
    commission_pct  decimal(20,10)  default null,
    manager_id      int             default null,
    department_id   int             default null,

    primary key (employee_id)
);

