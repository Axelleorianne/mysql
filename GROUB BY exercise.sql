/*Group by */
select jobTitle, count(employeeNumber)  from employees group by jobTitle ;

select productCode, count(orderNumber) from orderdetails group by productCode;

select orderDate, count(orderNumber) from orders group by orderDate ;
 
 select orderDate, count(orderNumber) from orders group by orderDate having count(orderNumber) >2;
 
 select officeCode, JobTitle, count(employeeNumber) from employees group by officeCode,jobTitle;

