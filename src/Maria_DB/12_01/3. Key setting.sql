-- 고객 테이블
create table customers (
                           custID	varchar(10) primary key,
                           name	varchar(10),
                           age		int,
                           grade	varchar(10),
                           job		varchar(10),
                           points	int
);
-- 제품 테이블
create table products (
                          prdno	 char(4) primary key,
                          prdname  varchar(10),
                          stock	 int,
                          price	 int,
                          maker	 varchar(10)
);
-- 주문 테이블
create table orders (
                        ordno	char(4) primary key,
                        custID	varchar(10), -- 고객 테이블 pk ( primary key )
                        prdno	char(4),	 -- 제품 테이블 pk
                        qty		int,
                        addr	varchar(20),
                        orddate	datetime
);
-- 외래키 설정
-- foreign key (컬럼명)
-- referneces 테이블명 (컬럼명)

-- 주문 + 고객 테이블 간 관계 설정
-- 주문 + 상품 테이블 간 관계 설정

-- 주문 테이블
create table orders2_1 ( -- 주문 / 고객 외래키 설정
                           ordno	char(4) primary key,
                           custID	varchar(10), -- 고객 테이블 pk ( primary key )
                           prdno	char(4),	 -- 제품 테이블 pk
                           qty		int,
                           addr	varchar(20),
                           orddate	datetime,
                           foreign key (custID)
                               references customers (custID)
);

create table orders2_2 ( -- 주문 / 제품 외래키 설정
                           ordno	char(4) primary key,
                           custID	varchar(10), -- 고객 테이블 pk ( primary key )
                           prdno	char(4),	 -- 제품 테이블 pk
                           qty		int,
                           addr	varchar(20),
                           orddate	datetime,
                           foreign key (prdno)
                               references products (prdno)
);

create table orders3 ( -- 주문 / 고객, 제품 외래키 설정
                         ordno	char(4) primary key,
                         custID	varchar(10), -- 고객 테이블 pk ( primary key )
                         prdno	char(4),	 -- 제품 테이블 pk
                         qty		int,
                         addr	varchar(20),
                         orddate	datetime,
                         foreign key (custID) references customers (custID),
                         foreign key (prdno) references products (prdno)
);