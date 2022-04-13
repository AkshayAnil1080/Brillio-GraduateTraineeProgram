
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
#### c. add a unique CONSTRAINT( cannot add same data twice in a colm)
	ADD
	ALTER TABLE <tb_name>
	ADD CONSTAINT <cons_name> UNIQUE (<col_name>)
	
	REMOVE - use INDEX keyword
	ALTER TABLE <tb_name>
	DROP INDEX <same_cons_name_used_earlier>

#### d. change a column name
	ALTER TABLE <tb_name> CHANGE `old_name` `new_name` <data_type>
	EG.
	ALTER TABLE pets CHANGE `species` `animal_type` VARCHAR(20);
#### e. change column data type
	ALTER TABLE <tab_name> MODIFY <col_name> <data_type>;

	Error: when already values are in say varchar, and changine to int
	NO error: when colm are empty and when char to varchar type resp of space

#### f. EX 1

### 3. DML

##### a. INSERT

	INSERT INTO <tab_name> (<col1> ,<col2>, <col2>)
	VALUES('val1','val2','val2');

	or - mutiple values at same time.
	INSERT INTO products(name,price)
	VALUES('camrino', 1.50), ('machi' , 3.50), ('crude' , 4.50);

##### b. Update
	-- set price - 3.5 where name is Espresso

	SET SQL_SAFE_UPDATES=0; -- by def it is on, need to turn off before updating 
	UPDATE products
	SET price=3.5  -- here can use >=1 parameters separated with ,
	WHERE name='Espresso';


##### c. Update
	-- Delte john
	DELETE from people
	WHERE name='John';
	
	--  del mulitple rows say where gender is female
	DELETE FROM people
	WHERE gender='F';
	
	
	-- delete all rows
	TRUNCATE people;
	-- or DELTE FROM People; 

### 4. SELECTING From a Table

#### 4a. SELECT - retreive data, can select one or multiple or * colm 
		SELECT * from <table_name>;
		SELECT <col_name> , <col_name> from <tab_name>;

#### 4b. WHERE - select certain rows with some part value
		SELECT * FROM products
		WHERE coffee_origin='Columbia';

		Need to select >=1 values for WHERE
		SELECT * FROM products
		WHERE price=3.00
		AND coffee_origin='Columbia';

		OR - will return if either of the cond is true

#### 4c. USING inequality symbols >=,<=,<,>,
		SELECT * FROM products
		WHERE price >= 3.00;

#### 4d. NULL VALUES
	eg, table_name-customers, retreive those whose has not given phone_num
	SELECT * FROM customers
	WHERE phone_numbers IS NULL;

	vice versa 
	SELECT * FROM customers
	WHERE phone_numbers IS NOT NULL;

#### Ex1
	- From customer_table, select first_name and phone_num of all Females having last_name of Bluth
		SELECT first_name, phone_number FROM customers
		WHERE gender=’F’ AND last_name=Bluth;

	- From products table, select name for all prod that have price>3.00 or coffee origin Srilanka
		SELECT name FROM products 
		WHERE price>3.00 OR coffee_origin=’Srilanka’;

	- how many male customers dont have a phone number into customers table
		SELECT name FROM products  
		WHERE price>3.00 OR coffee_origin=’Srilanka’;

#### 4e. IN and NOT IN
	- what if i want to select rows for a column with mutiple particular values.
	- EG selecting all customers where lastname is Taylor or Bluth or Armstrong
	- Idea: pass a list of names with IN clause

		SELECT * FROM customers
		WHERE last_name IN('Taylor', 'Bluth', 'Armstrong');

	- Similarly, to exclude the list of values- use NOT IN

#### 4f. BETWEEN - SELECT rows with values in a range
	SELECT * FROM orders
	WHERE order_time BETWEEN '2017-01-01' AND '2017-01-07' ;

	IF dealing with int, no need of ' ' from range

