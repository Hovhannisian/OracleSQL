        
        
create table department(
    name_ varchar2(50),
    number_ number,
    primary key (name_ ,number_)
    );
        
        
        
create table employee(
    ssn number primary key,
    fname varchar2(50),
    minit varchar2(50),
    lname varchar2(50),
    bdate date,
    address varchar2(50),
    salary number,
    sex varchar2(50),
    supervisor_ssn REFERENCES employee(ssn),
    works_for_dep_name varchar2(50) not null,
    works_for_dep_num number not null,
    manages_dep_name varchar2(50),
    manages_dep_num number,
    manages_start_date date,
    foreign key(works_for_dep_name, works_for_dep_num)  REFERENCES department(name_ ,number_),
    foreign key(manages_dep_name,manages_dep_num)  REFERENCES department(name_ ,number_)
    );
    
create table location_(
    name_ varchar2(50),
    number_ number,
    location_ varchar2(50),
    foreign key(name_ ,number_) REFERENCES department(name_ ,number_),
    primary key (name_ ,number_)
    );
 

create table project_ (
    name_ varchar2(50),
    number_ number,
    location_ varchar2(50),
    dep_name varchar2(50),
    dep_number number,
    foreign key(dep_name ,dep_number) REFERENCES department(name_ ,number_),
    primary key (name_ ,number_)
    );
   
create table works_on(
    emp_ssn number ,  
    name_ varchar2(50),
    number_ number, 
    hours_ number,
    primary key (emp_ssn,name_ ,number_)
    );

update  employee
set salary =  salary * 1.1
    where works_for_dep_name = 'Marketing';

select e.fname employee_fname,  e.lname employee_lname , m.fname manager_fname,  m.lname manager_lname, sum(hours_) 
from employee e
join department d
on d.name_ =  e.works_for_dep_name and d.number_ = e.works_for_dep_num
join employee m
on d.name_ =  m.manages_dep_name and d.number_ = m.manages_dep_num
join works_on
on works_on.emp_ssn = e.ssn
group by(e.fname ,  e.lname  , m.fname ,  m.lname  , e.ssn);

drop table works_on;
drop table project_;
drop table location_;
drop table employee;
drop table department;
