
/*ALL the join on the jan29*/

select c.customerName, o.orderdate, o.orderNumber
from customers c join orders o 
on
c.customerNumber = o.customerNumber 
order by o.orderdate desc;

select orderNumber ,orderdate,customerName from orders 
inner join customers on customers.customerNumber = orders.customerNumber 
order by orderDate desc;




SELECT o.orderNumber,
       p.productName,
       od.quantityOrdered,
       od.priceEach 
       FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
JOIN products p
  ON od.productCode = p.productCode
ORDER BY o.orderNumber;


select orderNumber as "Order number", ProductName as "Product name",quantityOrdered as "Quantity ordered", priceEach as"Price Each" from products
inner join orderdetails on orderdetails.productCode  = products.productCode where quantityOrdered >30;


select orderNumber ,orderDate, customerName,FirstName 'SR First name',Lastname'SR Last Name', LastName
 from orders 
 join  customers 
on orders.customerNumber=customers.customerNumber
join employees 
on customers.salesRepEmployeeNumber=employees.employeeNumber where jobtitle= 'Sales Rep';



select customerName,productName,quantityOrdered from products
join orderdetails on products.productCode = orderdetails.productCode
join orders on orderdetails.orderNumber= orders.orderNumber
join customers on orders.customerNumber = customers.CustomerNumber
where country = 'USA';


select customerName,country,orderNumber from customers
 left join orders on  orders.CustomerNumber = customers.customerNumber ;
 
 
 
 select  FirstName,LastName,jobtitle,customerName  from  employees right join customers on employees.EmployeeNumber= customers.salesRepEmployeeNumber
 
 
 

 ;