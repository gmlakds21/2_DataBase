-- 데이터 조회 : select

create table members (
    user_id varchar(10),
    user_pw varchar(10),
    name	varchar(10),
    grade	varchar(10) default 'bronze',
    points	int			default 1000,
    in_date datetime
);

insert into members ( user_id, name, grade ) values
('aaa', '전지현', 'bronze'),
('bbb', '원빈', 'silver'),
('ccc', '연예인', 'gold');


-- 특정 데이터만을 조회할 때 ( select 컬럼목록 from 테이블명; )
select user_id, name, grade from members;


-- 모든 데이터를 조회할 때 ( select * from 테이블명; )
select * from members;


-- 중복을 배제하고 조회할 때 ( select 컬럼명 from 테이블명; )
select grade from members;				-- bronz가 3개 나옴
select distinct grade from members;		-- bronz가 1개 나옴


-- 컬럼명을 변경하여 조회 ( select 컬럼명 as 새컬럼명 from 테이블명; )
select grade as 등급, name as 이름 from members;
select grade 등급, name 이름 from members;		-- as를 빼고 사용해도 된다.
select grade 등급, name '이   름' from members;	-- 중간에 공백을 포함하게 되는경우 '' 나 "" 를 사용


-- 산술식을 이용한 조회 ( select 산술식 from 테이블명; )
select name as 이름, points as '기존 포인트', points+1000 as '2021년 포인트' from members;


-- 조건식을 이용한 조회 ( select 컬럼명 from 테이블명 where 조건식; )
select name from members where grade = 'bronze';
-- 같다 =, 다르다 <>, 둘다 만족 AND, 하나만 만족 OR, 만족하지 않는다 NOT
-- ex) grade = 'bronze' AND points > 1500;


-- null 을 이용한 조회 ( select 컬럼명 from 테이블명 where is null; )
select name from members where name is null;


drop table members;