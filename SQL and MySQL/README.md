
# Project Title

A brief description of what this project does and who it's for

3. DDL
primary and foreign keys //
Create, modify, delete tables // 
create DB

4. DML
INsert// Update// delete

5.
retrieve data // 
filter DATA - WHERE //
Ordering

6.
ret data from more than one table - JOINS

7.
DB design//
NORMALIZATION//
RElationships//
CONSTRAINTS

8.
cinema booking online system

9.
Aggregate fun//
group data//
having clause

10.
subqueries//
non correlted/ correlated SQ


# Queries till yet:
### 1. Creating and Deleting Databases
	SHOW DATABASES;

	CREATE DATABASE test;

	USE test;

	SHOW TABLES;

	DROP DATABASE test;

### 2. FOREIGN KEY
- use to link two tables together
- a fk is a column from a table(child)-> whose val matches the value of PK colm of another table(parent)
- a table can have >=1 FK.
	SHOW DATABASES;

	CREATE DATABASE coffee_store;
	USE coffee_store;
	CREATE TABLE products(

		id INT AUTO_INCREMENT PRIMARY KEY,
    		name VARCHAR(30),
    		price DECIMAL(3,2) -- since max value for coffee can be 9.99 -> total digits 3 and digits after decimal is 2; 
 	);
 
 	CREATE TABLE Customers(
		id INT AUTO_INCREMENT PRIMARY KEY,
    		first_name VARCHAR(30),
    		last_name VARCHAR(30),
    		gender ENUM('M' , 'F'),
    		phone_number VARCHAR(11)
 	);
 
 	CREATE TABLE orders(
  		id INT AUTO_INCREMENT PRIMARY KEY,
  		product_id INT,
  		customer_id INT, 
  		order_time DATETIME,
  		FOREIGN KEY (product_id) REFERENCES products(id),
   		FOREIGN KEY (customer_id) REFERENCES customers(id)

 	);
 

	SHOW TABLES;

#### 2a. adding and removing columns
	SELECT * FROM products;

	ALTER TABLE products
	ADD COLUMN coffee_origin VARCHAR(30);

	ALTER TABLE products
	DROP COLUMN coffee_origin;

#### 2b. DELETING TABLES
	DROP TABLE  table_name; 

#### 2c. DELTE ALL rows from table 
	 TRUNCATE TABLE table_name

### 3. More on alter table
#### a. how to add and remove PK

    ALTER TABLE table_name
    ADD PRIMARY KEY(column_name);
    
    ALTER TABLE table_name
    DROP PRIMARY KEY;

    verify via : DESCRIBE table_name
    after adding pK, numm value changes to NO -> then del it will still be NO.
#### b. add and remove FK
    Syntax
    i want address_id in people to reference the id colm in address table
    i want cl1 in t1 to refernce the cl2 in t2
    S1. cl2 must be PK.

    S2.
    ALTER TABLE <t1>
    ADD CONSTRAINT <constraint_name>  - give any name
    FOREIGN KEY (<cl1>) REFERENCES <t2>(<c2>);

#### c. add a unique CONSTRAINT

#### d. change a column name
#### e. change column data type