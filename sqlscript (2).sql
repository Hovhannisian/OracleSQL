REM   Script: HW3 partB
REM   part b

create table customers ( 
customer_id number(6) primary key, 
fname varchar2(20byte) not null, 
lname varchar2(20byte) not null, 
email varchar2(30byte), 
dob date, 
marital varchar2(20byte), 
gender varchar2(1byte), 
income varchar2(20byte) 
);

create table orders ( 
order_id number(12) primary key, 
order_date date not null, 
order_mode varchar2(8byte), 
customer_id number not null references customers(customer_id) , 
status number(2), 
total number(8,2), 
sales_rep_id number(6), 
promo_id number(6) 
);

insert into customers(customer_id, fname, lname, email) values (01, 'abel', 'werner', 'aw@email');

insert into customers(customer_id, fname, lname, email) values (02, 'mary', 'west', 'mw@email');

insert into customers(customer_id, fname, lname, email) values (03, 'ellen', 'green', 'eg@email');

insert into customers(customer_id, fname, lname, email) values (04, 'bell', 'mark', null);

insert into customers(customer_id, fname, lname, email) values (05, 'bill', 'johnson', 'bj@email');

insert into orders(order_id, order_date, customer_id, total) values (100, TO_DATE('2020-03-29 09:40:58', 'YYYY-MM-DD HH24:MI:SS'), 01, 300);

insert into orders(order_id, order_date, customer_id, total) values (200, TO_DATE('2020-03-29 09:40:58', 'YYYY-MM-DD HH24:MI:SS'), 01, 1300);

insert into orders(order_id, order_date, customer_id, total) values (300, TO_DATE('2020-03-29 09:40:58', 'YYYY-MM-DD HH24:MI:SS'), 02, 900);

insert into orders(order_id, order_date, customer_id, total) values (400, TO_DATE('2020-03-29 09:40:58', 'YYYY-MM-DD HH24:MI:SS'), 02, 300);

insert into orders(order_id, order_date, customer_id, total) values (500, TO_DATE('2020-03-29 09:40:58', 'YYYY-MM-DD HH24:MI:SS'), 04, 1100);

insert into orders(order_id, order_date, customer_id, total) values (600, TO_DATE('2020-03-29 09:40:58', 'YYYY-MM-DD HH24:MI:SS'), 04, 100);

insert into orders(order_id, order_date, customer_id, total) values (700, TO_DATE('2020-03-29 09:40:58', 'YYYY-MM-DD HH24:MI:SS'), 03, 100);

select customer_id, fname, lname, order_id, order_date, status, total 
from customers join orders 
using(customer_id);

select customers.customer_id, fname, lname, email 
from customers left join orders 
on customers.customer_id = orders.customer_id 
where orders.customer_id is null;

select distinct customers.customer_id, fname, lname, email 
from customers join orders 
on customers.customer_id = orders.customer_id 
where email is not null 
having count(orders.customer_id) >= 5 and  avg(orders.total)>=500  
group by customers.customer_id, fname, lname, email;

