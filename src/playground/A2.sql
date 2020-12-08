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
