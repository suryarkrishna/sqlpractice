--substr():
--substr('original string', 'position', length);

select substr('surya', 2,3) from dual; --output: ury

select substr('surya', -3,2 ) from dual; --expected ouput: ry

--instr('original string', 'sub_str', position, occurence)

select instr('surya', 'r', 2, 1) from dual;

select instr('ramakrishna', 'a', 3, 2) from dual; --expected output : 11

select  ename
from emp
group by rownum, ename
having rownum = 4;

--or

select *
from (select rownum sno, emp.* from emp)
where sno = 4;

--write a query to display 12th max salary
select * from emp where sal = (select sal 
from (select rownum sno, sal from (select distinct sal from emp order by sal desc))
where sno = 12);

select sal from (select distinct sal from emp group by rownum, sal order by sal desc) group by rownum, sal having rownum = 12;

select sal from (select rownum sno, sal from (select distinct sal from emp order by sal desc)) where sno = 12;


--data definition language - create alter rename truncate drop
--create:
 --creating a table
 --syntax:
create table dept23 (
ename varchar2(20),
deptid number(2) 
);

desc dept23;

--Table EMP23 created.
--creating  table with constraints
create table emp23c (
    eid number(2) primary key ,
    ename varchar2(20),
    sal number(7,2) default 25000,
    deptno number(2) ,
    constraint sal_chk check (sal < 60000),
    constraint emp23c_fk foreign key(deptno) references dept23(deptid)
    );
    
insert  into emp23c(eid, ename, sal)
select empno, ename,sal from emp;

desc emp;
alter table emp23c 
modify eid number(4);

select * from emp23c;
select * from dept23;

insert all 
into dept23 values('TECH', 10)
into dept23 values('FINANCE', 20)
into dept23 values('SALES', 30)
select * from dual;

declare 
    v_empno emp23c.eid%type;
    v_ename emp23c.ename%type;
    v_sal emp23c.sal%type;
    cursor c1 is select eid, ename, sal from emp23c;
begin
    open c1;
    loop  
        fetch c1 into v_empno, v_ename, v_sal;
    exit when c1%notfound;
    if mod(v_empno, 2)= 0 and mod(v_empno, 3) = 0 then
        insert into emp23c values ( v_empno, v_ename, v_sal,30);
    elsif mod(v_empno, 2) = 0 then
       insert into emp23c values (v_empno, v_ename, v_sal, 20);
    else
        insert into emp23c values (v_empno, v_ename, v_sal,10);

    end if;
    end loop;
    close c1;

end;
/

select * from emp23c, dept23
where emp23c.deptno(+)= dept23.deptno;

update emp23c
set deptno = 30
where mod(eid,2) = 0 and mod(eid, 3) =0;

select count(*), deptno
from emp23c
group by deptno
order by deptno;

alter table dept23
rename column deptid to deptno;

alter table dept23
add  loc varchar2(10);

update dept23
set loc = 
    case deptno
    when 10 then
    'HYD'
    when 20 then
    'CHE'
    when 30 then
    'BAN'
    end ;
    
select * from dept23;
select * from emp23c;

insert into dept23
values ('OPERATIONS',  40, 'GUR');

create table emp23  as select eid, ename, sal from emp23c;

select * from emp23;

desc dept23;


--to create a connnection between two tables emp23 and dept23
alter table emp23
modify deptno number(2);

alter table emp23
add constraint emp23_fk foreign key(deptno) references dept23(deptno);

update emp23
set deptno =
    case 
        when mod(eid,2) = 0 then
            10
        when mod(eid,2) = 1 then
        20
        when mod(eid,2) = 0  and mod(eid,3) = 0 then
        30
    end
    ;
select * from emp23, dept23
where emp23.deptno = dept23.deptno;

--dml
--insert update delete

--tcl :savepoint, rollback, commit

insert into dept23 values ('projects', 50, 'KKD');
savepoint kkd;


insert into dept23 values ('HR', 60 , 'VIZ');
savepoint viz;


select * from dept23;


delete from dept23
where deptno > 40;

rollback to kkd;

select * from emp23
where eid = &&empno;

SELECT
	ename
FROM
	emp
INNER JOIN dept
		USING(deptno)
ORDER BY
	emp.sal DESC 
fetch first 1 row only;


create table emp24 as select * from emp23 where 1 = 2;

select * from emp24;

insert  into emp24
select * from emp23;

