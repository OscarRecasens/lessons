 use sakila;
SELECT DISTINCT *
INTO duplicate_table
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) > 1

DELETE sakila.actor
WHERE last_name
IN (SELECT last_name
FROM duplicate_table)

INSERT sakila.actor
SELECT *
FROM duplicate_table

DROP TABLE duplicate_table;
 
 select last_name
 from sakila.actor
 order by last_name asc;