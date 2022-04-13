DEMO : MIM MAX w/0 GROUP BY;

find the minimum released _year
mysql> SELECT Min(released_year) FROM books;
+--------------------+
| Min(released_year) |
+--------------------+
|               1945 |
+--------------------+
1 row in set (0.09 sec)

mysql> SELECT Min(pages) FROM books;
+------------+
| Min(pages) |
+------------+
|        176 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT Max(pages) FROM books;
+------------+
| Max(pages) |
+------------+
|        634 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT Max(released_year) FROM books;
+--------------------+
| Max(released_year) |
+--------------------+
|               2017 |
+--------------------+

-------------------------------------------------------------------


A PROBLEM WIHT MIN AND MAX ---
print the tile of book having max -pages
mysql> SELECT Max(pages), title  FROM books;
+------------+--------------+
| Max(pages) | title        |
+------------+--------------+
|        634 | The Namesake |
+------------+--------------+
its wrong as namesake has only 291 pages in it... HOw to solve this ?


mysql> SELECT * FROM books WHERE pages =634;
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |             68 |   634 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.04 sec)

mysql> SELECT title,pages FROM books WHERE pages =(SELECT MAX(pages) FROM books);
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+

mysql> SELECT title,pages FROM books WHERE pages =(SELECT MIN(pages) FROM books);
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| What We Talk About When We Talk About Love: Stories |   176 |
+-----------------------------------------------------+-------+

OR, WE CAN USE order by command fot it...
mysql> SELECT title, pages FROM books ORDER BY pages ASC Limit 1;
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| What We Talk About When We Talk About Love: Stories |   176 |
+-----------------------------------------------------+-------+
1 row in set (0.00 sec)

mysql> SELECT title, pages FROM books ORDER BY pages DESC Limit 1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
