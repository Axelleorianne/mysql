select c.customerName, o.orderdate
from customers c join orders o 
on
c.customerNumber = o.customerNumber 
order by c.customerName;


SELECT o.orderNumber,
       p.productName,
       od.quantityOrdered
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
JOIN products p
  ON od.productCode = p.productCode
ORDER BY o.orderNumber;

SELECT 
    e.employeeNumber   AS employeeID,
    CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
    CONCAT(m.firstName, ' ', m.lastName) AS managerName
FROM employees e
LEFT JOIN employees m
ON e.reportsTo = m.employeeNumber
ORDER BY employeeName;


SELECT c.customerNumber, c.customerName
FROM customers c
LEFT JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;







 
 select orderDate from orders;
 select customerName from customers;
 
 
 
 
 
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
 