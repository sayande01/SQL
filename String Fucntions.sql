--String Functions

--length() upper() lower() replace()
-- TRIM LTRIM RTRIM , removing leading '' trailng both
--CONCAT()  city => || country as address
--substring select product, SUBSTRING(Product,1,3) from orders;
--String aggregator(delimator)

/*Excercise 13:

1. Find Maximum length of characters in the Product name string from Product table
2. Retrieve product name, sub-category and category from Product table and an 
additional column named “product_details” which contains a concatenated string of 
product name, sub-category and category
3. Analyze the product_id column and take out the three parts composing the product_id
in three different columns
4. List down comma separated product name where sub-category is either Chairs or 
Tables

*/

--Sol:

select max(length(product_name)) from product;

select product_name,sub_category, 
category, (product_name||' , '||sub_category||' , '||category) as product_details from product;

select product_id, substring(product_id for 3) as category_short, 
substring(product_id from 
5 for 2) as sub_short , 
substring(product_id from 8) as id from product;

--Alternative syntax for concatination=>col,starting,num of char
select product_id, substring(product_id, 1, 3) as category_short, 
substring(product_id,5 ,2) as sub_short , 
substring(product_id,8) as id from product;


select string_agg(product_name,',') from product 
where sub_category in ('Chairs','Tables');


