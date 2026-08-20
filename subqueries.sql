/*subquery where*/
select customerNumber,customerName,creditLimit from customers where creditlimit>(select avg(creditLimit) from customers);
/*subquery in*/
select employeeNumber,firstName,lastName from employees where officeCode in (select officeCode from offices where country='USA');

/*subquery correlated subquery*/
select productLine, productName,buyPrice from products p
where buyPrice=(select max(buyPrice) from products
where productLine = p.productLine);

select customerName,customerNumber from customers 
where customerNumber in (select customerNumber from  orders );



select customerName,customerNumber from customers 
where customerNumber not  in (select customerNumber from  orders );


select orderNumber, orderDate from orders
where orderNumber in(select orderNumber from orderdetails where quantityOrdered>50);



/* Exercise for myself to understand it better*/





