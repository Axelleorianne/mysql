/* concatenate two or more strings into a single string*/
select concat('Graduate',' ', 'school',' ', ' of management');

/*it concatenate the word by defining the separator once */
select concat_ws(' ','Graduate',' ', 'school',' ', ' of management');

/* instr search the position of a string */
select instr('Graduate school of management','of');

/* search the lenght of  a character*/
select length('Graduate');

select left('Graduate school of management',6);

select right('Graduate school of management',6);

/* research */
select locate('of','Graduate school of management',16);
/* replace a old string with a new one */
select replace('Graduate school of management','school','Institute');

select substring('Graduate school of management',19);

select ltrim(substring('Graduate school of management',19));



/*string functions use with tables*/
select concat (firstName,' ',LastName)as 'Full Name',jobTitle  from employees;

select concat (firstName,' ',LastName,'is the', jobTitle )as 'details'  from employees;

select concat_ws (' ',firstName,LastName,'is the', jobTitle,email)as 'details'  from employees;

select email, locate ('@',email) from employees;

select email, substring(email,locate ('@',email) +1)from employees;

/* date functions*/
/* give your computer date */
select curdate();
select current_Date();
select current_date();

/*return the current time of the computer */
select current_time();
select curtime();
select current_time;

/* return the time a queries runs*/
select sysdate();


/* Exercise*/

select orderDate where(yyyy/mm/dd);

select orderDate,
year(orderDate) AS year,
    MONTH(orderDate) AS month,
    DAY(orderDate) AS day 
    from Orders;
    
    /* date_format function to the format you want using % */
    select orderDate ,
    date_format(orderDate,'%d/%m/%y') from Orders;
    
    /* a for the three letters of the date,e for the number ,b for the three letter of the month*/
    select  date_format(orderDate,'%a'),
date_format(orderDate,'%e'),
    date_format(orderDate,'%b')
    from Orders;
    
    select  date_format(curDate(),'%a'),
date_format(curDate(),'%e'),
    date_format(curDate(),'%b')
    from Orders;
    
     select  date_format(curDate(),'%a'),
date_format(curDate(),'%e'),
    date_format(curDate(),'%M')
    from Orders;
    
    
    select OrderDate from Orders where  year (orderDate )= 2003;
    
      select OrderDate from Orders where  month (orderDate )= 12;
      
      SELECT 
    orderDate,
    shippedDate,
    datediff(shippedDate, orderDate)
FROM orders;

SELECT *
FROM orders
where DATEDIFF(shippedDate, orderDate) >= 7;

SELECT UPPER(customerName) AS customer_name_upper
FROM customers;

select date_format(orderdate,'%d/%m/%d')
 from Orders;

select concat_ws(' ',
'Order #', OrderNumber,' ',' ','placed on',' ',
date_format(orderDate,'%d/%m/%y')) as order_label
from Orders;



select concat_ws(' ',
'Order #', OrderNumber,' ',' ','took',
datediff(shippedDate,orderDate)) as order_duration
from orders ;


select customerName from customers where length(customerName)>10;

select * from orders where   datediff(shippedDate, orderDate)>5;




    