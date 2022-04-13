1. Sum all the pages in entire database
mysql> SELECT Sum(pages) FROM books;
+------------+
| Sum(pages) |
+------------+
|       6623 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT Sum(released_year) FROM books;
+--------------------+
| Sum(released_year) |
+--------------------+
|              37996 |
+--------------------+

Q2. SUM All pages that each author has written.
mysql> SELECT author_fname, author_lname , Sum(Pages) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+------------+
| author_fname | author_lname   | Sum(Pages) |
+--------------+----------------+------------+
| Raymond      | Carver         |        702 |
| Michael      | Chabon         |        634 |
| Don          | DeLillo        |        320 |
| Dave         | Eggers         |       1293 |
| David        | Foster Wallace |        672 |
| Neil         | Gaiman         |        977 |
| Dan          | Harris         |        256 |
| Freida       | Harris         |        428 |
| Jhumpa       | Lahiri         |        489 |
| George       | Saunders       |        367 |
| Patti        | Smith          |        304 |
| John         | Steinbeck      |        181 |
+--------------+----------------+------------+


AVERAGE : AVG   - gives till four decimal Points
Q1. Calculate released_year across all books
mysql> SELECT avg(released_year) FROM books;
+--------------------+
| avg(released_year) |
+--------------------+
|          1999.7895 |
+--------------------+

Q2. Calcualte the average stock quantity for books released in same year.
mysql> SELECT released_year, Avg(stock_quantity) FROM books GROUP by released_year;
+---------------+---------------------+
| released_year | Avg(stock_quantity) |
+---------------+---------------------+
|          1945 |             95.0000 |
|          1981 |             23.0000 |
|          1985 |             49.0000 |
|          1989 |             12.0000 |
|          1996 |             97.0000 |
|          2000 |             68.0000 |
|          2001 |            134.3333 |
|          2003 |             66.0000 |
|          2004 |            172.0000 |
|          2005 |             92.0000 |
|          2010 |             55.0000 |
|          2012 |            154.0000 |
|          2013 |             26.0000 |
|          2014 |             29.0000 |
|          2016 |             43.0000 |
|          2017 |           1000.0000 |
+---------------+---------------------+

Q3. average pages written by each author_fname
mysql> SELECT author_fname, author_lname , Avg(Pages) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+------------+
| author_fname | author_lname   | Avg(Pages) |
+--------------+----------------+------------+
| Raymond      | Carver         |   351.0000 |
| Michael      | Chabon         |   634.0000 |
| Don          | DeLillo        |   320.0000 |
| Dave         | Eggers         |   431.0000 |
| David        | Foster Wallace |   336.0000 |
| Neil         | Gaiman         |   325.6667 |
| Dan          | Harris         |   256.0000 |
| Freida       | Harris         |   428.0000 |
| Jhumpa       | Lahiri         |   244.5000 |
| George       | Saunders       |   367.0000 |
| Patti        | Smith          |   304.0000 |
| John         | Steinbeck      |   181.0000 |
+--------------+----------------+------------+
