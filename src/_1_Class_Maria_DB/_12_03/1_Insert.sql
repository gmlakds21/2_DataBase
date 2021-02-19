-- DML
-- 데이터 삽입문 : insert

Create table members (
                         user_id varchar(10),
                         user_pw varchar(10),
                         name	varchar(10),
                         grade	varchar(10) default 'bronze',
                         points	int			default 1000,
                         in_date datetime
);



-- 전체 값을 입력하는 삽입문
-- insert into 테이블명 values
-- ( 값1, 값2, 값3, .... );

insert into members values
('aaa', '123', '커피', 'bronze', 0, '2021-12-03 12:12:12'),
('bbb', '123', '커피', 'bronze', 0, '2021-12-03 12:12:12');



-- 특정 자료값만 입력하는 삽입문
-- insert into 테이블명 ( 컬럼1, 컬럼2, 컬럼3, .... ) values
-- ( 값1, 값2, 값3, .... );

insert into members (user_id, user_pw, name) values
('a01', '123', '전지현'),
('a02', '123', '원빈'),
('a03', '123', '연예인');



drop table members;
