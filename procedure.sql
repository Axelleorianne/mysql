delimiter #
create procedure getcustomersbycountry(country varchar (100))
begin
    select *from customers
    where country = country;
    end#
    delimiter ;
    
call getcustomersbycountry('France')

delimiter #
create procedure prctotalamount(amount decimal(10,2))
begin
select * from orderdetails where (quantityOrdered*pricesEeach)>amount;
end #
 call prctotalamount(5000.00);
 
 
delimiter #
create procedure prcnumberofcst(in country varchar(100) ,out total_customer int)
begin
select count(customerNumber) into total_customer  from customers where country = country;
end #
 call prcnumberofcst('USA',@total_amount);
 select @total_amount;
 
 
 
 elimiter #
create procedure prctotalamount(amount decimal(10,2))
begin
select * from orderdetails where (quantityOrdered*pricesEeach)>amount;
end #
 call prctotalamount(5000.00);
 
 delimeter#
 CREATE PROCEDURE GetTotalAmountPaid()
BEGIN
    SELECT 
        c.CustomerNumber,
        c.CustomerName,
        IFNULL(SUM(od.QuantityOrdered * priceEach), 0) AS TotalPaid
    FROM Customers c
    LEFT JOIN Orders o 
        ON c.CustomerNumber = o.CustomerNumber 
    LEFT JOIN OrderDetails od 
        ON o.OrderNumber = od.OrderNUmber
    GROUP BY c.CustomerNUmber, c.CustomerName
    ORDER BY TotalPaid DESC;
END#

DELIMITER ;
 