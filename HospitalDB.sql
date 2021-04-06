create table hospital (  
hosp_id number primary key,  
hname varchar2(15char) not null,  
hdesc varchar2 (50char)  
);

create table supply (  
supply_id number primary key,  
sname varchar2(15char) not null,  
sdesc varchar2 (50char),  
unit_cost number check(unit_cost>0),  
hosp_id number references hospital(hosp_id)  
);

create table inventory (  
inventory_id number primary key ,  
iname varchar2(15char) not null  
);

create table supply_inventory(  
supply_id references supply(supply_id),  
inventory_id references inventory(inventory_id),  
quantity number,  
constraint supply_inventory_pk primary key (supply_id, inventory_id)  
);

insert into hospital (hosp_id, hname, hdesc) values (001, 'first', 'has 2 supplies');

insert into hospital (hosp_id, hname, hdesc) values (002, 'second', null );

insert into hospital (hosp_id, hname, hdesc) values (003, 'third', 'has 1 supply' );

commit


insert into supply (supply_id, sname, sdesc, unit_cost, hosp_id) values (1, 's1', null, 5, 001);

insert into supply (supply_id, sname, sdesc, unit_cost, hosp_id) values (2, 's2', null, 10, 001);

insert into supply (supply_id, sname, sdesc, unit_cost, hosp_id) values (3, 's3', null, 15, 003);

insert into supply (supply_id, sname, sdesc, unit_cost, hosp_id) values (4, 's4', null, 4, 003);

insert into supply (supply_id, sname, sdesc, unit_cost, hosp_id) values (5, 's5', null, 6, null);

commit


insert into inventory (inventory_id, iname) values (101 , 'med1');

insert into inventory (inventory_id, iname) values (102 , 'med2');

insert into inventory (inventory_id, iname) values (103 , 'med3');

commit


insert into supply_inventory (supply_id, inventory_id, quantity) values (3,102, 9);

insert into supply_inventory (supply_id, inventory_id, quantity) values (3,101, 5);

insert into supply_inventory (supply_id, inventory_id, quantity) values (1,101, 5);

insert into supply_inventory (supply_id, inventory_id, quantity) values (1,102, 10);

insert into supply_inventory (supply_id, inventory_id, quantity) values (2,101, 7);

commit


select * from hospital;

select * from supply;

select * from inventory;

select * from supply_inventory;

select hospital.hosp_id, hname, supply_id, sname 
from hospital left outer join supply 
on hospital.hosp_id = supply.hosp_id;

select inventory.inventory_id, iname, supply.supply_id, sname, quantity 
from inventory join supply_inventory 
on inventory.inventory_id = supply_inventory.inventory_id 
join supply  
on supply_inventory.supply_id =  supply.supply_id ;

select inventory_id, iname, supply.supply_id, sname, quantity 
from supply join supply_inventory 
on supply.supply_id=supply_inventory.supply_id 
right outer join inventory 
using (inventory_id);

drop table supply_inventory;

drop table inventory;

drop table supply;

drop table hospital;

