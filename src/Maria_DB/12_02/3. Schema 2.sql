-- not null 제약 조건 생성
-- 데이터 입력시 빈칸으로 입력하지 못하게 해주는 키워드
-- 컬럼명 컬럼유형 not null

create table employees (
                           employee_id 	int,
                           first_name  	varchar(25) NOT null, -- <- 초기단계에 NOT NULL 설정하는 방법
                           last_name 		varchar(25) NOT null,
                           department_id	int
);
describe employees;

-- default 제약 조건
-- 데이터 입력 누락시 자동으로 값을 설정해주는 키워드
-- 컬럼명 컬럼유형 default 기본값

create table members (
                         user_id varchar(10),
                         user_pw varchar(10),
                         grade	varchar(10) default 'bronze',
                         points	int			default 1000
);


select * from
    information_schema.table_constraints;







