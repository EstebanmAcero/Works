

----- aca es donde esta bien
1 y 2

-- tabla author
create table author (
    author_id 	varchar2  	(10) primary key,
    author_name varchar2	(20)
);

-- tabla publisher
create table publisher (
    publisher_id 	varchar2(10) primary key,
    publisher_name 	varchar2(50)
);

-- tabla books
create table books (
    book_id 			varchar2(10) primary key,
    book_name 			varchar2(50),
    author_id 			varchar2(10),
    price 				number(10),
    publisher_id 		varchar2(10),
    constraint fk_books_author_id foreign key (author_id) 	references author(author_id),
    constraint fk_books_publisher foreign key (publisher_id) 	references publisher(publisher_id)
);


-- tabla shipping_type
create table shipping_type (
    shipping_type 	varchar2(10) primary key,
    shipping_price 	number(6)
);

-- tabla shopping_cart
create table shopping_cart (
    shopping_cart_id	 	varchar2(10) primary key,
    book_id 				varchar2(10),
    price 					number(10),
    shopping_cart_date 		date,
    quantity 				number(6),
    constraint fk_shooping_bood_id foreign key (book_id) references books(book_id)
);

-- tabla customer
create table customer (
    customer_id 			varchar2(6) primary key,
    customer_name 			varchar2(40),
    street_address 			varchar2(50),
    city 					varchar2(25),
    phone_number 			varchar2(15),
    credit_card_number 		varchar2(20)
);

-- tabla credit_card_details
create table credit_card_details (    
    credit_card_number 		varchar2(20) primary key,
    credit_card_type 		varchar2(10),
    customer_id 			varchar2(6) ,
    expiry_date 			date		,
    constraint fk_credit_customer_id foreign key (customer_id) references customer(customer_id)
); 


alter table customer 
    ( add constraint fk_customer_credit_card_number foreign key (credit_card_number) references credit_card_details(credit_card_number)
);


-- tabla order_details
create table order_details (
    order_id 			varchar2(6) primary key,
    customer_id 		varchar2(6) ,
    shipping_type 		varchar2(10),
    date_of_purchase 	date,
    shopping_cart_id 	varchar2(10),
    constraint fk_order_customer_id 		foreign key (customer_id) 		references customer(customer_id),
    constraint fk_order_shipping_type 	foreign key (shipping_type) 	references shipping_type(shipping_type),
    constraint fk_order_shopping_cart_id 	foreign key (shopping_cart_id) 	references shopping_cart(shopping_cart_id)
);



-- tabla purchase_history
create table purchase_history (
    customer_id 	varchar2(6),
    order_id 		varchar2(6),
    constraint fk_purchase_customer_id 	foreign key (customer_id) references customer(customer_id),
    constraint fk_purchase_order_id		foreign key (order_id) references order_details(order_id)
);


------------------------------
------------------------------

--3. Crear secuencias

--a order_id_seq

create sequence order_id_seq
start with 100
nocache;

select  order_id_seq.NEXTVAL from dual
------------------------------
------------------------------
--4 realizar insercion de datos

-- datos para la tabla author
insert all
  into author (author_id, author_name) values ('an0001', 'oliver goldsmith')
  into author (author_id, author_name) values ('an0002', 'oscar wilde')
  into author (author_id, author_name) values ('an0003', 'george bernard shaw')
  into author (author_id, author_name) values ('an0004', 'leo tolstoy')
  into author (author_id, author_name) values ('an0005', 'percy shelley')
  into author (author_id, author_name) values ('an0006', 'lord byron')
  into author (author_id, author_name) values ('an0007', 'john keats')
  into author (author_id, author_name) values ('an0008', 'rudyard kipling')
  into author (author_id, author_name) values ('an0009', 'p. g. wodehouse')
select * from dual;

select * from author

-- datos para la tabla publisher
insert all
  into publisher (publisher_id, publisher_name) values ('pn0001', 'elsevier')
  into publisher (publisher_id, publisher_name) values ('pn0002', 'penguin group')
  into publisher (publisher_id, publisher_name) values ('pn0003', 'pearson education')
  into publisher (publisher_id, publisher_name) values ('pn0004', 'cambridge university press')
  into publisher (publisher_id, publisher_name) values ('pn0005', 'dorling kindersley')
select * from dual;


desc publisher;

select * from publisher

-- datos para la tabla shippingtype

insert all
  into shipping_type (shipping_type, shipping_price) values ('usps', 200)
  into shipping_type (shipping_type, shipping_price) values ('fedex', 250)
  into shipping_type (shipping_type, shipping_price) values ('dhl', 150)
select * from dual;

select * from shipping_type;

