SELECT * FROM customers;
SELECT count(*) FROM sales.customers;

#Mark001 -> Chennai
SELECT * FROM sales.transactions where market_code='Mark001';

SELECT distinct product_code FROM sales.transactions where market_code='Mark001';

SELECT * from sales.transactions where currency="USD";

#Show transactions in 2020 join by date table
SELECT transactions.*, date.* FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020;

SELECT SUM(transactions.sales_amount) FROM sales.transactions INNER JOIN date ON 
sales.transactions.order_date=date.date where date.year=2020 and (transactions.currency="INR\r" or transactions.currency="USD\r");

SELECT SUM(transactions.sales_amount) FROM sales.transactions INNER JOIN date ON 
sales.transactions.order_date=date.date where date.year=2020;

SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 
and date.month_name="January" and (transactions.currency="INR\r" or transactions.currency="USD\r");


SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN date ON 
transactions.order_date=date.date where date.year=2020 and transactions.market_code="Mark001";