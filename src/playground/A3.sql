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