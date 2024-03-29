--Subquery

--coding excercise
--select customername from customers where customerid in (select customerid from orders where product = 'Widget A');

select a.product_id,a.product_name,a.category,b.quantity
from product as a
left join (select product_id,sum(quantity) as quantity from
		  sales group by product_id) as b
		  on a.product_id = b.product_id
		  order by b.quantity desc;
		  
--Coding exc : select customername,(SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) as Ordercount
--from customers
--excercise11

select c.customer_name, c.age, sp.* from
customer as c
right join (select s.*, p.product_name, p.category
from sales as s
left join product as p
on s.product_id = p.product_id) as sp
on c.customer_id = sp.customer_id;
--sp= sales+prod table joined



