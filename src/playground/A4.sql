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

-- 32 2019년 3월 15일에 제품을 주문하지 않은 고객의 이름 조회
select name from users
    where user_id not in ( select user_id from order_table where order_time = '2019-03-15 __:__:__');