#### 4f. LIKE
	SELECT * FROM cutomers WHERE firs_name LIKE '%da%';     - name contains 'da'
	'da%'		- name starts with 'da'
	'%da'		- name ends with 'da'
	'_o_'		- have just one ch on either side of o, EG- Gob
	SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
	'%\%%';     - to detect '%'
	'%\_%';     = to detect '_'

#### 4g. ORDERBY ASC/DESC - by def it is ASC

	SELECT * FROM products
	ORDER BY price ASC;  - sim use DESC for descending

#### EX2.


#### 4h. DISTINCT and  COUNT



#### 4i. LIMIT
	allows to specify a number - EG : How many books do u want to select
	PRINT 5 RECENTLY REALEASED BOOKS.
	SELECT title,released_year FROM books ORDER BY 2 DESC LIMIT 5;

	print first 5-15 customers
	SELECT * FROM cutomers
	LIMIT 10 OFFSET 5

	arrange customers in asc order via last_anme and print first 10
	SELECT * FROM customers 
	ORDER BY last_name
	LIMIT 10;
	

#### 4j. set colm aliases - AS
	it des not actually make changes in database, just in reslut set
	SELECT author_fname AS first, author_lname AS last, CONCAT (author_fname, author_lname) AS fullname FROM books;

#### Ex3.

### AGGREGATE commands
	COUNT
		SELECT COUNT(*) FROM books;
		SELECT COUNT(DISTINCT author_fname) FROM books;
		SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
		SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
	GROUP BY
		SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;
		SELECT author_fname, author_lname, COUNT(*) FROM books GRoUP BY author_lname;
		SELECT CONCAT('In ' , released_year , ' ', COUNT(*), ' books(s) released') AS year FROM books GROUP BY released_year;
	MIN and MAX
		SELECT Min(released_year) FROM books;
		SELECT Min(pages) FROM books;
		SELECT title,pages FROM books WHERE pages =(SELECT MIN(pages) FROM books);
		SELECT title, pages FROM books ORDER BY pages ASC Limit 1;
	MIN MAX with GROUP BY
		Find the year each author published their first book.
		 mysql> SELECT author_fname, author_lname, Min(released_year) FROM books GROUP  BY author_lname, author_fname;
		Find the year each author published their latest book. - have to use max(released_year)
		 mysql> SELECT author_fname, author_lname, Max(released_year) FROM books GROUP  BY author_lname, author_fname;
		Find the longest page count for each author and give the column name as "Longestbooks" and author full name as " Authors"
	 	 mysql> SELECT CONCAT(author_fname,' ', author_lname) AS Authors ,Max(pages) AS  LongestBooks FROM books GROUP BY author_lname, author_fname;
	SUM :
		Sum all the pages in entire database
			mysql> SELECT Sum(pages) FROM books;
		SUM All pages that each author has written.
			mysql> SELECT author_fname, author_lname , Sum(Pages) FROM books GROUP BY author_lname, author_fname;
	AVG :
		Calculate released_year across all books
			mysql> SELECT avg(released_year) FROM books;
		Calcualte the average stock quantity for books released in same year.
			mysql> SELECT released_year, Avg(stock_quantity) FROM books GROUP by released_year;
		Average pages written by each author_fname
			mysql> SELECT author_fname, author_lname , Avg(Pages) FROM books GROUP BY author_lname, author_fname;
	HAVING: Works same as WHERE, its just when join are used , Use having insted of Where
		eg. Select the film name and count the number of screenings for each fils that is over
			SELECT f.name, f.length_min, COUNT(s.id) FROM films f
			JOIN screenings s ON f.id=s.film_id
			GROUP BY f.name, f.length_min
			HAVING f.length_min>120;
#### DATE - DATE, NONTH, YEAR


	SELECT * FROM screenings
	WHERE DATE(start_time) ='2017-10-03';

	SELECT * FROM screenings
	WHERE MONTH(start_time)='10';

	SELECT * FROM screenings
	WHERE YEAR(start_time) ='2017' - returns all data of 2017 year