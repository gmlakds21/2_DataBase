-- update
-- 데이터베이스의 특징 레코드의값을 변경할 때 사용
-- update 테이블명
-- set 변경할 컬럼명 = 새로운값, ...
-- where 조건식
update product set pro_name = '통큰파이' where pro_no = 'p03';
update product set pro_name = '통큰파이' where pro_no = ( select pro_no from users where name = '정소화') ;


-- delete
-- 지정한 레코드를 삭제함
-- delete from 테이블명
-- where 조건식
delete from product where pro_no = 'p03';
delete from product where pro_no = ( select pro_no from users where name = '정소화' );
