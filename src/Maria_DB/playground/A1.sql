-- 1) 모든 도서의 이름과 가격을 조회하세요
select bookname as '도서의 이름', price as '가격' from Books;

-- 1b) 모든 도서의 가격, 이름을 조회하세요
select price as '가격', bookname as '도서의 이름' from Books;

-- 2) 모든 도서의 번호,이름, 출판사,가격을 조회하세요
select bookid as '도서의 번호', bookname as '도서의 이름',
       publisher as '출판사', price as '가격' from Books;

-- 2b) 모든 도서의 정보를 조회하세요
select * from Books;

-- 3) 모든 도서의 출판사를 조회하세요
select publisher as '출판사' from Books;

-- 3b) 모든 도서의 출판사를 조회하세요 (중복제거)
select distinct publisher as '출판사' from Books;

-- 4) 고객의 이름, 주민번호를 조회하세요
-- 단, 출력결과의 필드명을 '이름,주민번호'로 바꿔 출력
select name as '고객의 이름', phone as '핸드폰 번호' from BookMembers;

-- 5) 고객의 이름과 주소를 조회하세요
select name as '고객의 이름', address as '주소' from BookMembers;

-- 6) 가격이 20000미만인 도서를 조회하세요
select bookname as '도서 명', price as '가격' from Books where price < 20000;

-- 7) 가격이 15000이상 ~ 25000이하인 도서의 제목을 조회하세요
select bookname as '도서의 제목', price as '가격' from Books where price between 15000 and 25000;

-- 8) 책이름이 '축구의 역사' 또는 '피겨 교본'인 도서의 출판사를 조회하세요
select publisher as '출판사' from Books where bookname = '축구의 역사' or bookname = '피겨교본';
select publisher as '출판사' from Books where bookname in ('축구의 역사', '피겨교본');

-- 9) '축구'로 시작하는 도서 이름을 조회하세요
select bookname as '도서 이름' from Books where bookname like '축구%';

-- 9b) '축구'로 끝나는 도서 이름을 조회하세요
select bookname as '도서 이름' from Books where bookname like '%축구';

-- 9c) '축구'를 포함하는 도서 이름을 조회하세요
select bookname as '도서 이름' from Books where bookname like '%축구%';

-- 9d) 도서이름 중에 '의'를 포함하는 책은?
select bookname as '도서 이름' from Books where bookname like '%의%';

-- 10) '골프'를 포함하고 가격이 30000이상인 도서 이름을 조회하세요
select bookname as '도서 이름' from Books where bookname like '%골프%' and price >= 30000;

-- 11) 고객이름을 가나다순으로 오름차순 정렬하고
-- 이름이 같으면 주소로 내림차순 정렬해서 조회하세요
select name from users order by name, address desc;