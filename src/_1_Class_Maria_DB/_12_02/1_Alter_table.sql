_1_Class_Maria_DB.Create table abc (
    a int primary key,
    b char(10)
);
describe abc; 				-- abc 테이블의 내용 보기



-- 테이블에 컬럼 추가하기 ( alter table 테이블명 add 컬럼명 컬럼정의 )
alter table abc add c int; 	-- abc 테이블에 x칼럼 추가
desc abc;					-- abc 테이블의 내용 보기 (약식)



-- 테이블에 컬럼 삭제하기 ( alter table 테이블명 drop 컬럼명 )
alter table abc drop c;		-- abc 테이블에 x칼럼 삭제
describe abc;				-- abc 테이블의 내용 보기



-- 테이블의 칼럼 수정하기 ( alter table 테이블명 modify column 컬럼정의 )
alter table abc modify b int; 	-- abc 테이블의 y칼럼 수정
describe abc;					-- abc 테이블의 내용 보기



-- ex) 성적 데이터를 저장하기 위한 테이블 생성
-- 		// 기본 : 이름, 국어, 영어, 수학 ( 모두 문자로 생성 )
-- 		// 추가 : 총점, 평균, 학점		  ( 모두 숫자로 생성 )

_1_Class_Maria_DB.Create table sungjuk (  -- // 기본 : 이름, 국어, 영어, 수학
    name char(6),
    kor	varchar(10),
    eng	varchar(10),
    mat varchar(10)
);
describe sungjuk;


alter table sungjuk 	-- // 추가 : 총점, 평균, 학점
    add sum int,
    add mean int,
    add grd int;
describe sungjuk;


alter table sungjuk  -- 테이블의 칼럼 수정하기 ( modify column 컬럼정의 )
    modify kor int,
    modify eng int,
    modify mat int,
    modify grd char(2),
    modify mean decimal(4,1);
describe sungjuk;



drop table abc;
drop table sungjuk;