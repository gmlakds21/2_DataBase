-- 뷰 view
-- 다른 테이블을 기반으로 만들어진 가상의 테이블의 역할을 함
-- 뷰는 실제로 데이터를 저장하고 있지는 않음
-- 하지만, 사용자가 이 사실을 인지하지 못하고 실제의 테이블처럼 조작가능
-- 뷰의 목적 : 1. 특정 필드에만 접근 허용 (보안)
--            2. 테이터 조작의 간소화 (조인/검색)
--
-- 1. 복잡한 질의문을 간단하게 작성가능
-- 2. 보여줘서는 안되는 데이터들을 숨겨서 작성 가능
--
-- create view 뷰이름 as
-- select
-- [ with check option ] -- 뷰에 삽입이나 수정 연산을 할때 제약조건을 그대로 가져옴
-- order by 는 사용 불가

create view VIP as
    select user_id, name, age from users
    where grade = 'vip';

-- 뷰를 이용한 데이터의 삽입, 수정, 삭제
-- 뷰는 원본테이블의 분신이므로
-- 삽입, 수정, 삭제 작업은 원본테이블을 대상으로 진행
-- 단, 삽입, 수정, 삭제는 제한적으로 수행될 수 있음

insert into VIP values (3, '홍길동', 20);
update VIP set age = 24 where name = '홍길동';
delete from VIP where name = '홍길동';