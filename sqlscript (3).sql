REM   Script: HW5
REM   hw 5 1, 2, 3

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

select customer_id, fname, lname, email 
from customers  
minus 
select customer_id, fname, lname, email 
from customers where customer_id in ( 
select customers.customer_id where customer_id in orders.customer_id );

select customer_id, fname, lname, email 
from customers  
minus 
select customer_id, fname, lname, email 
from customers where customer_id in ( 
select customers.customer_id from customers where customer_id in orders.customer_id );

select customer_id, fname, lname, email 
from customers  
minus 
select customer_id, fname, lname, email 
from customers where customer_id in ( 
select customers.customer_id from customers where customer_id in orders );

select customer_id, fname, lname, email 
from customers  
minus 
select customer_id, fname, lname, email 
from customers where customer_id in ( 
select customer_id from customers where customer_id in orders.customer_id );

select customer_id, fname, lname, email 
from customers where customer_id in ( 
select customer_id from customers where customer_id in orders.customer_id );

select customer_id, fname, lname, email 
from customers where customer_id in ( 
select customer_id from orders );

select customer_id, fname, lname, email 
from customers  
minus 
select customer_id, fname, lname, email 
from customers where customer_id in ( 
select customer_id from orders );

select customer_id, fname, lname, email 
from customers where customer_id in (  
    select customer_id from orders 
    where count(orders.customer_id) >= 5 and  avg(orders.total)>=500 );

select customer_id, fname, lname, email 
from customers where customer_id in (  
    select customer_id from orders 
    where count(customer_id) >= 5 and  avg(orders.total)>=500 );

select customer_id, fname, lname, email 
from customers where customer_id in (  
    select customer_id from orders where order_id in( 
        select order_id, count(customer_id)>=5, avg(orders.total)>=500 from orders);

select customer_id, fname, lname, email 
from customers where customer_id in (  
    select customer_id  
    from orders where order_id in( 
        select order_id, count(customer_id)>=5, avg(orders.total)>=500  
        from orders);

select customer_id, fname, lname, email 
from customers where customer_id in (  
    select customer_id  
    from orders where order_id in( 
        select order_id, count(customer_id)>=5, avg(orders.total)>=500  
        from orders));

select order_id, count(customer_id)>=5, avg(orders.total)>=500  
        from orders;

select order_id, count(customer_id), avg(orders.total) 
        from orders;

 select order_id, count(customer_id), avg(orders.total) 
        from orders 
        group by order_id;

select order_id, count(customer_id), avg(orders.total) 
        from orders 
        where count(customer_id) >2 
        group by order_id;

select order_id, count(customer_id), avg(orders.total) 
        from orders 
        group by order_id;

select * from orders;

select order_id, count(orders.customer_id), avg(orders.total) 
        from orders 
        group by order_id;

select order_id, count(orders.customer_id), avg(orders.total) 
        from orders 
        group by order_id, count(orders.customer_id);

select order_id, count(orders.customer_id), avg(orders.total) 
        from orders 
        group by order_id;

  select  count(orders.customer_id), avg(orders.total) 
        from orders;

 select  count(customer_id), avg(orders.total) 
        from orders;

 select  count(customer_id), avg(orders.total) 
        from orders;

  select  count(customer_id), avg(orders.total) 
        from orders 
        group by customer_id;

select customer_id, count(customer_id), avg(orders.total) 
        from orders 
        group by customer_id;

select customer_id, order_id, count(customer_id), avg(orders.total) 
        from orders 
        group by customer_id;

   select customer_id, order_id, count(customer_id), avg(orders.total) 
        from orders 
        group by customer_id, order_id;

select customer_id, fname, lname, email 
from customers where customer_id in (  
    select customer_id  
    from orders where customer_id in( 
        select customer_id, , count(customer_id), avg(orders.total) 
        from orders 
        group by customer_id,  
       ) 
    );

(  
    select customer_id  
    from orders where customer_id in( 
        select customer_id, , count(customer_id), avg(orders.total) 
        from orders 
        group by customer_id,  
       ) 
    );

select customer_id  
    from orders where customer_id in( 
        select customer_id, , count(customer_id), avg(orders.total) 
        from orders 
        group by customer_id,  
       );

  select customer_id  
    from orders where order_id in ( 
        select customer_id, , count(customer_id), avg(orders.total) 
        from orders 
        group by customer_id,  
       );

select customer_id, fname, lname, email 
from customers where customer_id in (  
     
        select customer_id, , count(customer_id), avg(orders.total) 
        from orders 
        group by customer_id,  
       ) 
    );

  select customer_id, , count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        where counts>=5  and xbar > 500 
        group by customer_id, ;

 select customer_id, , count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        where counts>=5  and xbar > 500 
        group by customer_id   ;

select customer_id, , count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        where counts>=5  and xbar > 500 
        group by customer_id;

 select customer_id, , count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        --where counts>=5  and xbar > 500 
        group by customer_id;

     select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        --where counts>=5  and xbar > 500 
        group by customer_id  ;

 select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        where counts>=2 and xbar > 500 
        group by customer_id ;

  select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        where counts>=2 --and xbar > 500 
        group by customer_id ;

   select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
       -- where counts>=2 --and xbar > 500 
        group by customer_id  ;

select customer_id from orders 
    where counts >=2 and xbar >500 in (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        ) ;

 select customer_id from orders 
    where counts >=2 and xbar >500 in (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        ) ;

 select customer_id from orders 
    where counts >=2  in (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        ) ;

 select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id;

select customer_id from (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        )  
    where counts >=2;

select customer_id, fname, lname, email 
from customers where customer_id in 
    (select customer_id from (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        )  
    where counts >=2 
    ) 
);

select customer_id, fname, lname, email 
from customers where customer_id in 
    (select customer_id from (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        )  
    where counts >=2 
    );

select customer_id, fname, lname, email 
from customers where customer_id in 
    (select customer_id from (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        )  
    where counts >=2 and xbar >500 
    );

select customer_id, fname, lname, email 
from customers where customer_id in 
    (select customer_id from (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        )  
    where counts >=2 and xbar >500 
    ) 
where email is not null ;

select customer_id, fname, lname, email 
from customers where email is not null and customer_id in 
    (select customer_id from (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        )  
    where counts >=2 and xbar >500 
    );

select distinct customer_id, fname, lname, email 
from customers where email is not null and customer_id in 
    (select customer_id from (  
        select customer_id,  count(customer_id) as counts, avg(orders.total) as xbar 
        from orders 
        group by customer_id 
        )  
    where counts >=2 and xbar >500 
    );

create table hospital (   
hosp_id number GENERATED ALWAYS AS IDENTITY primary key,   
hname varchar2(15char) not null,   
hdesc varchar2 (50char)   
);

insert into hospital ( hname, hdesc) values ( 'first', 'has 2 supplies');

insert into hospital (hname, hdesc) values ( 'second', null );

select* from hospital;

drop table hospital;

