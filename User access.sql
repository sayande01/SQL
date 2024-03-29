--USER ACCESS MANAGEMENT


/*creating a superuser valid till 3rd Apri 2025 
  11:50:38 IST. Enter the following command*/
  
CREATE USER mytest WITH
	LOGIN
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	NOREPLICATION
	CONNECTION LIMIT -1
	VALID UNTIL '2025-04-03T11:50:38+05:30' 
	PASSWORD '123456';
	
--grant a user privileges to access a database

GRANT ALL PRIVILEGES ON DATABASE Employee TO mytest;

--Altering Existing User Permissions
--Updating Permissions

ALTER USER mytest WITH NOSUPERUSER;
ALTER USER mytest WITH SUPERUSER;

--Deleting User
DROP USER mytest;