-- datos para la tabla customer
insert all
  into customer (customer_id, customer_name, street_address, city, phone_number, credit_card_number) values ('cn0001', 'velasquez carmen', '283 king street', 'seattle', '587-99-6666', '000-111-222-333')
  into customer (customer_id, customer_name, street_address, city, phone_number, credit_card_number) values ('cn0002', 'ngao la doris', '5 modrany', 'bratislava', '586-355-8882', '000-111-222-444')
  into customer (customer_id, customer_name, street_address, city, phone_number, credit_card_number) values ('cn0003', 'nagayama midori', '68 via centrale', 'sao paolo', '254-852-5764', '000-111-222-555')
  into customer (customer_id, customer_name, street_address, city, phone_number, credit_card_number) values ('cn0004', 'quick-to-see mark', '6921 king way', 'lagos', '63-559-777', '000-111-222-666')
  into customer (customer_id, customer_name, street_address, city, phone_number, credit_card_number) values ('cn0005', 'ropeburn audry', '86 chu street', 'hong kong', '41-559-87', '000-111-222-777')
  into customer (customer_id, customer_name, street_address, city, phone_number, credit_card_number) values ('cn0006', 'urguhart molly', '3035 laurier blvd.', 'quebec', '418-542-9988', '000-111-222-888')
  into customer (customer_id, customer_name, street_address, city, phone_number, credit_card_number) values ('cn0007', 'menchu roberta', 'boulevard de waterloo 41', 'brussels', '322-504-2228', '000-111-222-999')
  into customer (customer_id, customer_name, street_address, city, phone_number, credit_card_number) values ('cn0008', 'biri ben', '398 high st.', 'columbus', '614-455-9863', '000-111-222-222')
  into customer (customer_id, customer_name, street_address, city, phone_number, credit_card_number) values ('cn0009', 'catchpole antoinette', '88 alfred st.', 'brisbane', '616-399-1411', '000-111-222-111')
select * from dual;

select * from customer;


-- datos para la tabla credit_card_details
INSERT ALL 
    INTO credit_card_details (credit_card_number, credit_card_type, expiry_date) VALUES ('000-111-222-333', 'visa', TO_DATE('17-jun-2009', 'dd-mon-yyyy'))
    INTO credit_card_details (credit_card_number, credit_card_type, expiry_date) VALUES ('000-111-222-444', 'mastercard', TO_DATE('24-sep-2005', 'dd-mon-yyyy'))
    INTO credit_card_details (credit_card_number, credit_card_type, expiry_date) VALUES ('000-111-222-555', 'amex', TO_DATE('11-jul-2006', 'dd-mon-yyyy'))
    INTO credit_card_details (credit_card_number, credit_card_type, expiry_date) VALUES ('000-111-222-666', 'visa', TO_DATE('22-oct-2008', 'dd-mon-yyyy'))
    INTO credit_card_details (credit_card_number, credit_card_type, expiry_date) VALUES ('000-111-222-777', 'amex', TO_DATE('26-aug-2000', 'dd-mon-yyyy'))
    INTO credit_card_details (credit_card_number, credit_card_type, expiry_date) VALUES ('000-111-222-888', 'mastercard', TO_DATE('15-mar-2008', 'dd-mon-yyyy'))
    INTO credit_card_details (credit_card_number, credit_card_type, expiry_date) VALUES ('000-111-222-999', 'visa', TO_DATE('4-aug-2009', 'dd-mon-yyyy'))
    INTO credit_card_details (credit_card_number, credit_card_type, expiry_date) VALUES ('000-111-222-111', 'maestro', TO_DATE('27-sep-2001', 'dd-mon-yyyy'))
    INTO credit_card_details (credit_card_number, credit_card_type, expiry_date) VALUES ('000-111-222-222', 'amex', TO_DATE('9-aug-2004', 'dd-mon-yyyy'))
SELECT * FROM DUAL;

select * from credit_card_details

    
-- datos para la tabla books

    
insert all
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn0001', 'florentine tragedy', 'an0002', 150, 'pn0002')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn0002', 'a vision', 'an0002', 100, 'pn0003')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn0003', 'citizen of the world', 'an0001', 100, 'pn0001')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn0004', 'the complete poetical works of oliver goldsmith', 'an0001', 300, 'pn0001')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn0005', 'androcles and the lion', 'an0003', 90, 'pn0004')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn0006', 'an unsocial socialist', 'an0003', 80, 'pn0004')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn0007', 'a thing of beauty is a joy forever', 'an0007', 100, 'pn0002')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn0008', 'beyond the pale', 'an0008', 75, 'pn0005')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn0009', 'the clicking of cuthbert', 'an0009', 175, 'pn0005')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn00010', 'bride of frankenstein', 'an0006', 200, 'pn0001')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn00011', 'shelley''s poetry and prose', 'an0005', 150, 'pn0003')
  into books (book_id, book_name, author_id, price, publisher_id) values ('bn00012', 'war and peace', 'an0004', 150, 'pn0002')
select * from dual;


select * from books;

