-- 데이터 조회 : select 2

Create table members (
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



-- 문자열 부분 검색 ( select 컬럼명 from 테이블명 where 컬럼명 like 조건 ; )
-- like 키워드를 이용하여 문자열을 대상으로 부분적으로 일치하는 데이터를 조회할 수 있음
-- % : 0개 이상의 문자열 일치
-- _ : 1개 문자열 일치
select * from members where name like '전__';



-- 조회 결과 정렬 ( select 컬럼명 from 테이블명 order by points desc; )
-- order by 절을 이용하면 조회결과를 특정컬럼 기준으로 오름차순, 내림차순으로 출력할 수 있음.
select name, points from members order by name;



-- 집계 조회 ( select 집계함수(컬럼명) from 테이블명; )
-- 특정 컬럼을 기준으로 통계적 결과를 조회할때 사용 null값은 제외
-- 집계 함수 : 갯수, 합계, 평균, 최대, 최소
-- 집계 함수는 select 또는 having 절에만 사용 가능

-- 평균 ( avg ) : points 의 평균
select avg(points) from members;
-- 합계 ( sum ) : points 의 합계
select sum(points) from members;
-- 갯수 ( count ) : points 의 갯수
select count(points) from members where points = 1000;
-- 최대 ( max ) : points 의 최대값
select max(points) from members;
-- 최소 ( min ) : points 의 최소값
select min(points) from members;



-- 그룹별 조회 ( select 컬럼1, count(컬럼1) from 테이블명 group by 컬럼1 )
-- 동일한 데이터들을 모아 그룹을 만들고 조회할 수 있음
-- 단, 그룹을 만든 상태에서 조건 검색을 하려면 having 절을 사용해야 함

select grade, sum(grade) from members group by grade;

