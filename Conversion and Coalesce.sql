--SQL Coalesce function
--(always returns first non-null value from
--the defined argument list.)

SELECT COALESCE (NULL,NULL,20,NULL,NULL);
SELECT COALESCE (NULL,NULL,NULL,NULL,NULL,'Prashanth');
SELECT COALESCE (NULL,NULL,NULL,NULL,'Shami','Prashanth');

--==============================================================
--Conversion(DATE/NUMBER -> STRING)
--link: https://www.geeksforgeeks.org/sql-conversion-function/

select sales, 'Total sales value for the order' || to_char

create table employees(
employee_id INT PRIMARY KEY ,
first_name VARCHAR(50) ,
salary INT);
INSERT INTO employees(employee_id,first_name,salary)
VALUES
(100,'Steven',24000),
(101,'Neena',17000),
(102,'Lex',17000),
(103,'John',11000),
(104,'Robert',12000),
(105,'Leo',10000);

SELECT TO_CHAR(salary, '$99,999.99') SALARY
FROM employees
WHERE first_name = 'John';

-- o/p : "$ 11,000.00" as text

select order_date, to_char(order_Date, 'MONTH DAY YY') from sales;
--o/p : NOVEMBER TUESDAY 16

--STRING TO DATE FORMAT
select to_date('2019/01/15','YYYY/MM/DD');

--STRING TO NUMBER TYPE
select TO_NUMBER('1210.73','9999.99');

--alt of to_char->select firstname, lastname, '$' || ROUND(Salary, 2) from employees;
--alt of to_number ->  select customername,CAST(Birthdate AS DATE) from customers;















