--an attempt to dive deeper into sql 
--with clause in sql
--better understanding of rank concept
--lead and lag in sql

with avg_sal as 
(select avg(sal) from emp)

select * 
from emp 
where sal > (select * from avg_sal);

-- with can be used of subquery refactoring , more like an alias for a sub query

with emp_dept as 
(select * from emp, dept where emp.deptno = dept.deptno)

select loc from emp_dept
where empno = 7788;

-- partition by clause
select empno, ename, sal , 
avg(sal) over() as "total avg sal",
avg(sal) over(partition by deptno) as "dept wise  avg sal"
from emp;

/*Compared to window functions, GROUP BY collapses individual records into a group. 
As a consequence, you cannot refer to any individual record field; 
that is, only the columns in the GROUP BY clause can be referenced.*/

select avg(sal), deptno 
from emp
group by deptno;

select avg(sal) from emp;

select empno, ename, sal, 
trunc((select avg(sal) from emp),2) as avg_sal
from emp;


---------------------------------------------------------
--pl/sql practice questions
with enames_t as 
(select ename from emp)
select ename from enames_t 
where ename like '%A%';

-------------------
--anonymous block
declare
    message varchar2(20) := 'Hello World';
begin
    dbms_output.put_line(message);
end;
/

set serveroutput on;

--
create or replace procedure printupton(
v_num number) 
is 
cnt number(2) :=1;
begin 
    loop
        exit when cnt > v_num;
        dbms_output.put_line(cnt);
        cnt := cnt+1;
    end loop;
end printupton;
/

begin
    printupton(20);
end;
/
-------------------------------------------------------------------
--pl/sql assignment
--question 1
set serveroutput on;
set verify off;

create table employeedetails23 (
	empno number(4),
	ename varchar2(20),
	sal number(9,2)
);
alter table employeedetails23
add constraint employeedetails23_pk primary key (empno);
delete from employeedetails23 where empno = 7934;


create or replace procedure insertDataMt15L(
	v_empno in number,
	v_ename in varchar2,
	v_sal in number
)
is
begin
	if v_sal * 12 > 1500000 then
		insert into employeedetails23 values (v_empno, v_ename, v_sal);
		dbms_output.put_line('Record inserted successfully');
	else	
		dbms_output.put_line('Please enter the employee details whos annual sal is more than 15,00,000');
	end if;
exception
    when value_error then
        dbms_output.put_line('Please check the value entered');
    when others then 
        dbms_output.put_line(sqlerrm);

end insertDataMt15L ;
/

Begin
    insertDataMt15L(&empno, '&ename', &sal);
end;
/

select * from employeedetails23;


-------------------------------------------------------------------
--question 2

create or replace procedure insertNyS3
is
    cursor loc_sg_c is select empno, ename, sal, loc, grade from 
				emp,dept, salgrade where emp.deptno = dept.deptno 
				and emp.sal between salgrade.losal and salgrade.hisal;
	v_empno employeedetails23.empno%type;
	v_ename employeedetails23.ename%type;
	v_sal employeedetails23.sal%type;
	v_loc dept.loc%type;
	v_grade salgrade.grade%type;
begin
	open loc_sg_c;
	fetch loc_sg_c into v_empno, v_ename, v_sal, v_loc, v_grade;
	while(loc_sg_c%found)
	loop
        dbms_output.put_line(v_empno ||' ' || v_ename||' ' || v_sal||' ' || v_loc||' ' ||v_grade);
		if v_loc = 'NEW YORK' and v_grade = 3 then
			insert into employeedetails23 values(v_empno, v_ename, v_sal);
            dbms_output.put_line('record inserted successfully');
		elsif v_loc = 'NEW YORK' then
			dbms_output.put_line('Employee not in salgrade 3');	
		elsif v_grade = 3 then 
			dbms_output.put_line('Employee not from new york');
		else
			dbms_output.put_line('not from new york and not from salgrade 3');
		end if;

		fetch loc_sg_c into v_empno, v_ename, v_sal, v_loc, v_grade;
	end loop;
	close loc_sg_c;
end insertNyS3;
/


