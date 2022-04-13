SELECT title, author_lname FROM books;
-- +-----------------------------------------------------+----------------+
-- | title                                               | author_lname   |
-- +-----------------------------------------------------+----------------+
-- | The Namesake                                        | Lahiri         |
-- | Norse Mythology                                     | Gaiman         |
-- | American Gods                                       | Gaiman         |
-- | Interpreter of Maladies                             | Lahiri         |
-- | A Hologram for the King: A Novel                    | Eggers         |
-- | The Circle                                          | Eggers         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         |
-- | Just Kids                                           | Smith          |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         |
-- | Coraline                                            | Gaiman         |
-- | What We Talk About When We Talk About Love: Stories | Carver         |
-- | Where I'm Calling From: Selected Stories            | Carver         |
-- | White Noise                                         | DeLillo        |
-- | Cannery Row                                         | Steinbeck      |
-- | Oblivion: Stories                                   | Foster Wallace |
-- | Consider the Lobster                                | Foster Wallace |
-- | 10% Happier                                         | Harris         |
-- | fake_book                                           | Harris         |
-- | Lincoln In The Bardo                                | Saunders       |
-- +-----------------------------------------------------+----------------+
SELECT title, author_lname FROM books GROUP BY author_lname;
-- +-----------------------------------------------------+----------------+
-- | title                                               | author_lname   |
-- +-----------------------------------------------------+----------------+
-- | What We Talk About When We Talk About Love: Stories | Carver         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         |
-- | White Noise                                         | DeLillo        |
-- | A Hologram for the King: A Novel                    | Eggers         |
-- | Oblivion: Stories                                   | Foster Wallace |
-- | Norse Mythology                                     | Gaiman         |
-- | 10% Happier                                         | Harris         |
-- | The Namesake                                        | Lahiri         |
-- | Lincoln In The Bardo                                | Saunders       |
-- | Just Kids                                           | Smith          |
-- | Cannery Row                                         | Steinbeck      |
-- +-----------------------------------------------------+----------------+
advantages; count how many books aeach authir has written
mysql> SELECT author_lname, COUNT(*) FROM books GRoUP BY author_lname;
+----------------+----------+
| author_lname   | COUNT(*) |
+----------------+----------+
| Carver         |        2 |
| Chabon         |        1 |
| DeLillo        |        1 |
| Eggers         |        3 |
| Foster Wallace |        2 |
| Gaiman         |        3 |
| Harris         |        2 |
| Lahiri         |        2 |
| Saunders       |        1 |
| Smith          |        1 |
| Steinbeck      |        1 |
+----------------+----------+





mysql> SELECT author_fname, author_lname, COUNT(*) FROM books GRoUP BY author_lname;
+--------------+----------------+----------+
| author_fname | author_lname   | COUNT(*) |
+--------------+----------------+----------+
| Raymond      | Carver         |        2 |
| Michael      | Chabon         |        1 |
| Don          | DeLillo        |        1 |
| Dave         | Eggers         |        3 |
| David        | Foster Wallace |        2 |
| Neil         | Gaiman         |        3 |
| Dan          | Harris         |        2 |
| Jhumpa       | Lahiri         |        2 |
| George       | Saunders       |        1 |
| Patti        | Smith          |        1 |
| John         | Steinbeck      |        1 |
+--------------+----------------+----------+
although dan harris have written just one book. How to solve this.

mysql> SELECT author_fname, author_lname, COUNT(*) FROM books GRoUP BY author_lname,author_fname;
+--------------+----------------+----------+
| author_fname | author_lname   | COUNT(*) |
+--------------+----------------+----------+
| Raymond      | Carver         |        2 |
| Michael      | Chabon         |        1 |
| Don          | DeLillo        |        1 |
| Dave         | Eggers         |        3 |
| David        | Foster Wallace |        2 |
| Neil         | Gaiman         |        3 |
| Dan          | Harris         |        1 |
| Freida       | Harris         |        1 |
| Jhumpa       | Lahiri         |        2 |
| George       | Saunders       |        1 |
| Patti        | Smith          |        1 |
| John         | Steinbeck      |        1 |
+--------------+----------------+----------+
now , this time its correct. ....


there will be year repeating , so just condensed them and print the count its repeating it.
mysql> select released_year from books;
+---------------+
| released_year |
+---------------+
|          2003 |
|          2016 |
|          2001 |
|          1996 |
|          2012 |
|          2013 |
|          2000 |
|          2010 |
|          2001 |
|          2003 |
|          1981 |
|          1989 |
|          1985 |
|          1945 |
|          2004 |
|          2005 |
|          2014 |
|          2001 |
|          2017 |
+---------------+

mysql> SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
+---------------+----------+
| released_year | COUNT(*) |
+---------------+----------+
|          1945 |        1 |
|          1981 |        1 |
|          1985 |        1 |
|          1989 |        1 |
|          1996 |        1 |
|          2000 |        1 |
|          2001 |        3 |
|          2003 |        2 |
|          2004 |        1 |
|          2005 |        1 |
|          2010 |        1 |
|          2012 |        1 |
|          2013 |        1 |
|          2014 |        1 |
|          2016 |        1 |
|          2017 |        1 |
+---------------+----------+

.. we can concantinate it too to look good.
mysql> SELECT CONCAT('In ' , released_year , ' ', COUNT(*), ' books(s) released') AS year FROM books GROUP BY released_year;
+-----------------------------+
| year                        |
+-----------------------------+
| In 1945 1 books(s) released |
| In 1981 1 books(s) released |
| In 1985 1 books(s) released |
| In 1989 1 books(s) released |
| In 1996 1 books(s) released |
| In 2000 1 books(s) released |
| In 2001 3 books(s) released |
| In 2003 2 books(s) released |
| In 2004 1 books(s) released |
| In 2005 1 books(s) released |
| In 2010 1 books(s) released |
| In 2012 1 books(s) released |
| In 2013 1 books(s) released |
| In 2014 1 books(s) released |
| In 2016 1 books(s) released |
| In 2017 1 books(s) released |