truncate table emp24;

select * from emp23;

--views
create or replace view emp_names as 
select ename from emp;

select extract(year from sysdate) from dual;


create or replace view emp_avg as 
select avg(sal), deptno from emp group by deptno;

explain plan for
select avg(sal), deptno from emp group by deptno;

select plan_table_output 
from table(dbms_xplan.display());

CREATE SEQUENCE item_seq;

---plsql revision
--anonymous block
begin
    dbms_output.put_line('Hello World');
end;
/
------------------------------------------------------------------

declare
    message varchar2(55) := 'Hello world';
begin
    dbms_output.put_line( message );
end;
/
------------------------------------------------------------------

declare
    res number;
begin
    res := 1/0;
    exception
        when zero_divide then
            dbms_output.put_line( 'cannot divide by zero' );
end;
/
------------------------------------------------------------------

declare
    x number(2) := &x;
    y number(2) := &y;
    z number(3);
begin
    z := x+y;
    dbms_output.put_line('sum is ' || z);
end;
/
-------------------------------
set verify off;

--if else elsif endif

declare 
    x number(2) := &x;
    flag boolean;
begin
    flag := x >=10;
    if flag then
        dbms_output.put_line('Entered value is not a digit');
    else
        dbms_output.put_line('Digit entered is ' || x);
    end if;
end;
/
----------------------------------------------------------------
--case
declare
    c_grade char( 1 );
    c_rank varchar2( 20 );
begin
    c_grade := upper( '&grade' );
    case c_grade
    when 'A' then
        c_rank := 'excellent';
    when 'B' then
        c_rank := 'very good';
    when 'C' then
        c_rank := 'good';
    when 'D' then
        c_rank := 'fair';
    when 'E' then 
        c_rank := 'poor';
    else
        c_rank := 'no such grade';
    end case;

    dbms_output.put_line( c_rank );
    
end;
/

------------------------------------------------------
--go to 

begin
    goto second_message;
    
    <<first_message>>
        dbms_output.put_line('First message');
        goto end_message;
    <<second_message>>
        dbms_output.put_line('Second message');
        goto first_message;
    <<end_message>>
        dbms_output.put_line('End message');
end;
/
-------------------------------------------------------------------
--loop
declare 
    l_count number := 0;
begin
    loop
        l_count := l_count+1;
        if l_count > 3 then
            exit;
        end if;
        dbms_output.put_line( 'inside loop: ' || l_count );
    end loop;
    dbms_output.put_line( 'outside loop: ' || l_count );

end;
/

-----------------------------------------------------------
---select into 
declare 
    v_empno emp.empno%type := &empno;
    v_ename emp.ename%type;
begin
    select ename into v_ename from emp where empno = v_empno;
    dbms_output.put_line(v_ename);
end;
/

------------------------------------------------------------------
--raising exceptions
declare
    l_dividend number(2) := &dividend;
    l_divisor number(2) := &divisor;
    l_remainder number(2);
begin
    if l_divisor = 0 then 
        raise_application_error( -20002,'cannot divide with zero rae');
    end if;
    l_remainder := l_dividend / l_divisor;
    dbms_output.put_line(l_remainder);
--exception
--    when zero_divide then
--        dbms_output.put_line('Cannot divide with zero');
end;
/
---------------------------------------------------------------------

declare
    twentyseven_e exception;
    pragma exception_init(twentyseven_e, -20001);
    v_number number(2) := &number;
begin
   
    if v_number = 27 then
        raise twentyseven_e;
    else
        dbms_output.put_line('Entered number is ' || v_number);
    end if;
    
    exception
        when twentyseven_e then 
            dbms_output.put_line('27 is not allowed');
end;
/

-------------------
--cursor:
--two types - static and dynamic cursors
--static & dynamic cursor - 2types = explicit and implicit
declare
    cursor enames_c is select ename from emp;
    v_ename emp.ename%type;

begin
    open enames_c;
    loop
        fetch enames_c into v_ename;
        exit when enames_c%notfound;
        dbms_output.put_line(v_ename);
    end loop;
    close enames_c;

end;
/
---cursor using while loop
declare
    cursor enames_c is select ename from emp;
    v_ename emp.ename%type;

begin
    open enames_c;
    fetch enames_c into v_ename;
    while(enames_c%found)
    loop
        dbms_output.put_line(v_ename);
        fetch enames_c into v_ename;
    end loop;
    close enames_c;

