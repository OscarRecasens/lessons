use bank;

select * from trans; #selecciono todas las cols de trans


-- Comentario
select bank.trans.trans_id, bank.trans.account_id, bank.trans.date, bank.trans.type
from bank.trans;

select trans_id as Transaction_ID, account as Account_ID
from bank.trans;
select bt.trans_id as Transaction_ID
from bank.trans as bt;

select bt.trans_id as Transaction_ID
from bank.trans as bt
limit 10; #me da los 10 primeros valores

select count(*) from bank.trans;


select distinct type from bank.card;
-- es como la funcion unique() de python

select "Hello World";

select 1+2;

select distinct type from bank.card;

select distinct A2 as District from bank.district;

select A2 as district_name from bank.district;

select distinct A2 as district_name, A3 as region_name
from bank.district
order by A2 asc
limit 30;

select *, amount - payments as balance
from bank.loan;

select *, (amount - payments)/1000 as balance_in_thousands
from bank.loan;


select * from bank.loan
where status in ('B', 'b') and amount > 100000;

select * from bank.loan
limit 10;


select *
from bank.order
where not k_symbol = 'SIPO' and not amount < 1000;

select *
from bank.card
where type = 'junior' and issued > 980000;

select *
from bank.trans 
where type = 'VYDAJ' and (operation = 'VKLAD' or operation = 'VYBER')
limit 10;

select loan_id, account_id, (amount - payments) as debt 
-- solo el parantesis sera reconocido como col con titulo 'debt'
from bank.loan
where status = 'B' and (amount - payments) > 1000;


select count(order_id) from bank.order;
--- hay 6471 pedidos
select max(amount) from bank.order;
--- pedido con cantidad maxima
select min(amount) from bank.order;

select floor(avg(amount)) from bank.order;
--- redondeo hacia abajo el valor de la media
select ceiling(avg(amount)) from bank.order;
 --- redondeo hacia arriba el valor de la media
 
 --- Strings:
 select length('coche');
 
 select * , length(k_symbol) as 'Symbol_length' from bank.order;
 select *, concat(order_id,account_id) as 'concat' from bank.order;
 
 
 select *, format(amount, 2) as 'formateo' from bank.loan;
 ---- formatear a 2 decimales 
 
 select *, lower(A2), upper(A3) from bank.district;
 
 ---- pasar a mayus o minusculas
 
 select A2, left(A2, 5), A3, ltrim(A3) from bank.district;
 
 select issued, substring_index(issued, ' ', 1) from bank.card;
 
---- en el momento que encuentra un espacio en blanco coge la primera parte de ese string

select max(amount) as max_transaction from bank.trans
where amount> 0 ;
select min(amount) as min_transaction from bank.trans
where amount > 0;

select *, substr(date, 1, 2) as year from account;





