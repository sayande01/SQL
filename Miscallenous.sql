--Miscallenous

/*A tablespace allows superusers to define an alternative 
location on the file system where the data files containing
database objects (such as tables and indexes) can reside.
*/

--Tablespaces

CREATE TABLESPACE dbspace LOCATION 'D:/PostgreSQL/data';

CREATE DATABASE logistics 
TABLESPACE dbspace;

--Primary key and foreign key
--A primary key constraint depicts a key comprising one or more columns 
--that will help uniquely identify every tuple/record in a table.

--Foreign Key is a column/field that refers to the primary key/unique key of another table. So it demonstrates the relationship
--between tables and acts as a cross reference among them.

--ACID Compliance in PGSQL

/*Yes, PostgreSQL is indeed ACID-compliant. It provides robust mechanisms 
to ensure atomicity, consistency, isolation, and durability 
for all database transactions. This means that with PostgreSQL,
you can rely on your database transactions being executed reliably 
and consistently, which is crucial for maintaining data integrity and 
application stability.
*/

--TRUNCATE

TRUNCATE TABLE <table_name>;

