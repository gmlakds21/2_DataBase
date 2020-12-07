-- 제약 조건 추가하기
create table employees (
                           employee_id 	int,
                           first_name  	varchar(25),
                           last_name 		varchar(25),
                           department_id	int
);
describe employees;

create table departments (
                             department_id 	int,
                             department_name	varchar(30),
                             manager_id		int
);
describe departments;

-- 복잡한 관계들로 구선된 테이블들을 생성시 번거로움 발생

-- 데이터 베이스에 생선된 제약조건 확인
select * from
    information_schema.table_constraints;





-- 기본키 제약 조건 생성
alter table 테이블명
    add constraint 제약조건명 primary key (컬럼명);


-- employees 테이블에 pk_emp라는 이름으로 emplyee_id를 primary key로 설정한다.
-- pk_emp는 검색할때 사용한다.
alter table employees
    add constraint pk_emp
        primary key (employee_id);


-- 검색어가 필요 없다면 이렇게 해도 된다.
alter table employees
    add primary key (employee_id);


-- 기본키 제약 조건 제거
alter table 테이블명
    drop primary key;

-- employees 테이블에서 primary key 제약을 제거한다.
alter table employees
    drop primary key;

-- 참고용 // oracle의 경우 제약 조건명으로 제약조건을 제거 할 수 있다. my_sql에선 안된다.
alter table employees
    drop constraint pk_emp;





-- 외래키 제약 조건 생성
alter table 테이블명
    add constraint 제약조건명
        foreign key (컬럼명)
            references 테이블명  (컬럼명);


-- departments 테이블에서 department_id 를 primary key 로 설정한다.
alter table departments
    add primary key (department_id);

-- departments 테이블에서 department_id 를 employees 테이블에 foreign key 로 설정한다.
alter table employees
    add constraint fk_emp_dep
        foreign key (department_id)
            references departments (department_id);


-- 외래키 제약 조건 제거
alter table 테이블명
    drop constraint 제약조건명;


-- employees 테이블에서 department_id 를 foreign key 설정 해제한다.
alter table employees
    drop constraint fk_emp_dep;



