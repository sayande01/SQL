--View and Indexes

/*Indexes are used to retrieve data from the database more quickly than otherwise.
The users cannot see the indexes, they are just used to speed up searches/queries.*/

--Create a View which contains order_line, Product_id, sales and discount 
--value of the first order date in the sales table and name it as 
--“Daily_Billing

create view Daily_Billing3
as select order_line, product_id, sales, discount,order_date 
from sales where order_date in (select min(order_date) from sales);

select * from daily_billing2;

--drop view daily_billing3;

--Indexes
create index idx_sales on Sales(Sales);
drop index idx_sales;


