-- 조인 검색
-- 다중 테이블을 대상으로 하는 연산
-- 여러개의 테이블을 결합해서 원하는 데이터를 검색 하는 것
-- 조인 방법 : inner join, outer join, self join

-- inner join
-- 각 테이블에 존재하는 동일한 컬럼을 대상으로
-- 결합해서 결과 조회
-- select A.a, B.b from A, B where A.a = B.b and;
--          ( where 절이 join 조건인지, where 조건인지 구분이 힘듬 )
-- select A.a, B.b from A inner join B on A.a = B.b ( 표준 )
-- select A.a, B.b from A inner join B using (a) ( 표준 )
--          ( 이 방식은 A.a와 B.b의 이름이 동일할 경우에만 사용 가능하다. )

-- 주문 테이블에서 banana 고객에 주문한 상품의 이름을 조회하세요
-- a. 두 테이블 결합하기
select * from tableA, tableB where tableA.name = tableB.name;
-- as로 별칭을 만들어 길이를 줄이기
select * from tableA as 'A', tableB as 'B' where A.name = B.name;

select * from tableA inner join tableB on tableA.name = tableB.name;
select * from tableA inner join tableB using (name);


