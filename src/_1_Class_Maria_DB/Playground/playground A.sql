_1_Class_Maria_DB.Create table users (
                       user_id	varchar(10) primary key,
                       name 	char(6),
                       age 	int,
                       grade	varchar(10) default 'bronze',
                       job		varchar(20),
                       mileage int
);

insert into users values
('apple', 	'정소화', 20, 	'gold', 	'학생', 		1000),
('banana', 	'김선우', 25, 	'vip', 		'간호사', 	2500),
('carrot', 	'고명석', 28, 	'gold', 	'교사', 		4500),
('orange', 	'김용욱', 22, 	'silver',	 '학생',		 0),
('melon', 	'성원용', 35, 	'gold', 	'회사원', 	5000),
('peach', 	'오형준',NULL, 	'silver', 	'의사', 		300),
('pear', 	'채광주', 31, 	'silver', 	'회사원', 	500);

_1_Class_Maria_DB.Create table product (
                         pro_no	varchar(3)		primary key,
                         pro_name varchar(20),
                         stock	int,
                         price	int,
                         brand	varchar(10)
);

insert into product values
('p01', '그냥만두', 	 5000, 4500, '대한식품'),
('p02', '매운쫄면',	 2500, 5500, '민국푸드'),
('p03', '쿵떡파이', 	 3600, 2600, '한빛제과'),
('p04', '맛난초콜릿', 1250, 2500, '한빛제과'),
('p05', '얼큰라면',   2200, 1200, '대한식품'),
('p06', '통통우동',   1000, 1550, '민국푸드'),
('p07', '달콤비스킷', 1650, 1500, '한빛제과');

_1_Class_Maria_DB.Create table order_table (
                             ord_no		varchar(3)	primary key,
                             user_id		varchar(10),
                             pro_no		varchar(3),
                             amount		int,
                             address 	varchar(20),
                             order_time	date,
                             foreign key (user_id) references users (user_id),
                             foreign key (pro_no)  references product (pro_no)
);

insert into order_table values
('o01', 'apple',	'p03', 10,   '서울시 마포구', 	'2019-01-01'),
('o02', 'melon', 	'p01', 5,	 '인천시 계양구', 	'2019-01-10'),
('o03', 'banana', 	'p06', 45,	 '경기도 부천시', 	'2019-01-11'),
('o04', 'carrot', 	'p02', 8,    '부산시 금정구', 	'2019-02-01'),
('o05', 'melon', 	'p06', 36,	 '경기도 용인시', 	'2019-02-20'),
('o06', 'banana', 	'p01', 19, 	 '충청북도 보은군', 	'2019-03-02'),
('o07', 'apple', 	'p03', 22,   '서울시 영등포구', 	'2019-03-15'),
('o08', 'pear', 	'p02', 50,   '강원도 춘천시',	 	'2019-04-10'),
('o09', 'banana', 	'p04', 15,   '전라남도 목포시',	'2019-04-11'),
('o10', 'carrot', 	'p03', 20,   '경기도 안양시', 	'2019-05-22');



_1_Class_Maria_DB.Create table Books (
                       bookid		int			primary key,
                       bookname	varchar(50),
                       publisher	varchar(20),
                       price		int
);

insert into Books values
(1,  '축구의 역사', 		  '굿스포츠', 	7000),
(2,  '축구하는 여자', 	  '나무수', 		13000),
(3,  '축구의 이해', 		  '대한미디어', 	22000),
(4,  '골프 바이블', 		  '대한미디어', 	35000),
(5,  '피겨교본', 		  '굿스포츠', 	8000),
(6,  '역도 단계별 기술',	  '굿스포츠',	6000),
(7,  '야구의 추억', 	  	  '이상미디어', 	20000),
(8,  '야구를 부탁해', 	  '이상미디어', 	13000),
(9,  '올림픽 이야기', 	  '삼성당',		7500),
(10, 'Olympic Champions', 'Pearson', 	13000);

_1_Class_Maria_DB.Create table BookMembers (
                             custid	int			primary key,
                             name	char(6),
                             address	varchar(50),
                             phone	varchar(15)
);

insert into BookMembers values
(1, '박지성', '영국 맨체스타', 	'000-5000-0001'),
(2, '김연아', '대한민국 서울', 	'000-6000-0001'),
(3, '장미란', '대한민국 강원도', 	'000-7000-0001'),
(4, '추신수', '미국 클리블랜드', 	'000-8000-0001'),
(5, '박세리', '대한민국 대전',		NULL);

_1_Class_Maria_DB.Create table BookOrders (
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

insert into BookOrders values
( 1,1,1,   6000, '2014-07-01'),
( 2,1,3,  21000, '2014-07-03'),
( 3,2,5,   8000, '2014-07-03'),
( 4,3,6,   6000, '2014-07-04'),
( 5,4,7,  20000, '2014-07-05'),
( 6,1,2,  12000, '2014-07-07'),
( 7,4,8,  13000, '2014-07-07'),
( 8,3,10, 12000, '2014-07-08'),
( 9,2,10,  7000, '2014-07-09'),
(10,3,8,  13000, '2014-07-10');



