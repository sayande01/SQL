--Maths functions


--ceil() and floor() -> select amount, CEIL(Amount) from orders;

--random()
/*Return a random decimal number >= 5 and <10:
SELECT RANDOM()*(10-5)+5;

Return a random number >= 5 and <=10:
SELECT FLOOR(RANDOM()*(10-5+1)+5);*/

--SETSEED(to set the same sequence of random num generation)
--Make the random number generated after the setseed value fix
/* no seed value is provided,
  hence the result can vary */
SELECT RANDOM();
Result: 0.12974610012450416

/* seed value is provided using SETSEED(0.5) */
SELECT SETSEED(0.5);
SELECT RANDOM();
Result: 0.9851677175347999

/* seed value is provided using SETSEED(0.3) */
SELECT SETSEED(0.3), RANDOM();
Result: 0.662926946301782

--ROUND()
SELECT ROUND(235.419768,2) AS RoundValue;

--POWER()
SELECT POWER(4,2);

--Excercise 14:
/*1. You are running a lottery for your customers. So, pick a list of 5 Lucky customers from 
customer table using random function
2. Suppose you cannot charge the customer in fraction points. So, for sales value of 1.63, 
you will get either 1 or 2. In such a scenario, find out
a) Total sales revenue if you are charging the lower integer value of sales always
b) Total sales revenue if you are charging the higher integer value of sales always
c) Total sales revenue if you are rounding-off the sales always
*/

--Solution

select customer_id,random() as rand_n from 
customer order by rand_n limit 5;

select customer_id from customer limit 5; --FIX

select sum(ceil(sales)) as higher_int_sales, 
sum(floor(sales)) as lower_int_sales, 
sum(round(sales)) as round_int_sales from sales;

