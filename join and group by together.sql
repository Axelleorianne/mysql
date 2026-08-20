/* write a query that displays customer number,
name and sales(quantityordered,priceEach)*/

select c.customerNumber,customerName,
 sum(quantityOrdered*priceEach) as sales
 from customers c
 join 
 orders 
 on  
c.customerNumber= orders.customerNumber
join orderDetails on
orders.orderNumber = orderDetails.orderNumber
group by c.customerNumber, customerName;








select c.customerNumber,customerName,
 count(o.orderNumber) as sales
 from customers c
 join 
 orders o
 on  
c.customerNumber= o.customerNumber
join orderDetails on
o.orderNumber = orderDetails.orderNumber
group by c.customerNumber, customerName;



select c.customerNumber,customerName,
 count(o.orderNumber) as sales
 from customers c
 join 
 orders o
 on  
c.customerNumber= o.customerNumber
join orderDetails on
o.orderNumber = orderDetails.orderNumber
group by c.customerNumber, customerName 
;


/* write a query that displays customer number,
name and sales(quantityordered,priceEach) 
where sales is greater than 10000*/

select c.customerNumber,customerName,
 sum(quantityOrdered*priceEach) as sales
 from customers c
 join 
 orders 
 on  
c.customerNumber= orders.customerNumber
join orderDetails on
orders.orderNumber = orderDetails.orderNumber
group by c.customerNumber, customerName
having sales > 100000;