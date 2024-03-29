--Join---

--Join--
--Sales Table--
Create table sales_2015 as select * from sales where
ship_date between '2015-01-01' and '2015-12-31';

select count(*) from sales_2015; --2131
select count(distinct customer_id) from sales_2015;--578

--Customer table--
create table customer_20_60 as select * from customer
where age between 20 and 60;
select count(*) from customer_20_60;--597

-------------------------------
/*Find the total sales done in every state 
for customer_20_60 and sales_2015 table*/

select b.state, sum(sales) as total_sales
from sales_2015 as a inner join customer_20_60 as b 
on a.customer_id = b.customer_id
group by b.state;

--------------------------------
/*Get data containing Product_id, product name,
category, total sales 
value of that product and total quantity sold.*/


select a.*, sum(b.sales) as total_sales, sum(quantity)
as total_quantity from product as a 
left join sales as b 
on a.product_id = b.product_id
group by a.product_id;

---------------------------------
--Segment wise sales and quantity sold

select a.segment, sum(sales) as total_sales, sum(quantity) as total_qty from customer_20_60 as a
inner join sales_2015 as b on a.customer_id = b.customer_id
group by a.segment;