-- datos para la tabla shopping_cart
insert all
  into shopping_cart (shopping_cart_id, book_id, price, shopping_cart_date, quantity) values ('sc0001', 'bn0002', 200, to_date('12-jun-01', 'dd-mon-yy'), 10)
  into shopping_cart (shopping_cart_id, book_id, price, shopping_cart_date, quantity) values ('sc0002', 'bn0003', 90, to_date('31-jul-04', 'dd-mon-yy'), 8)
  into shopping_cart (shopping_cart_id, book_id, price, shopping_cart_date, quantity) values ('sc0003', 'bn0003', 175, to_date('28-jun-05', 'dd-mon-yy'), 7)
  into shopping_cart (shopping_cart_id, book_id, price, shopping_cart_date, quantity) values ('sc0004', 'bn0001', 80, to_date('14-aug-2006', 'dd-mon-yyyy'), 9)
  into shopping_cart (shopping_cart_id, book_id, price, shopping_cart_date, quantity) values ('sc0005', 'bn0001', 175, to_date('21-sep-06', 'dd-mon-yy'), 4)
  into shopping_cart (shopping_cart_id, book_id, price, shopping_cart_date, quantity) values ('sc0006', 'bn0004', 100, to_date('11-aug-2007', 'dd-mon-yyyy'), 6)
  into shopping_cart (shopping_cart_id, book_id, price, shopping_cart_date, quantity) values ('sc0007', 'bn0005', 200, to_date('28-oct-07', 'dd-mon-yy'), 5)
  into shopping_cart (shopping_cart_id, book_id, price, shopping_cart_date, quantity) values ('sc0008', 'bn0006', 100, to_date('25-nov-09', 'dd-mon-yy'), 7)
  into shopping_cart (shopping_cart_id, book_id, price, shopping_cart_date, quantity) values ('sc0009', 'bn0006', 150, to_date('18-sep-2009', 'dd-mon-yyyy'), 8)
select * from dual;

--alter table order_details drop constraint 
--alter table shopping_cart modify shopping_cart_id Varchar2(10);
--ALTER TABLE shopping_cart MODIFY shopping_cart_id VARCHAR2(10);

select * from shopping_cart 
desc shopping_cart;

-- datos para la tabla order_details
insert all
  into order_details (order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) values ('od0001', 'cn0001', 'usps', to_date('12-jun-01', 'dd-mon-yy'), 'sc0002')
  into order_details (order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) values ('od0002', 'cn0002', 'usps', to_date('28-jun-05', 'dd-mon-yy'), 'sc0005')
  into order_details (order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) values ('od0003', 'cn0003', 'fedex', to_date('31-jul-04', 'dd-mon-yy'), 'sc0007')
  into order_details (order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) values ('od0004', 'cn0004', 'fedex', to_date('14-aug-2006', 'dd-mon-yyyy'), 'sc0004')
  into order_details (order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) values ('od0005', 'cn0005', 'fedex', to_date('21-sep-06', 'dd-mon-yy'), 'sc0003')
  into order_details (order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) values ('od0006', 'cn0006', 'dhl', to_date('28-oct-07', 'dd-mon-yy'), 'sc0001')
  into order_details (order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) values ('od0007', 'cn0007', 'dhl', to_date('11-aug-2007', 'dd-mon-yyyy'), 'sc0006')
  into order_details (order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) values ('od0008', 'cn0008', 'dhl', to_date('18-sep-09', 'dd-mon-yy'), 'sc0008')
  into order_details (order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) values ('od0009', 'cn0009', 'usps', to_date('25-nov-09', 'dd-mon-yy'), 'sc0009')
select * from dual;

select * from order_details
-- datos para la tabla purchase_history
insert all
    into purchase_history (customer_id, order_id) values ('cn0001', 'od0001')
    into purchase_history (customer_id, order_id) values ('cn0003', 'od0002')
    into purchase_history (customer_id, order_id) values ('cn0004', 'od0005')
    into purchase_history (customer_id, order_id) values ('cn0009', 'od0007')
select * from dual;

select * from purchase_history




------------------------------
------------------------------

--5 Crear una vista



create view customer_details as
select c.customer_name, c.street_address, od.order_id, c.customer_id, shi.shipping_type, od.date_of_purchase, sho.shopping_cart_id
from customer c
join order_details od on c.customer_id = od.customer_id
join shopping_cart sho on od.shopping_cart_id = sho.shopping_cart_id
join shipping_type shi on od.shipping_type = shi.shipping_type
order by c.customer_id;


select * 
	from customer_details


------------------------------
------------------------------
--6 
-- add new book

desc books

select book_id, book_name, author_id, price, publisher_id
    from books

select * from author
select * from author where author_id = 'an0009'
select * from publisher
select * from publisher where publisher_id = 'pn0005'
insert into books values ('BN0013', 'Two States', 'an0009',150, 'pn0005')

select book_id, book_name, author_id, price, publisher_id
    from books

select count(*)
    from books


--- b Insert the shopping cart detail

select * from shopping_cart

insert into shopping_cart values ('sc0010', 'BN0013', 200,to_date ('12-jun-06','dd-mon-yy'), 12)

select * from shopping_cart


------------------------------
------------------------------

--7 reporte

select c.customer_name, c.customer_id,sho.shopping_cart_id, b.book_id, od.date_of_purchase
    from customer c
    join order_details od 	on c.customer_id = od.customer_id
    join shopping_cart sho 	on od.shopping_cart_id = sho.shopping_cart_id
    join books b 			on sho.book_id = b.book_id
    order by c.customer_id

