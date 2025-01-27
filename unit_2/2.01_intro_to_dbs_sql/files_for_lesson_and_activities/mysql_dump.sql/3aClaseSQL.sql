insert into bank.loan 
values(8000,8000000,930705,96396,12,8033.0,'C');

delete from bank.account 
where account_id=11382;

---- como creariamos la base de datos bank desde 0

create database if not exists bank_demo;

use bank_demo;

drop table if exists district_demo;

--- comprobamos si existe y si no existe y todo ok, la creamos

CREATE TABLE district_demo (
  `A1` int(11) UNIQUE NOT NULL,
  `A2` char(20) DEFAULT NULL,
  `A3` varchar(20) DEFAULT NULL,
  `A4` int(11) DEFAULT NULL,
  `A5` int(11) DEFAULT NULL,
  `A6` int(11) DEFAULT NULL,
  `A7` int(11) DEFAULT NULL,
  `A8` int(11) DEFAULT NULL,
  `A9` int(11) DEFAULT NULL,
  `A10` float DEFAULT NULL,
  `A11` int(11) DEFAULT NULL,
  `A12` float DEFAULT NULL,
  `A13` float DEFAULT NULL,
  `A14` int(11) DEFAULT NULL,
  `A15` int(11) DEFAULT NULL,
  `A16` int(11) DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (A1)  -- constraint keyword is optional but its a good practice
);


drop table if exists account_demo;

CREATE TABLE account_demo (
  account_id int(11) UNIQUE NOT NULL,
  district_id int(11) DEFAULT NULL,
  frequency text,
  date int(11) DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (account_id),
  CONSTRAINT FOREIGN KEY (district_id) REFERENCES district_demo(A1)
) ;

---- añadir valores a la tabla ditrict demo

insert into district_demo
values (1,'Hl.m. Praha','Prague',1204953,0,0,0,1,1,100,12541,0.29,0.43,167,85677,99107),
(2,'Benesov','central Bohemia',88884,80,26,6,2,5,46.7,8507,1.67,1.85,132,2159,2674),
 (3,'Beroun','central Bohemia',75232,55,26,4,1,5,41.7,8980,1.95,2.21,111,2824,2813),
 (4,'Kladno','central Bohemia',149893,63,29,6,2,6,67.4,9753,4.64,5.05,109,5244,5892);
 
 
 insert into account_demo values
(1,4,'POPLATEK MESICNE',950324),
(2,1,'POPLATEK MESICNE',930226),
(3,5,'POPLATEK MESICNE',970707);

insert into account_demo values
(1,4,'POPLATEK MESICNE',950324),
(2,1,'POPLATEK MESICNE',930226),
(3,2,'POPLATEK MESICNE',970707);

 
 ---- cambiar el tipo de los datos de una columna
 
 alter table account_demo
modify date date;
select * from account_demo;

---- dropear una columns

alter table district_demo
drop column A15;
select * from district_demo;

----- rename table name
alter table account_demo
rename to accountDemo;
 
 ----- rename col name
 
 alter table district_demo
rename column A1 to dist_id;

----- add a new col

alter table accountDemo
add column balance int(11) after date;


