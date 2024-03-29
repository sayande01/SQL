--Pattern(String) matching

/*
1. Find out all customers who have first name and last name of 5 characters each and last 
name starts with “a/b/c/d” 
2. Create a table “zipcode” and insert the below data in it
PIN/ZIP codes
234432
23345
sdfe4
123&3
67424
7895432
12312
Find out the valid zipcodes from this table (5 or 6 Numeric characters)

*/

--Sol:

select * from customer 
where customer_name ~* 
'^[a-z]{5}\s(a|b|c|d)[a-z]{4}$';

create table zipcode (zip varchar);
insert into zipcode values ('234432');
insert into zipcode values ('23345');
insert into zipcode values ('sdfe4');
insert into zipcode values ('123&3');
insert into zipcode values ('67424');
insert into zipcode values ('7895432');
insert into zipcode values ('12312');

select * from zipcode where zip ~* '^[0-9]{5,6}$'