------expected data to be inserted
select empno, ename, sal, loc, grade from 
				emp,dept, salgrade where emp.deptno = dept.deptno 
				and emp.sal between salgrade.losal and salgrade.hisal and grade = 3 and loc='NEW YORK';
                
--7934	MILLER	1500	NEW YORK	3

---executing the procedure

desc employeedetails23;

begin
    insertNyS3();
end;
/

select * from employeedetails23;
----------------------------------------------------------------------------------------
--question 3
create or replace procedure insertexpclerk
is
    cursor exp_clrk_c is select empno, ename, sal, 
    trunc(months_between(sysdate, hiredate)/12,2), job from emp;
	v_empno employeedetails23.empno%type;
	v_ename employeedetails23.ename%type;
	v_sal employeedetails23.sal%type;
	v_exp number(5,2);
    v_job emp.job%type;
begin
	open exp_clrk_c;
	fetch exp_clrk_c into v_empno, v_ename, v_sal, v_exp, v_job;
	while(exp_clrk_c%found)
	loop
        dbms_output.put_line(v_empno ||' ' || v_ename||' ' || v_sal||' ' || v_exp||' ' ||v_job);
		if v_exp between 3 and 5 and v_job = 'CLERK' then
			insert into employeedetails23 values(v_empno, v_ename, v_sal);
            dbms_output.put_line('record inserted successfully');
		elsif v_exp  between 3 and 5 then
			dbms_output.put_line('Employee not a clerk');	
		elsif v_job = 'CLERK' then 
			dbms_output.put_line('Employee not experienced in 3 to 5');
		else
			dbms_output.put_line('not a 3 to 5 year experienced clerk');
		end if;

	fetch exp_clrk_c into v_empno, v_ename, v_sal, v_exp, v_job;

	end loop;
	close exp_clrk_c;
end insertexpclerk;
/

begin 
    insertexpclerk;
end;
/

select * from employeedetails23;
----------------------------------------------------------------------------------------
--question 4

create or replace procedure insertSameNameExplt1
(p_empno in  employeedetails23.empno%type, 
p_ename in employeedetails23.ename%type,
p_sal in employeedetails23.sal%type)
is
cursor enames23_c is select ename from employeedetails23;
v_ename employeedetails23.ename%type;
flag boolean;

begin
	open enames23_c;
	fetch enames23_c into v_ename;
	while(enames23_c%found)
	loop
		if v_ename = p_ename then
			insert into employeedetails23 values(p_empno, p_ename, p_sal);
            dbms_output.put_line('Record inserted successfully');
            flag := true;
            exit;
        else
            flag := false;
        end if;
        fetch enames23_c into v_ename;
    end loop;
    if not flag then 
        dbms_output.put_line('Name does not match');
    end if;
    close enames23_c;
exception 
    when value_error then    
        dbms_output.put_line('Please enter a valid value');
end insertSameNameExplt1;
/

--executing procedure
begin 
    insertSameNameExplt1(&empno, '&ename', &sal);
end;
/

select * from employeedetails23;
----------------------------------------------------------------------------------------
--question 5

select distinct m.empno,m.ename, m.sal from emp e, emp m
where e.mgr = m.empno and months_between(sysdate, m.hiredate)/12 > 5
and to_char(m.hiredate, 'yyyy') between 1976 and 1981 and m.empno in (select mgr
from emp 
where job = 'SALESMAN'
group by mgr
having count(*) > 2);

--managers with atleast two sales person

select distinct m.empno, count(*) over (partition by m.empno)
from emp e, emp m
where e.mgr = m.empno and E.job = 'SALESMAN';


select count(*), mgr
from emp 
where job = 'SALESMAN'
group by mgr
having count(*) > 2;

---------------------------------------
declare
	v_empno employeedetails23.empno%type;
	v_ename employeedetails23.ename%type;
	v_sal employeedetails23.sal%type;
	cursor c1 is select distinct m.empno,m.ename, m.sal from emp e, emp m
		where e.mgr = m.empno and months_between(sysdate, m.hiredate)/12 > 5
		and to_char(m.hiredate, 'yyyy') between 1976 and 1981 and m.empno in (select mgr
		from emp 
		where job = 'SALESMAN'
		group by mgr
		having count(*) > 2);
