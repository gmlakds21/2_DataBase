-- 조건 판단 함수

-- 가르키는 값이 애매할때 사용하면 유용함
-- 부서파트에 null 값이 있다면 null 대신에
-- '지정된 부서 없음' 으로 사용 할 수 있다.

-- null 처리
-- coalesce(문자열, 널일때 대체값)
select NUll, coalesce(null, '널임'), coalesce('Hello', '널임');

-- ifnull(문자열, 널일때 대체값)
select NUll, ifnull(null, '널임'), ifnull('Hello', '널임');

-- 두값이 일치하면 null, 다르면 문자열1
-- nullif(문자열1, 문자열2)
select nullif('abc','abc'), nullif('abc','ab'), nullif('null','nul'),
       nullif(NULL, NULL ), nullif(12,123);

-- MVL : oracle 에서 사용함

-- 조건 판단
-- if (조건식 , 참일 때 값, 거짓일 때 값 )
select if (5>3, '크다', '작다'), if (2>3, '크다', '작다');

-- case when 조건식 then 처리값 else 처리값 end
select case when 5>3 then '크다' else '작다' end, case when 2>3 then '크다' else '작다' end;



-- 날짜 / 시간 함수 : year, month, week, day, hour, minute, second



-- YYYY-MM-DD HH:MM:SS : 현재 날짜 / 시간 - 미국 기준
-- now(), current_timestamp, sysdate()
select now(), current_timestamp, sysdate();

-- YYYY-MM-DD : 현재 날짜 - 미국 기준
-- curdate(), current_date
select curdate(), current_date;

-- HH-MM-SS : 현재 시간 - 미국 기준
-- curtime(), current_time
select curtime(), current_time();

-- 몇일 후의 날짜 계산
-- adddate, subdate, date_add, date_sub ( 날짜, interval 날짜 간격 )
select adddate(current_date, interval 15 day), subdate(current_date, interval 15 day);
select date_add(current_date, interval 5 day), date_sub(current_date, interval 5 day);

-- 날짜 사이의 시간 계산
-- datediff(날짜1, 날짜2)
select datediff('2021-03-21', current_date);

-- 정확한 시간 추출
-- 단위(날짜)
select year(now()), month(now()), week(now()), year('2007-12-24'), hour('12:12:12');

-- 기준으로 얼마나 지났는지
-- dayof단위(날짜), weekof단위(날짜)
select dayofmonth(now()) '이번달 기준 몇일', dayofweek(now()) '이번주 기준 몇일', weekofyear(now());

-- 몇월 몇일인지
-- 단위name(날짜)
select monthname(now()) '몇월', dayname(now()) '요일'

select substring('일월화수목금토',dayofweek(now()),1);
select concat(substring('일월화수목금토',dayofweek(now()),1), '요일');

-- 날짜 / 시간 환산
-- timestampdiff(유형, 날짜1, 날짜2)
select timestampdiff(day, '2020-12-15', '2020-12-25'), timestampdiff(hour, '2020-12-15', '2020-12-25');

-- 달의 마지막 일 출력
-- last_day(날짜)
select last_day ('2020-02-01');

-- 변환함수 : %Y,%y %m %d // %H,%h %i %s // %M %W %a %j // %p
-- str_to_date(문자열, 형식문자열) : 입력된 날짜를 YYYY-MM-DD HH:MM:SS 의 형태로 출력
select str_to_date('02-01-2020','%m-%d-%Y'), str_to_date('02/01/2020','%m/%d/%Y');

-- date_format(문자열, 형식문자열) : YYYY-MM-DD HH:MM:SS 의 형태를 내가 원하는 형태로 출력
select date_format('2020-02-01','%d-%m-%Y'),
       date_format('2020-02-01', '%M %W %a %j'),
       date_format('2020-02-01 12:14:12', '%p'); -- 앞에 YYYY MM DD 까지 다 써줘야 함

-- 응용
select date_format(str_to_date('02-01-2020', '%m-%d-%Y') , '%Y-%m-%d');



-- 자료 분석 함수



-- 자료 형 변환
-- cast (대상 as 자료형)
-- char date/time decimal, float
select 123456, cast(123456 as char), cast(091225 as time), cast(091225 as date);
select 12/34, cast(12/34 as float), cast(12/34 as decimal(3,2)), cast(12/34 as integer);



-- 순서 함수 : 순서 함수를 적용하기 위해서는 먼저 대상 컬럼이 정렬되어 있어야 함



-- 이전, 이후 데이터 출력
-- lag( )over(order by ), lead( )over(order by ) // 정렬된거 기준으로 바로전 자료, 정렬된거 기준으로 다음 자료
select lag(name) over(order by id), name over(order by id), lead(name) over(order by id)
    from users order by id;

-- 맨 처음, 맨 마지막 값 출력
-- first_value(컬럼명), last_value(컬럼명)
select first_value(name) over(order by id), last_value(name) over(order by id)
    from users;







-- 분석 함수  : OLAP -> 최종적으로 빅 데이터

-- 순위 함수 : rank, dense, row_number
-- 통계, 회귀 분석 : stddev, variance, covar, corr




