select jobtitle from employees;
select distinct jobtitle from employees;
select  distinct city from customers order by city;
select  distinct state from customers;
select distinct city,state from customers order by city, state;
select city, state from customers order by state;
select city, state from customers where city ='san diego' and  state ='CA';
select city, state from customers where city ='san diego' or  state ='CA';

select city, state from customers where city ='san diego' or  state ='CA' limit 4;

select city, state from customers where city ='san diego' or  state ='CA' limit 4 OFFSET 2;


select cUSTOMERNUMBER, CREDITLIMIT from customers
order by  creditLimit desc limit 5;

select count( * ) from customers ;

select cUSTOMERNUMBER, CREDITLIMIT from customers limit 10,10;


select * from customers where state is null;
select * from customers where state is not  null;


select count( * )   'Total customers' from customers ;
select count( * )   as 'Total customers' from customers ;



select avg(creditlimit) 'Average limit' from customers;

select state, coalesce(state , 'NO') from customers




