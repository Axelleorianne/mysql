create database db_school;
use db_school;

create table students(
studentId int not null,
studentFullname varchar(100),
age int
);

rename table students to learners;

alter table learners
add gender char,
add phone int 
;
alter table learners
add studentMiddlename varchar(10)
after studentFullname;

  
  create table courses(
  courseCode varchar (7) not null,
  courseName varchar (100),
  courseDescription  varchar (100),
  duration int,
  primary key (courseCode)
);
   
   show tables;
   
   describe courses;
   
   alter table learners 
   add primary key (studentId);
   
   alter table learners
   modify column phone char (10);
   
describe learners;

alter table learners
add courseCode varchar (7);

describe learners;

alter table learners
add foreign key  (courseCode)
references courses (courseCode);

alter table learners
add courseCode varchar (7);

show

describe learners;
describe courses;

show create table learners;

learners, CREATE TABLE `learners` (
  `studentId` int NOT NULL,
  `studentFullname` varchar(100) DEFAULT NULL,
  `studentMiddlename` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `courseCode` char(7) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `fk_cour` (`courseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


learners, CREATE TABLE `learners` (
  `studentId` int NOT NULL,
  `studentFullname` varchar(100) DEFAULT NULL,
  `studentMiddlename` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `courseCode` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `courseCode` (`courseCode`),
  CONSTRAINT `learners_ibfk_1` FOREIGN KEY (`courseCode`) REFERENCES `courses` (`courseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


alter table learners
drop column  courseCode ;



delete from learners where studentId =100;

alter table learners
drop column courseCode;

alter table learners
add courseCode char (7), 
add constraint fk_co 
foreign key (courseCode) 
references courses (courseCode);

describe learners;

alter table learners
add constraint fk_co 
foreign key (courseCode) 
references courses (courseCode);



describe learners;

insert into courses
(courseCode,duration,courseDescription,courseName)
values
('csc01',40,'learning programming using c# as oop','C#');

insert into courses
values
('csc02',40,'learning programming using c# as oop','C#');

select * from courses;

delete from courses where courseCode = 'csc02';

insert into learners
values
(100,'Axelle orianne Gouin','Orianne',51, 'f','0100841223','csc03');

11:08:12	insert into learners values (100,'Axelle orianne Gouin','Orianne',51, 'f','0100841223','csc03')	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`db_school`.`learners`, CONSTRAINT `learners_ibfk_1` FOREIGN KEY (`courseCode`) REFERENCES `courses` (`courseCode`))	0.016 sec


insert into learners
values
(103,'Sophie baker','tiara',51, 'f','0100841223','csc04');

insert into learners
values
(107,'Sophie baker','tiara',51, 'f','0100841223','csc03');


select * from learners;

show variables;

set foreign_key_checks =0;

describe learners;

alter table learners
drop column courseCode;

alter table learners
add  courseCode char (7);

alter table learners
add constraint fk_cour
foreign key  (courseCode)
references courses (courseCode);

describe learners;

show table status where name= 'courses';

alter table courses
engine=InnoDB;

set foreign_key_checks=0;



use db_school;

alter table courses 
add constraint unq_co
unique (courseName);

describe courses;

show create table courses;

show index from  courses;


alter table courses
modify duration int ; 

describe courses;

alter table courses 
add constraint chk_dur
check (duration>3);

create table payment(
paymentId int auto_increment primary key ,
paymentDate date not null,
Amount  int  not null check(amount>100000) ,
studentId int not null ,
constraint fk_studentid foreign key (studentId)
 references learners(studentId)
 );
 
 show create table payment;
 describe payment;
 







alter table learners 
add column nationality varchar (100) default 'Ivory Coast ';

alter table learners
alter column nationality drop default;


alter table learners
alter column nationality set default 'Nigeria';

create database ecommerce;
use ecommerce;

create table customers (
customerId varchar (7) primary key,
email varchar (100)  not null unique ,
phone char (10) unique ,
firstName varchar (100) not null  ,
lastName varchar (150) not null ,
cstatus varchar (20) check(cstatus in( 'Active','Inactive','Blocked')),
created_at timestamp default(current_timestamp())

);

drop table customers;



create table products(
productID int not null primary key,
ProductName varchar (100) not null,
sku varchar (100) not null unique,
price int check( price>0),
stockQuantity  int  check(stockQuantity>0),
cstatus varchar (20) default 'Available',
createdAt timestamp default(current_timestamp())
);

drop table products;


create table orders(
orderId int primary key,
customerId varchar(7) ,
orderDate  timestamp default (current_timestamp),
cstatus varchar (25) check(cstatus in( 'Pending','Paid','Shipped','Cancelled')),
totalAmount int check(totalAmount>0),
constraint fk_customerId foreign key (customerId)
 references learners(customerId) on delete set null 
 );

create table orderitems(
orderid int ,
productId int,
quantity int check(quantity>0),
unitPrice int check (unitprice>0),
discount decimal  default 0,
constraint check_disc check(discount between 0 and 50),
constraint fk_orderId foreign key (orderid)
 references orders(customerId) on delete cascade,
 constraint fk_productId foreign key (productId)
 references products (productId) on delete restrict,
 primary key (orderId, productId)
 );








