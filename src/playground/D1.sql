-- 1. 고객 테이블을 조회하세요
select * from Customers;

-- 2. 고객테이블에서 고객이름과 도시를 조회하세요
select ContactName, city from Customers;

-- 3. 고객 테이블에서 도시를 조회하세요 (중복은 제외한다)
select distinct city from Customers;

-- 4. 고객 테이블에서 국가 수를 조회하세요
select count(city) from Customers;

-- 5. 고객 테이블에서 국가가 'Mexico'인 고객을 조회하세요
select * from Customers where country = 'Mexico';

-- 6. 사원 테이블에서 ID가 5인 사원을 조회하세요
select * from Employees where EmployeeID = 5;

-- 7. 고객 테이블에서 국가가 'Germany'이고 도시가 'Berlin'인 고객을 조회하세요
select * from Customers where country = 'Germany' and City = 'Berlin';

-- 8. 고객 테이블에서 도시가 'Berlin' 이거나 'München' 인 고객을 조회하세요
select * from Customers where City = 'Berlin' or City = 'M?chen';

-- 9. 고객 테이블에서 국가가 'Germany' 또는 'Spain' 인 고객을 조회하세요
select * from Customers where country = 'Germany' or country = 'Spain';

-- 10. 고객 테이블에서 국가가 'Germany' 이 아닌 고객을 조회하세요
select * from Customers where City <> 'Germany';

-- 11. 고객 테이블에서 국가가 'Germany' 이고 도시가 'Berlin' 이거나 'München'인 고객을 조회하세요
select * from Customers where country = 'Germany' and ( City = 'Berlin' or City = 'M?chen' );

-- 12. 고객 테이블에서 국가가 'Germany' 아니고 'USA'도 아닌 고객을 조회하세요
select * from Customers where country <> 'Germany' and Country <> 'USA';

-- 13. 고객 테이블에서 국가순으로 A-Z로 정렬해서 조회하세요
select * from Customers order by Country;

-- 14. 고객 테이블에서 국가순으로 Z-A로 정렬해서 조회하세요
select * from Customers order by Country desc;

-- 15. 고객 테이블에서 국가순으로 A-Z로 정렬하되, 같은 경우 고객이름으로 A-Z로 정렬해서 조회하세요
select * from Customers order by Country, ContactName;

-- 16. 고객 테이블에서 국가순으로 A-Z로 정렬하되, 같은 경우 고객이름으로 Z-A로 정렬해서 조회하세요
select * from Customers order by Country, ContactName desc;

