--- 1)
use sakila;
select rating
from sakila.film;


--- 2)
select release_year
from sakila.film;

---- 3)
select *
from sakila.film
where title like 'ARMAGEDDON%';

---- 4)
select *
from sakila.film
where title like 'APOLLO%';

---- 5)

select *
from sakila.film
where title like '%APOLLO';


----- 6)

select *
from sakila.film
where title like '% DATE%' or '%DATE %';


----- 7)
use sakila;

select title
from sakila.film
where length(title) = (select max(length(title)) from sakila.film);


---- 8)
select title, length
from sakila.film
order by length desc 
limit 10;

----- 9)

select title, special_features, count(title)
from sakila.film
where special_features like '%behind%';


------ 10) 

select *
from sakila.film
order by title asc;

---- all release years are 2006, we cannot order something by 2 things at the same time as well
