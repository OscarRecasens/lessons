use sakila;
----- 2)
select *
from sakila.actor, sakila.film, sakila.customer;

----- 3)
select title
from sakila.film;

---- 4)
select distinct name as language
from sakila.language;

----- 5.1)

select distinct store_id as stores
from sakila.store;

------ 5.2)5.3)


select distinct first_name as employees
from sakila.staff;




