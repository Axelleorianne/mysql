select  customerName,country,creditLimit from customers  
 where country='France' or country='germany' 
 and creditlimit>50000 order by customerName;

select distinct country,customerName from customers  where  customerName like 'A%';

select customerName,orderNumber,orderDate,status ,country from customers join orders on  customers.customerNumber=orders.customerNumber
where country='france' order by orderDate desc ;

select customerName, orderNumber,productName,quantityOrdered 
from customers 
join  orders on customers.customerNumber =orders.customerNumber;


select c.customerName,p.productName,od.quantityOrdered, o.orderNumber from customers c
join orders o on c.customerNumber=o.customerNumber
join orderdetails od on o.orderNumber= od.orderNumber
join products p   on od.productCode= p.productCode
where country = 'USA';



select country,customerNumber from customers where country