-- 17. 다음의 고객정보를 고객 테이블에 입력하세요 회사이름, 연락처이름, 주소, 도시, 우편번호, 국가 =>
insert into Customers value ('' , 'Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

-- 18. 다음의 고객정보를 고객 테이블에 입력하세요 회사이름, 도시, 국가 =>
insert into Customers value ('Cardinal', 'Stavanger', 'Norway');

-- 19. 고객 테이블에서 주소가 입력되지 않은 고객이름, 연락처이름, 주소를 조회하세요
select CustomerID, ContactName, Address from Customers where Address is null;

-- 20. 고객 테이블에서 주소가 입력된 고객이름, 연락처이름, 주소를 조회하세요
select CustomerID, ContactName, Address from Customers where Address is not null;

-- 21. 고객 테이블에서 1번 고객의 연락처 이름을 'Alfred Schmidt' 로, 도시를 'Frankfurt' 로 수정하세요
update Customers set ContactName = 'Alfred Schmidt' and City = 'Frankfurt' where

-- 22. 고객 테이블에서 국가가 Mexico 인 고객들의 연락처 이름을 'Juan'으로 변경하세요
update Customers set ContactName = ' Juan' where Country = 'Mexico';

-- 23. 고객 테이블에서 연락처 이름이 'Alfreds Futterkiste' 인 고객들을 삭제하세요
delete from Customers where ContactName = 'Alfreds Futterkiste';

    -- 24. 고객 테이블에서 3번째부터 7번째 고객을 조회하세요 단, 고객이름은 A-Z로 정렬한다
    select * from Customers order by ContactName;

    -- 25. 고객 테이블에서 국가가 'Germany' 인 고객들 중 3번째부터 7번째 고객을 조회하세요
    s

-- 26. 제품테이블에서 최대, 최소 가격을 조회하세요
select max(UnitPrice), min(UnitPrice) from Products where UnitPrice <> 0;

-- 27. 제품테이블에서 제품수, 평균가격을 조회하세요
select count(ProductID), avg(UnitPrice) from Products;

-- 28. 제품테이블에서 가격이 20이상인 제품수를 조회하세요
select count(ProductID) from Products where UnitPrice >= 20;

    -- 29. 제품상세테이블에서 주문수, 총 주문수량을 조회하세요
    select

-- 30. 고객 테이블에서 고객이름이 'A'로 시작하는 고객을 조회하세요
select * from Customers where ContactName like 'A%';







-- 31. 고객 테이블에서 고객이름이
-- 'a'로 끝나는 고객을 조회하세요
--
--
-- 32. 고객 테이블에서 고객이름에 'or'을
-- 포함하는 고객을 조회하세요
--
--
-- 32. 고객 테이블에서 고객이름의 2번째
-- 글자가 'r'로 시작하는 고객을 조회하세요
--
--
-- 32. 고객 테이블에서 고객이름이 'A'로
-- 시작하고 최소 3자 이상인 고객을 조회하세요
--
--
-- 33. 고객 테이블에서 연락처이름이 'a'로 시작하고
-- 'o'로 끝나는 고객을 조회하세요
--
--
-- 34. 고객 테이블에서 고객이름이 'A'로 시작하지
-- 않는 고객을 조회하세요
--
--
-- 35. 고객 테이블에서 도시이름이 'ber'로
-- 시작하는 도시를 조회하세요
--
--
-- 36. 고객 테이블에서 도시이름에 'es'를
-- 포함하는 도시를 조회하세요
--
--
-- 37. 고객 테이블에서 도시이름이 6자이며
-- 'erlin'로 끝나는 도시를 조회하세요
--
--
-- 38. 고객 테이블에서 도시이름이 6자이며
-- 'L'로 시작하고 on으로 끝나며,
-- 3번째 글자가 n인 도시를 조회하세요
--
--
-- 39. 고객 테이블에서 도시이름이 b, s, p등으로
-- 시작하는 도시를 조회하세요
--
--
-- 40. 고객 테이블에서 도시이름이 a에서 c사이로
-- 시작하는 도시를 조회하세요
--
--
-- 41. 고객 테이블에서 도시이름이 b, s, p등으로
-- 시작하지 않는 도시를 조회하세요
--
--
-- 42. 고객 테이블에서 국가이름이 'Germany',
-- 'France', 'UK'인 고객을 조회하세요
--
--
--
-- 43. 고객 테이블에서 도시이름이
-- 'Germany', 'France', 'UK'가 아닌
-- 고객을 조회하세요
--
--
--
-- 44. 상품 테이블에서 가격이
-- 10 ~ 20사이인 제품을 조회하세요
--
--
-- 45. 상품 테이블에서 가격이 10 ~ 20사이인
-- 제품을 조회하세요 단, 제품분류코드가
-- 1,2,3인 제품은 제외한다
--
--
--
-- 46. 상품 테이블에서 제품이름이
-- 'Carnarvon Tigers' 에서
-- 'Mozzarella di Giovanni' 사이인
-- 제품을 조회하세요
--
--
-- 47. 상품 테이블에서 제품이름이
-- 'Carnarvon Tigers' 에서
-- 'Mozzarella di Giovanni' 이외의
-- 제품을 조회하세요
--
--
-- 48. 주문 테이블에서 주문날짜가
-- '01-July-1996' 에서 '31-July-1996'사이인
-- 주문을 조회하세요
--
--
-- 49. 고객 테이블에서 고객번호, 고객이름을
-- 조회하세요 단, 고객번호는 ID로,
-- 고객이름은 Customer라는 별칭을 사용한다
--
--
--
-- 50. 고객 테이블에서 고객번호, 주소, 우편번호,
-- 도시, 국가등을 조회하세요 단, 주소, 우편번호,
-- 도시, 국가등은 쉼표로 연결해서
-- Address라는 별칭을 사용한다
--
--
--
-- 51. 고객 테이블을 이용해서
-- 국가별 고객수를 조회하세요
--
--
-- 52. 고객 테이블을 이용해서
-- 국가별 고객수가 5명 이상인 국가를 조회하세요
--
--
-- 53. 고객/주문 테이블을 이용해서
-- 주문번호, 고객이름, 주문일자를 조회하세요
--
--
-- 54. 고객/주문/배송자 테이블을 이용해서
-- 주문번호, 고객이름, 배송업체명을 조회하세요
--
--
-- 55. 주문/배송자 테이블을 이용해서
-- 배송업체별 주문건수를 조회하세요
--
--
-- 56. 주문/배송자 테이블을 이용해서 배송업체별
-- 주문건수가 300건 이상인
-- 배송업체를 조회하세요
--
--
--
-- 57. 주문/사원 테이블을 이용해서
-- 사원 'Davolio' 또는 'Fuller' 가
-- 맡은 총 주문건수 중
-- 100건 이상인 사원은 누구인가?
--
--
--
-- 58. 고객/주문 테이블을 이용해서
-- 주문번호가 없는 고객을 조회하세요
--
--
--
-- 59. 사원/주문 테이블을 이용해서
-- 주문번호가 없는 사원을 조회하세요
--
--
--
-- 60. 고객 테이블을 이용해서 같은 도시에서
-- 온 고객들을 조회하세요
--
--
--
-- 61. 제품/상세주문 테이블을 이용해서
-- 주문수량이 99 이상인 제품이름을 조회하세요
--
--
--
-- 62. 제품 테이블을 이용해서
-- 제품분류코드가 2인 제품의 가격보다
-- 높은 제품의 이름과 가격을 조회하세요
--
--
--
--
-- 64. 제품 테이블을 이용해서 제품이름,
-- 1개당가격 * 재고량, 1개당가격 * 주문량을
-- 조회하세요