end;
/

-------------------------------------------------
--cursor with parameters

declare
    cursor emp_cur(pdeptno number) is select ename from emp where deptno = pdeptno;
    v_ename emp.ename%type;
begin
    open emp_cur(10);
     loop
        fetch emp_cur into v_ename;
        exit when emp_cur%notfound;
        dbms_output.put_line(v_ename);
    end loop;
    
end;
/

---------------------------------------------------------
--dynamic cursors: select statement is provided when opening the cursor
declare
    type emp_refcur is ref cursor;
    emp_cur emp_refcur;
    v_empno emp.empno%type;

begin
    open emp_cur for select empno from emp;
    loop
        fetch emp_cur into v_empno;
        exit when emp_cur%notfound;
        dbms_output.put_line(v_empno);
    end loop;
    close emp_cur;
end;
/
-----------------------------
declare 
    cursor c1 is select ename from emp;
    
begin
    for i in c1
    loop
        dbms_output.put_line(i.ename);
    end loop;
end;
/

------------------------------------------------------
CREATE VIEW enames AS
SELECT ename,
       SUM(sal) totalsal
FROM emp
INNER JOIN dept USING (deptno)
WHERE deptno = '10'
GROUP BY ename;

select * from enames;

--------------------------------
--composite data types
--table
declare
    type names is table of emp.ename%type index by binary_integer;
    type pay is table of emp.sal%type index by binary_integer;
    N names;
    P pay;
    cnt number:= 0;
begin 
    for i in (select ename, sal from emp)
    loop
        N(cnt) := i.ename;
        P(cnt) := i.sal;
        cnt := cnt+1;
    end loop;
    dbms_output.put_line(N.first);
    for i in N.first .. N.last
    loop
        dbms_output.put_line(N(i) || ' ' || P(i));
    end loop;

end;
/

--using bulk collect
declare
    type names is table of emp.ename%type index by binary_integer;
    type pays is table of emp.sal%type index by binary_integer;
    names_t names;
    pays_t pays;
    
begin
    select ename, sal bulk collect into names_t, pays_t from emp;
    for i in names_t.first..names_t.last
    loop
        dbms_output.put_line(lpad(names_t(i) || ' ' || pays_t(i), 20, '--'));
    end loop;
end;
/
----------------------------------------------------------------------------
---named blocks
--stored procedures
--userdefined functions
--packages
--triggers

--stored procedures
select * from user_objects where object_type='PROCEDURE';

create or replace procedure proc23 (
    x in number ,
    y in number, 
    z out number
    )
is
--<variable-declaration>
begin
    z := x + y ;
end proc23;
/

variable res number;
exec proc23(100, 30, :res);
print res;

declare 
    res number(4);
begin
      proc23(300, z=>res, y=>20);
      dbms_output.put_line(res);
end;
/

-------------------------------------------------
--user-defined functions
--should return a value

create or replace function func23(
x in number,
y in number)
return number
is
z number(4);
begin
    z := x+y;
    return z;
end func23;
/

declare 
 res number(4);
begin
    res := func23(10, 30);
    dbms_output.put_line(res);
end;
/


----------------------------------------------------
--packages:
--contains two parts: package specification & package body

create or replace package pac23
is 
procedure emp_netsal (v_empno emp.empno%type);
function emp_dname (v_empno emp.empno%type) return varchar2;
end pac23;
/

create or replace package body pac23
is
procedure emp_netsal(v_empno emp.empno%type)
is
v_netsal number;
begin
    select sal+nvl(comm, 0) into v_netsal from emp 
    where empno = v_empno;
    dbms_output.put_line('Netsal of ' || v_empno || ' is ' || v_netsal);
end emp_netsal;
function emp_dname(v_empno emp.empno%type) 
return varchar2 
is 
v_dname varchar2(20);
begin
    select dname into v_dname from dept 
    where deptno in (select deptno from emp where empno = v_empno);
    return v_dname;
end emp_dname;
end pac23;
/


---
declare
    v_dname dept.dname%type;
begin
    pac23.emp_netsal(7900);
    v_dname := pac23.emp_dname(7788);
    dbms_output.put_line(v_dname);
    
end;
/
-----------------------------------
--triggers:
create or replace trigger trig23
before insert on dept23 for each row
begin
    :new.dname := upper(:new.dname);
end;
/

grant create any trigger to  sys;
-----------------------------------------------------------










