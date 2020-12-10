-- Function 함수



-- 숫자 처리 함수

-- 나머지
-- mod(분자, 분모)
select mod(10,4), mod(10,3);

-- 난수 생성
-- rand()
select rand(), rand()*10, floor(rand()*10); -- int 처럼 소수 자르기

-- 절대 값
-- abs (값)
select abs(-4.5), abs(4.5);

-- 반올림
-- round (값, 자릿수)
select round(0.12345,2), round(12345,-2);

-- 내림
-- floor (값)
select floor(4.9), floor(-4.2);

-- 올림
-- ceil (값)
select ceil(4.1), ceil(-4.9);

-- 로그
-- log (밑, 값)
select log(2,8);

-- 제곱
-- power(값, 제곱)
select power(2,3);

-- 제곱근
-- sqrt(값)
select sqrt(8);

-- 삼각 함수
-- sign(값)
select sign(60*180/3.14);



-- 문자 처리 함수


-- ASCII 코드 출력
-- ascii(문자)
select ascii('a'), ascii('A'), ascii('0');

-- 문자의 ASCII 코드 출력
-- char(숫자)
select char(97), char(65), char(48), char(ascii('0'));

-- 문자열 길이 /  한글은 3바이트(유니코드), 2바이트(win949, euc-kr)
-- length(문자열)
select length('ABC'), length('Hello, World!!'), length('안녕');

-- 문자열 연결
-- concat(문자열1, 문자열2)
select concat('ABC ', 'Hello,', 'World!!');
select concat('고객의 이름은',name,'입니다.');

-- 문자열 추출
-- left(문자열, 길이), right(문자열, 길이), mid(문자열, 시작, 길이)
select left('Hello, World!!', 5), right('Hello, World!!',7), mid('Hello, World!!', 3, 4);

-- 문자열 추출 2
-- substr (문자, 시작)
select substr('Hello, World!!', 3);

-- 고급 문자열 추출
-- substring (문자열, 시작, 길이)
select substring('Hello, World!!', 2,3), substring('Hello, World!!', -4, 4);

-- 대문자 / 소문자 변환
-- upper lower ucase lcase
select upper('abc'), lower('ABC'), ucase('abc'), lcase('ABC');

-- 공백 제거
-- trim, ltrim, rtrim
select trim(' a b '), ltrim(' a b '), rtrim(' a b ');

-- 문자열 채움
-- lpad, rpad (문자열, 총길이, 채움문자)
select lpad('123', 6, '_'), rpad('123', 6, '_');

-- 문자열 바꾸기
-- replace(문자열, 찾을문자, 바꿀문자)
select replace('Hello, World!!', 'World', 'MariaDB'), replace('Hello, World!!', 'World', '');

-- 문자열 뒤집기
-- reverse
select reverse('12345'), reverse('abcde');

-- 문자열 위치찾기 //  존재하지 않는 경우 0 으로 출력
-- instr(문자열, 찾을문자)
select instr('Hello, World', 'W'), instr('Hello, World', 'Hello'), instr('Hello, World', 'a');

select instr(substr('Hello_World_!!', instr('Hello_World_!!', '_')+1),'_') + instr('Hello_World_!!', '_');

-- 문자열 위치 찾기
-- substring_index( )
select length(substring_index('Hello_World_!!', '_', 2))+1;
select length(substring_index('World_of_Warcraft_Shadow_land','_',3))+1;