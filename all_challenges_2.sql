-- CHALLENGE 1
SELECT 
    a.au_id    AS AUTHOR_ID, 
    a.au_lname AS LAST_NAME, 
    a.au_fname AS FIRST_NAME, 
    t.title    AS TITLE, 
    p.pub_name AS PUBLISHER
  FROM titleauthor AS ta
  INNER JOIN authors AS a
          ON a.au_id = ta.au_id	  
  INNER JOIN titles AS t
          ON t.title_id = ta.title_id
  INNER JOIN publishers AS p
          ON p.pub_id = t.pub_id;

-- CHALLENGE 2
SELECT 
    a.au_id      AS AUTHOR_ID, 
    a.au_lname   AS LAST_NAME, 
    a.au_fname   AS FIRST_NAME, 
--    t.title      AS TITLE, 
    p.pub_name   AS PUBLISHER,
	COUNT(title) AS TITLE_COUNT
  FROM titleauthor AS ta
  INNER JOIN authors AS a
          ON a.au_id = ta.au_id	  
  INNER JOIN titles AS t
          ON t.title_id = ta.title_id
  INNER JOIN publishers AS p
          ON p.pub_id = t.pub_id
  GROUP BY a.au_id, p.pub_id
  ORDER BY a.au_id DESC;

-- CHALLENGE 3
SELECT 
    a.au_id     AS "AUTHOR_ID", 
    a.au_lname  AS "LAST_NAME", 
    a.au_fname  AS "FIRST_NAME", 
	SUM(s.qty)  AS "TOTAL"
  FROM authors AS a
  JOIN titleauthor AS ta
    ON a.au_id = ta.au_id	  
  JOIN sales AS s
    ON s.title_id = ta.title_id
  GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname  
  ORDER BY "TOTAL" DESC
  LIMIT 3;

-- CHALLENGE 4
SELECT
    a.au_id               AS "AUTHOR ID",
    a.au_lname            AS "LAST NAME",
    a.au_fname            AS "FIRST NAME",
    IFNULL(SUM(s.qty), 0) AS "TOTAL"
  FROM authors a
  LEFT JOIN titleauthor ta 
    ON ta.au_id   = a.au_id
  LEFT JOIN sales s        
    ON s.title_id = ta.title_id
  GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname
  ORDER BY
    "TOTAL" DESC
  LIMIT 23;
