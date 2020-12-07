-- 11b) 도서의 가격을 내림차순으로, 가격이 같으면 출판사이름으로 오름차순 정렬해서 조회하세요
select price, publisher from Books order by price desc, publisher;

-- 12) 고객이 주문한 도서의 총, 평균, 최고, 최저 판매액을 조회하세요
select sum(saleprice), round(avg(saleprice)), max(saleprice), min(saleprice) from BookOrders;

-- -13b) 출판사별 도서의 총 수량 조회하세요
select publisher, count(bookid) from Books group by publisher;

-- 14) 출판사별 도서의 총 수량이 2권이상인 출판사 조회하세요
select publisher, count(bookid) from Books group by publisher having count(bookid) >= 2;

-- 14b) 가격이 8000이상인 도서를 구매한 고객별 주문 도서의 총 수량을 구하세요
select custid, count(bookid) from BookOrders group by custid
having max(saleprice) >= 12000;

-- 14b) 가격이 8000이상인 도서를 구매한 고객별 주문 도서의 총 수량을 구하세요
-- 단, 고객별 2권이상 주문한 고객을 대상으로 한다
select custid, count(bookid) from BookOrders group by custid
having max(saleprice) >= 8000 and count(bookid) >= 2;




create table Books (
                       bookid		int			primary key,
                       bookname	varchar(50),
                       publisher	varchar(20),
                       price		int
);

create table BookMembers (
                             custid	int			primary key,
                             name	char(6),
                             address	varchar(50),
                             phone	varchar(15)
);

create table BookOrders (
                            orderid		int 	primary key,
                            custid		int,
                            bookid		int,
                            saleprice	int,
                            orderdate	date,
                            foreign key	(bookid)
                                references Books (bookid),
                            foreign key (custid)
                                references BookMembers (custid)
);




-- 15) 주문한 고객번호,고객이름과 주문금액,주소를 조회하세요
-- 고객 테이블과 주문 테이블을 조합해야 조회가능
-- 외래키 관계에 있는 컬럼을 대상으로 결합
select


-- 15b) 박지성 고객의 주문금액,주소,주문일자를 조회하세요
select saleprice, a

-- 16) 주문한 도서이름,주문금액,주문일자를 조회하세요


-- 17) 박지성 고객의 주문금액,주소,주문일자를 조회하세요


-- 18) 주문한 도서이름,주문금액,주문일자를 조회하세요


-- 19) 가격이 20000인 도서를 주문한 고객 이름 조회하세요


-- 20) 주문한 고객이름, 도서이름, 주문일자 출력하세요


-- 21) 도서를 구매하지 않은 고객을 포함하여 고객이름과 주문한 도서의 판매금액을 조회하세요

-- 24) 주문 테이블에서 나이가 30세 이상인 고객이 주문한 제품의 주문제품과 주문일자를 조회하세요
select name, age, pro_no, order_time from order_table inner join users
    on order_table.user_id = users.user_id where age >= 30;

-- 25) 주문 테이블에서 고명석 고객이 주문한 제품의 이름을 조회하세요
select pro_name from product inner join order_table inner join users
    on product.pro_no = order_table.pro_no and order_table.user_id = users.user_id
where name = '고명석';