--Date: March 19, 2024

select * from customer; 
select * from product;
select * from sales;

--In, Between and Wildcard character(%,_)

select distinct city from customer where region in 
('North','East');

select * from sales where sales between 100 and 500;

select * from customer where customer_name like '% ____';

--Order by,Limit

select * from Sales where discount > 0 order by discount desc;

select * from Sales where discount > 0 
order by discount desc limit 10;

--As (Alias)

Select customer_id as id, customer_name as name from customer;

--Aggregate Funcn--

select sum(sales) as TotalSales from sales;

select count(distinct customer_name) as Customer from customer
where age between
20 and 30 and region = 'South';

select avg(age) from customer where region = 'East';

select min(age) as min_age, max(age) as max_age from
customer where city = 'Philadelphia';

--Group by

select product_id, count(order_id) as order_count,
min(sales)as min_sale_amt,
max(sales)as max_sale_amt,
avg(sales)as avg_sale_amt,
sum(quantity)as total_sold_qty,
sum(sales)as total_sales
from sales
group by product_id
order by total_sales desc;

--Having
select product_id, count(order_id) as order_count,
min(sales)as min_sale_amt,
max(sales)as max_sale_amt,
avg(sales)as avg_sale_amt,
sum(quantity)as total_sold_qty,
sum(sales)as total_sales
from sales
group by product_id
having sum(quantity) <5
order by total_sales desc;

--cross check with product_id to verify totalsales wrt qty
select * from sales where product_id = 'TEC-MA-10002073';
--Verified

--Case statement

select * , case
when age<30 then 'Young'
when age>60 then 'Senior Citizen'
else 'Middle Aged'
end as age_category
from customer;