begin
	open c1;
    fetch c1 into v_empno, v_ename , v_sal ;
    while(c1%found)
	loop
    insert into employeedetails23 values(v_empno, v_ename , v_sal);
	dbms_output.put_line('Record inserted successfully');
	fetch c1 into v_empno, v_ename , v_sal ;
	end loop;
	close c1;
end;
/	


select * from employeedetails23;

---------------------------------
commit;


--------------------------------------------------------
--example for dynamic explicit cursor
declare 
    type emp_ename_refcur is ref cursor;
    ename_cur emp_ename_refcur;
    v_ename varchar2(20);
    
begin
    open ename_cur for select ename from emp;
    loop 
        fetch ename_cur into v_ename;
        exit when ename_cur%notfound;
        dbms_output.put_line(v_ename);
    end loop;
--    select listagg(ename,',') into v_ename from emp;
--    dbms_output.put_line(v_ename);
    close ename_cur;
    
end;
/
-----------------------------------------------------------------
--user defined exception
declare 
    not27 exception;
    v_num number(3) :=&num;
begin
    if v_num = 27 then
        raise not27;
    else 
        dbms_output.put_line('Thanks for not entering 27');
    end if;
    exception
        when not27 then 
            dbms_output.put_line('please enter another number');
end;
/
-------------------------------------------------
--pl/sql table
declare 
    type plsql_table is table of number(4) index by binary_integer;
    table1 plsql_table;
    cursor c1 is select empno from emp;
    cnt number(2) :=0;
    
begin
    for i in c1
    loop
        table1(cnt) := i.empno;
        cnt := cnt+1;
    end loop;
    
    for i in table1.first..table1.last
    loop
        dbms_output.put_line(table1(i));
    end loop;
    
end;
/
--------------------------------------------------------------------

--better understanding of pl/sql
--November 8, 2023 09:57 AM;
--write a query to display employee names ending with %
select 
    ename
from 
    emp
where 
    ename like '%!%' escape '!';

----------------------------------------
select count(distinct deptno) from emp;

--------------------------
--write a query to display no of employees working in each dept;

select count(*), deptno
from emp
group by deptno
having count(*) > 3;

--or

select emp.*, count(*) over (partition by deptno) as cnt
from emp;


select * from emp;
--------------------------------------------
select 
    ename 
from 
    emp
where 
    hiredate 
in (
select 
    hiredate
from 
    emp
group by
    hiredate
having
    count(*) > 1);
--------------------------------
--using pl/sql tables

declare
    type ename_t is table of emp.ename%type index by binary_integer;
    enames_table ename_t; 

begin
    select ename bulk collect into enames_table  from emp;
    for i in enames_table.first..enames_table.last
    loop
        dbms_output.put_line(enames_table(i));
    end loop;
end;
/

set serveroutput on;

declare
    type empno_t is table of emp.empno%type index by binary_integer;
    empno_table empno_t;
    cursor empno_c is select empno from emp;

begin
open empno_c;
    fetch empno_c bulk collect into empno_table;
    
    for i in empno_table.first..empno_table.last
    loop
        dbms_output.put_line(empno_table(i));
    end loop;
    close empno_c;
end;
/
-----------------------------------------------------------------------
select * from empd23 order by empno;

declare 
    type empno23_table is table of empd23.empno%type index by binary_integer;
    empno_t empno23_table;
    cursor empno_c is select empno from empd23;
    
begin
    open empno_c;
    fetch empno_c bulk collect into empno_t
    limit 5;
    
    forall i in empno_t.first..empno_t.last
    update empd23 set sal = sal+1 where empno = empno_t(i);
    commit;
    close empno_c;

end;
/
------------------
declare 
    l_start number;
begin
    l_start := dbms_utility.get_time;
    dbms_output.put_line(l_start);
end;
/


-----------------------------
--declaring and assigning data to pl/sql table
declare
    type t_tabofintegers is table of number;
    l_integers t_tabofintegers := t_tabofintegers(2, 5, 7, 3, 9);
begin
    l_integers.extend;
    l_integers(l_integers.last) := 11;
    for i in l_integers.first .. l_integers.last
    loop
        dbms_output.put_line(l_integers(i));
    end loop;
end;
/







