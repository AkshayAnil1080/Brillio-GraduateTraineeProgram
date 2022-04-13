How many books are in database
SELECT COUNT(*) FROM books;
+----------+
| COUNT(*) |
+----------+
|       19 |
+----------+

-- How many author_fname
SELECT COUNT(author_fname) FROM books;
+---------------------+
| COUNT(author_fname) |
+---------------------+
|                  19 |
+---------------------+

-- How many unique author_fname
SELECT COUNT(DISTINCT(author_fname)) FROM books;
+-------------------------------+
| COUNT(DISTINCT(author_fname)) |
+-------------------------------+
|                            12 |
+-------------------------------+


-- How many disticnt authors
SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;
+--------------------------------------------+
| COUNT(DISTINCT author_fname, author_lname) |
+--------------------------------------------+
|                                         12 |
+--------------------------------------------+

-- How many title contains "the" ?
SELECT title FROM books WHERE title LIKE '%the%';
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| A Hologram for the King: A Novel          |
| The Circle                                |
| The Amazing Adventures of Kavalier & Clay |
| Consider the Lobster                      |
| Lincoln In The Bardo                      |
+-------------------------------------------+

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+
