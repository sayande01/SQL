--Date and time function
/*Current date/time, Age, Extract(to extract individual
components from date like days month hour seconds etc)*/

select CURRENT_TIMESTAMP;
/*
1. Find out the current age of “Batman” who was 
born on “April 6, 1939” in Years, months and days

2. Analyze and find out the monthly sales of 
sub-category chair. Do you observe any 
seasonality in sales of this sub-category
*/

SELECT AGE(current_date,'1939-04-06');

--With Subquery
select extract(month from order_date) 
as month_num, sum(sales) as total_sales from sales 
where product_id in (select product_id from product
where sub_category = 'Chairs')
group by month_num
order by month_num  ;


--with Join
select extract(month from a.order_date) 
as month_num, sum(a.sales) as total_sales from sales as a
inner join product as b on a.product_id = b.product_id where
b.sub_category = 'Chairs'
group by month_num
order by month_num  ;


