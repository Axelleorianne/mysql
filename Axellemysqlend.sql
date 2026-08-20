create database online_store_db;
use  online_store_db;


create table customers(
customer_id int auto_increment primary key,
first_name varchar(50) ,
last_name varchar(50),
email varchar(100) unique, 
phone varchar(20),
created_at timestamp default(current_timestamp())

);


create table products(
product_id int Auto_increment primary key ,
product_name varchar(50),
price decimal (10,2) ,
stock_quantity smallint ,
created_at timestamp
);

 create table orders(
 order_id int auto_increment primary key,
 customer_id int ,
 order_date date,
 total_amount decimal (10,2),
 constraint fk_cstid foreign key (customer_id) references customers(customer_id) on delete cascade
 );
 
 
 create table order_details(
 order_details_id int auto_increment primary key,
 order_id int ,
 product_id int ,
 quantity int,
 unit_price decimal (10,2),
 constraint fk_ordid foreign key (order_id) references orders(order_id) on delete cascade,
 constraint fk_prodid foreign key (product_id) references products(product_id)
 );
 
 
 alter table orders
 add column cstatus varchar(50) constraint check(cstatus in( 'Pending','Paid','Shipped','Cancelled'));
 
 alter table customers
 rename column phone to phone_number;
 
 
 
 alter table products
 drop column created_at;
 
 alter table products
 add constraint chk_price check(price>0);
 
 alter table order_details
 add constraint check_quant check(quantity>0);
 

 drop table orders;
 drop table order_details;
 drop table customers;
 
 alter table products
 add constraint chk_stquan check(stock_quantity>0);
 
 insert into customers
 values
 (1,'Axelle','Gouin','axellegouin5@gmail.com','07080501','4:22pm');
 
 insert into customers
 values
 (2,'opely','Nguessan','nguessanopley@gmail.com','08040125',  9);
 
 insert into customers
 values
 (3,'Claude','Werka','claudewerka@gmail.com',01020507,10),
 (4,'Jc','Sopri','soprij@gmail.com',05070809,11),
 (5,'Saphira','Jackson','saphirajackson@gmail.com',02010408,12);
 
 
 select *from customers;
 
 insert into products
 values
 (101,'Nutella','20,5',10);
 
 insert into products
 values
 (102,'Oreo','15.0', 30),
 (103,'Laptop','300.0',150),
 (104,'Ice','2.50',20),
 (105,'Sugar','4.50',90);
 
 
 

insert into orders
values
(200,2,2026/5/12,50.5);

insert into orders
values
(201,5,2025/9/15,60.00),
(203,1,2026/6/22,100.00);

select * from orders;

 select*from products;
 
 
 
 
 
 
 
 
 
 
 
 
 
 create index indxproduct
 on products(product_name);
 create index indxcomp
 on orders(customer_id,order_date);
 show index from products;
 show index from orders;
 
 
 
 create view customer_orders_view as
 select concat('first_name','last_name') as customerfullname,
 order_id,
 order_date,
 total_amount
 from orders;
 
 create view viewshowing as
 select product_name,stock_quantity from products;
 
 
 
 select upper('first_name','last_name') as customerfullname from customers;
 
 
 
 
 select left('nutella',3);
 select left('oreo',3);
 select left('laptop',3)
 

 

 
 
 
 delimiter #
create procedure getcustomersOrders(customer_id int)
begin
    select *from orders
    where customer_id = customer_id;
    end#
    delimiter ;
    
    call getcustomersOrders(3);
    
    drop procedure getcustomersOrders
    
    
    
    
    

    
    
    
    
    
    
    
    
    delimiter $$
create trigger trprevent
before insert on order_details
for each row 
begin 
if quantity>stock_quantity then 

end$$