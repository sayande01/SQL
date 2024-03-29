--Window Functions
/*
CUME_DIST()
DENSE_RANK()
FIRST_VALUE()
LAG()
LAST_VALUE()
LEAD()
NTH_VALUE()
NTILE()
PERCENT_RANK()
RANK()
ROW_NUMBER()
*/

/*
select Firstname , LastName, row_number() over 
(order by HireDate) as RowNumber from Employees;


select Firstname,Lastname, salary, rank() 
over( order by Salary desc) as Rank,
DENSE_RANK() over( order by Salary desc) as DenseRank
from Employees limit 3;

select firstname,lastname,salary,
ntile(4) over(order by Salary) as Quartile 
from Employees;

*/

--Table for Practice window funcn:
CREATE TABLE Orders
(
	order_id INT,
	order_date DATE,
	customer_name VARCHAR(250),
	city VARCHAR(100),	
	order_amount int
);
 
INSERT INTO orders values
 ('1001','04/01/2017','David Smith','GuildFord',10000),
	  
 ('1002','04/02/2017','David Jones','Arlington',20000),
	  
 ('1003','04/03/2017','John Smith','Shalford',5000),
	  
 ('1004','04/04/2017','Michael Smith','GuildFord',15000),
	  
 ('1005','04/05/2017','David Williams','Shalford',7000),
  
 ('1006','04/06/2017','Paum Smith','GuildFord',25000),
	 
 ('1007','04/10/2017','Andrew Smith','Arlington',15000),
	  
 ('1008','04/11/2017','David Brown','Arlington',2000),
	  
 ('1009','04/20/2017','Robert Smith','Shalford',1000),
 ('1010','04/25/2017','Peter Smith','GuildFord',500);

--==================================================================
--Aggregart Window funcntion

--SUM()

SELECT order_id, order_date, customer_name, city, 
order_amount,SUM(order_amount) OVER(PARTITION BY city) as grand_total 
FROM orders;

--AVG()
SELECT order_id, order_date, customer_name, city, 
order_amount,AVG(order_amount) OVER(PARTITION BY city) as average_order_amount 
FROM orders;

--MIN()
SELECT order_id, order_date, customer_name, city, order_amount
 ,MIN(order_amount) OVER(PARTITION BY city) as minimum_order_amount 
FROM orders;

--MAX()
SELECT order_id, order_date, customer_name, city, order_amount
 ,MAX(order_amount) OVER(PARTITION BY city) as maximum_order_amount 
FROM orders;

--COUNT()
SELECT order_id, order_date, customer_name, city, order_amount
 ,COUNT(order_id) OVER(PARTITION BY city) as total_orders
FROM orders;

--=================================================================
--Ranking Window Functions

--RANK()

SELECT order_id,order_date,customer_name,city,order_amount, 
RANK() OVER(order by order_amount)
FROM Orders;

--DENSE_RANK()
SELECT order_id,order_date,customer_name,city,order_amount, 
DENSE_RANK() OVER(order by order_amount)
FROM Orders;

--ROW_NUMBER()

SELECT order_id,order_date,customer_name,city, order_amount,
ROW_NUMBER() OVER(partition by city order by order_amount desc) 
FROM orders;

--NTILE()

SELECT order_id,order_date,customer_name,city, order_amount,
NTILE(4) OVER(ORDER BY order_amount)  --4 divisions=>Quartile
FROM orders;

--==================================================================
--Value Window Functions

--Script to find previous order date using LAG() function:

SELECT order_id,customer_name,city, order_amount,order_date,
 --in below line, 1 indicates check for previous row of the current row
 LAG(order_date,1) OVER(ORDER BY order_date) prev_order_date
FROM orders;

--Script to find next order date using LEAD() function:

SELECT order_id,customer_name,city, order_amount,order_date,
 --in below line, 1 indicates check for next row of the current row
 LEAD(order_date,1) OVER(ORDER BY order_date) next_order_date
FROM orders;

--FIRST_VALUE() and LAST_VALUE()

/*find the first and last order of each city from
our existing dataset. Note ORDER BY clause is mandatory 
for FIRST_VALUE() and LAST_VALUE() functions
*/


SELECT order_id,order_date,customer_name,city, order_amount,
FIRST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) as first_order_date,
LAST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) as last_order_date
FROM orders;