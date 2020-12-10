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

-- 11) 고객이름을 가나다순으로 오름차순 정렬하고 이름이 같으면 주소로 내림차순 정렬해서 조회하세요
select name, address from users u
    inner join order_table ot on u.user_id = ot.user_id
    order by name, address desc;

-- 11b) 도서의 가격을 내림차순으로, 가격이 같으면 출판사이름으로 오름차순 정렬해서 조회하세요
select price, publisher from Books order by price desc, publisher;

-- 12) 고객이 주문한 도서의 총, 평균, 최고, 최저 판매액을 조회하세요
select sum(saleprice), round(avg(saleprice)), max(saleprice), min(saleprice) from BookOrders;

-- 13b) 출판사별 도서의 총 수량 조회하세요
select publisher, count(bookid) from Books group by publisher;

-- 14) 출판사별 도서의 총 수량이 2권이상인 출판사 조회하세요
select publisher, count(bookid) from Books group by publisher having count(bookid) >= 2;

-- 14b) 가격이 8000이상인 도서를 구매한 고객별 주문 도서의 총 수량을 구하세요
select custid, count(bookid) from BookOrders group by custid
having max(saleprice) >= 12000;

-- 14b) 가격이 8000이상인 도서를 구매한 고객별 주문 도서의 총 수량을 구하세요
--      단, 고객별 2권이상 주문한 고객을 대상으로 한다
select custid, count(bookid) from BookOrders group by custid
having max(saleprice) >= 8000 and count(bookid) >= 2;

-- 15) 주문한 고객번호,고객이름과 주문금액,주소를 조회하세요
select users.user_id, name, price, address from order_table
    inner join users on users.user_id = order_table.user_id
    inner join product on order_table.pro_no = product.pro_no;

-- 16) 주문한 도서이름,주문금액,주문일자를 조회하세요
select bookname, price, orderdate from Books
    inner join BookOrders on Books.bookid = BookOrders.bookid;

-- 17) 박지성 고객의 주문금액,주소,주문일자를 조회하세요
select name, saleprice, address, orderdate from Books
    inner join BookOrders on Books.bookid = BookOrders.orderid
    inner join BookMembers on BookMembers.custid = BookOrders.custid
    where name = '박지성';

-- 19) 가격이 20000인 도서를 주문한 고객 이름 조회하세요
select name from BookMembers BM
    inner join BookOrders BO on BM.custid = BO.bookid
where saleprice = 20000;

-- 20) 도서를 구매한 고객의 고객이름과 주문한 도서의 판매금액을 조회하세요
select name, saleprice from BookMembers BM
    inner join BookOrders BO on BM.custid = BO.custid;

-- 21) 도서를 구매하지 않은 고객을 포함하여 고객이름과 주문한 도서의 판매금액을 조회하세요
select name, orderid from BookMembers BM
    left outer join BookOrders BO on BM.custid = BO.custid;

-- 24) 주문 테이블에서 나이가 30세 이상인 고객이 주문한 제품의 주문제품과 주문일자를 조회하세요
select name, age, pro_no, order_time from order_table
    inner join users on order_table.user_id = users.user_id
    where age >= 30;

-- 25) 주문 테이블에서 고명석 고객이 주문한 제품의 이름을 조회하세요
select pro_name from product
    inner join order_table on product.pro_no = order_table.pro_no
    inner join users on order_table.user_id = users.user_id
    where name = '고명석';

-- 26) 달콤 비스킷
select pro_name, price from product
    where brand in (select brand from product where pro_name = '달콤비스킷');

-- 27)
select name, mileage from users where mileage = ( select max(mileage) from users );

-- 28) 바나나 고객이 주문한 제품
select pro_name, brand from product p
    where pro_no in ( select pro_no from order_table where user_id = 'banana');

-- 29) 주문하지 않은
select pro_name, brand from product p
    where pro_no not in ( select pro_no from order_table where user_id = 'banana');

-- 30) 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체 조회
select pro_name, price, brand from product
    where price > all ( select price from product where brand = '대한식품');

-- 31) 2019년 3월 15일에 제품을 주문한 고객의 이름 조회
select name from users
    where user_id in ( select user_id from order_table where order_time = '2019-03-15 __:__:__');

select name from users u
    inner join order_table ot on u.user_id = ot.user_id
    where order_time = '2019-03-15 __:__:__';

-- 32) 2019년 3월 15일에 제품을 주문하지 않은 고객의 이름 조회
select name from users
    where user_id not in ( select user_id from order_table where order_time = '2019-03-15 __:__:__');

-- 39) vip 고객의 아이디, 이름, 나이로 구성된 뷰 생성 단, 이름은 우수고객으로 작성
create view 우수_고객 as
    select user_id, name, age from users
    where grade = 'vip';

-- 40) 제조업체별 제품수로 구성된 뷰 생성, 뷰 이름은 업체별 제품수로 지정
create view 업체별_제품수 as
    select brand, count(pro_no) from product
    group by brand;

-- 41) 우수고객 테이블에서 나이가 25세 이상인 회원 조회
select * from 우수고객 where age >= 25;
















-- //
select concat(name,'고객의 주소는 ',address,'이고 전화번호는 ',phone,'입니다.') '고객 정보' from BookMembers

select bookname, replace(bookname, '야구','야아구') from Books;

update Books set bookname = replace(bookname, '야아구', '야구') where bookname like '%야구%';

select bookname from Books;

select bookname, char_length(bookname) from Books where publisher = '굿스포츠';

select bookname, char_length(replace(bookname,' ','')) from Books where publisher = '굿스포츠';

select left(name,1), count(name) from BookMembers group by left(name,1);



select lag(pro_name) over(order by pro_no), pro_name, lead(pro_name) over(order by pro_no) from product order by pro_no;

select user_id '나', order_time '나의 이용 날짜', lag(user_id) over(order by order_time) '전 사람', lag(order_time) over(order by order_time) '전사람의 이용 날짜'
    from order_table order by order_time;