-- mysql> select * from books;
-- +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
-- | book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
-- +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
-- |       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
-- |       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
-- |       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
-- |       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
-- |       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
-- |       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
-- |       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
-- |       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
-- |       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
-- |      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
-- |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
-- |      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
-- |      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
-- |      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
-- |      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
-- |      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
-- |      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
-- |      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
-- |      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
-- +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
Q1. Find the year each author published their first book. - have to use min(released_year)
mysql> SELECT author_fname, author_lname, Min(released_year) FROM books GROUP  BY author_lname, author_fname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | Min(released_year) |
+--------------+----------------+--------------------+
| Raymond      | Carver         |               1981 |
| Michael      | Chabon         |               2000 |
| Don          | DeLillo        |               1985 |
| Dave         | Eggers         |               2001 |
| David        | Foster Wallace |               2004 |
| Neil         | Gaiman         |               2001 |
| Dan          | Harris         |               2014 |
| Freida       | Harris         |               2001 |
| Jhumpa       | Lahiri         |               1996 |
| George       | Saunders       |               2017 |
| Patti        | Smith          |               2010 |
| John         | Steinbeck      |               1945 |
+--------------+----------------+--------------------+

Q2.Find the year each author published their latest book. - have to use max(released_year)
mysql> SELECT author_fname, author_lname, Max(released_year) FROM books GROUP  BY author_lname, author_fname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | Max(released_year) |
+--------------+----------------+--------------------+
| Raymond      | Carver         |               1989 |
| Michael      | Chabon         |               2000 |
| Don          | DeLillo        |               1985 |
| Dave         | Eggers         |               2013 |
| David        | Foster Wallace |               2005 |
| Neil         | Gaiman         |               2016 |
| Dan          | Harris         |               2014 |
| Freida       | Harris         |               2001 |
| Jhumpa       | Lahiri         |               2003 |
| George       | Saunders       |               2017 |
| Patti        | Smith          |               2010 |
| John         | Steinbeck      |               1945 |
+--------------+----------------+--------------------+

Q3. Find the longest page count for each author and give the column name as "Longestbooks" and author full name as " Authors"
mysql> SELECT CONCAT(author_fname,' ', author_lname) AS Authors ,Max(pages) AS  LongestBooks FROM books GROUP BY author_lname, author_fname;
+----------------------+--------------+
| Authors              | LongestBooks |
+----------------------+--------------+
| Raymond Carver       |          526 |
| Michael Chabon       |          634 |
| Don DeLillo          |          320 |
| Dave Eggers          |          504 |
| David Foster Wallace |          343 |
| Neil Gaiman          |          465 |
| Dan Harris           |          256 |
| Freida Harris        |          428 |
| Jhumpa Lahiri        |          291 |
| George Saunders      |          367 |
| Patti Smith          |          304 |
| John Steinbeck       |          181 |
+----------------------+--------------+

Q4.
