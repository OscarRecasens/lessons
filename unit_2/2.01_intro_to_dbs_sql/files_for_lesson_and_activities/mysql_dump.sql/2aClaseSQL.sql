select convert(date, date)
from bank.account;
---- porque la columna ya se llamaba date, pero la estamos pasando a formato date


select date_format(convert(date,date), '%Y-%M-%D') as NewDate 
from bank.loan;

select date_format(convert(date,date), '%Y') as NewDate2
from bank.loan;

select card_id, date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%Y') as year_issued
from bank.card
where type = 'gold'
limit 10;

select min(date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%Y')) as year_issued
from bank.card
where type = 'gold';

select date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%M %D, %Y') as year_issued,
       date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%d of %M of %Y') as fecha_emision
from bank.card
limit 10;


select * from bank.card
where type = 'classic'
order by card_id
limit 10;

select * from bank.order
where k_symbol = 'SIPO' and amount > 5000
order by order_id desc
limit 10;

select isnull('Hello');
---- Me dice que hay 0 nulls en el string 'Hello'

select isnull(card_id) from bank.card;
select sum(isnull(card_id)) from bank.card;
---- devuelve el num de nulls en la columna card_id

select * from bank.order
where k_symbol is null;

select * from bank.order
where k_symbol is not null and k_symbol = ' ';
--- selecionamos los que no son null pero son espacio en blanco

select loan_id, account_id,
case
when status = 'A' then 'Good - Contract Finished'
when status = 'B' then 'Defaulter - Contract Finished'
when status = 'C' then 'Good - Contract Running'
else 'In Debt - Contract Running'
end as 'Status_Description'
from bank.loan;

use sakila;
select count(distinct last_name)
from actor;

select count(distinct language_id)
from film;

select count(*)
from film
where rating = 'PG-13';

select *
from film
where release_year = 2006
order by length desc
limit 10;


select datediff(max(rental_date), min(rental_date)) as active_days
from rental;

select *, date_format(rental_date, '%M') as month , date_format(rental_date, '%W') as weekday
from rental
limit 20;

select *, case when date_format(rental_date, '%W') in ('Saturday', 'Sunday')
          then 'weekend'
          else 'workday' end as day_type
from rental;

select date(max(rental_date))- INTERVAL 30 DAY, date(max(rental_date))
from rental;

select count(*)
from rental
where date(rental_date) between date('2006-01-15') and date('2006-02-14');




use bank;
select A3 from bank.district;
select distinct A3 from bank.district;
select * from bank.order
where k_symbol in ('leasing', 'pojistine');

select * from bank.account
where district_id in (1,2,3,4,5);
-- We are trying to get the same result using the between operator.
-- Note that 1 and 5 are included in the range of values compared/evaluated

select * from bank.account
where district_id between 1 and 5;

select * from bank.loan
where amount - payments between 1000 and 10000;


select distinct type from bank.card;


select * from bank.trans
where convert(date, date) between '1993-01-01' and '1993-01-15'
limit 10;


select count(*) from bank.loan
where status in ('C', 'D');


select distinct a2 from bank.district
where a2 regexp '^k';

select distinct a2 from bank.district
where a2 regexp 'k$';

select * from bank.district
where A3 like 'north%';

select * from bank.district
where a3 like 'north_M%';
-- This would return all the results for
-- 'north  Moravia', 'northMoravia', northMiami'

select * from bank.district
where a3 regexp 'north';

-- Now we will take a look at another table
-- to see the difference between LIKE and REGEXP
select * from bank.order
where k_symbol regexp 's';

select * from bank.order
where k_symbol regexp '^s';

select * from bank.order
where k_symbol regexp 'o$';

-- We can include multiple conditions at the same time
select distinct k_symbol from bank.order
where k_symbol regexp 'ip|is';

select * from bank.district
where a2 regexp 'ch[e-r]';

--- buscar en a2 cualquier caracter que sea ch y luego cualquier caracter entre la letra e y la r

select * from bank.district
where a2 regexp 'cesk[ey]';