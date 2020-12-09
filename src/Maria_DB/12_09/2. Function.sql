-- Function 함수



-- 숫자 처리 함수



-- mod(분자, 분모) : 나머지
select mod(10,4), mod(10,3);

-- rand() : 난수생성
select rand(), rand()*10, floor(rand()*10); -- int 처럼 소수 자르기

-- abs (값) : 절대 값
select abs(-4.5), abs(4.5);

-- round (값, 자릿수) : 반올림
select round(0.12345,2), round(12345,-2);

-- floor (값) : 내림
select floor(4.9), floor(-4.2);

-- ceil (값) : 올림
select ceil(4.1), ceil(-4.9);

-- log (밑, 값) : 로그
select log(2,8);

-- power(값, 제곱) : 제곱
select power(2,3);

-- sqrt(값) : 제곱근
select sqrt(8);

-- sign(값) : 싸인  ???
select sign(60*180/3.14);



-- 문자 처리 함수



-- ascii(문자) : ASCII 코드 출력
select ascii('a'), ascii('A'), ascii('0');

-- char(숫자) : 문자의 ASCII 코드 출력
select char(97), char(65), char(48), char(ascii('0'));

-- length(문자열) : 문자열 길이 / 한글은 3바이트(유니코드) , 2바이트(win949, euc-kr)
select length('ABC'), length('Hello, World!!'), length('안녕');

-- concat(문자열1, 문자열2) : 문자열 연결
select concat('ABC ', 'Hello,', 'World!!');
select concat('고객의 이름은',name,'입니다.');

-- 문자열 추출 : left(문자열, 길이), right(문자열, 길이), mid(문자열, 시작, 길이)
select left('Hello, World!!', 5), right('Hello, World!!',7), mid('Hello, World!!', 3, 4);

-- 문자열 추출 : substr (문자열, 시작)
select substr('Hello, World!!', 3);

-- 고급 문자열 추출 : substring (문자열, 시작, 길이)
select substring('Hello, World!!', 2,3), substring('Hello, World!!', -4, 4);

-- upper lower ucase lcase : 대문자 소문자 변환
select upper('abc'), lower('ABC'), ucase('abc'), lcase('ABC');

-- trim, ltrim, rtrim : 공백 제거
select trim(' a b '), ltrim(' a b '), rtrim(' a b ');

-- lpad, rpad (문자열, 총길이, 채움문자) : 문자열 채움
select lpad('123', 6, '_'), rpad('123', 6, '_');

-- replace(문자열, 찾을문자, 바꿀문자) : 문자열 바꾸기
select replace('Hello, World!!', 'World', 'MariaDB'), replace('Hello, World!!', 'World', '');

-- reverse : 문자열 뒤집기
select reverse('12345'), reverse('abcde');

-- instr(문자열, 찾을문자) : 문자열 위치찾기  // 존재하지 않는 경우 0으로 출력
select instr('Hello, World', 'W'), instr('Hello, World', 'Hello'), instr('Hello, World', 'a');

select instr(substr('Hello_World_!!', instr('Hello_World_!!', '_')+1),'_') + instr('Hello_World_!!', '_');

-- substring_index( ) : 문자열 위치 찾기
select length(substring_index('Hello_World_!!', '_', 2))+1;
select length(substring_index('World_of_Warcraft_Shadow_land','_',3))+1;

