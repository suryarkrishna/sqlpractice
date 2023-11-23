---pl/sql
SET SERVEROUTPUT ON;
--sends output from sql buffer to o/p screen

SET VERIFY OFF;
--to turn off the old/new data on the o/p screen

DECLARE
    --<variable-declaration>;
    v_empno   NUMBER(4);
    v_ename   VARCHAR2(10) NOT NULL := 'SURYA';
    v_doj     DATE DEFAULT SYSDATE;
    i         NUMBER(2) := 1;
    flag      BOOLEAN := false;
    pi        CONSTANT NUMBER(5,3) := 3.143;
BEGIN
    --<exec-statements>;
    dbms_output.put_line('welcome to pl/sql'); -- sends o/p to sql buffer

--   
--EXCEPTION
--    --<exec-statements>;
--    --<exec-statements>;
--    
END;
/

--write a pl/sql program to print welcome

BEGIN
    dbms_output.put_line('WELCOME');
END;
/


--write a pl/sql block to display sum of two numbers

DECLARE
    v_num1   NUMBER(2);
    v_num2   NUMBER(2);
    v_sum    NUMBER(3);
BEGIN
    v_num1 := &num1;
    v_num2 := &num2;
    v_sum := v_num1 + v_num2;
    dbms_output.put_line('sum of '
                           || v_num1
                           || ' and '
                           || v_num2
                           || ' is '
                           || v_sum);

END;
/

--swap two number

DECLARE
    x      NUMBER(2) := 10;
    y      NUMBER(2) := 20;
    temp   NUMBER(2);
BEGIN
    dbms_output.put_line('before swapping '
                           || x
                           || ' and '
                           || y);
    temp := x;
    x := y;
    y := temp;
    dbms_output.put_line('after swapping '
                           || x
                           || ' and '
                           || y);
END;
/

--swappin without using third variable

DECLARE
    x   NUMBER(2) := 10;
    y   NUMBER(2) := 20;
--    temp number(2);
BEGIN
    dbms_output.put_line('before swapping '
                           || x
                           || ' and '
                           || y);
--    temp := x;
    x := x + y;
    y := x - y;
    x := x - y;
    dbms_output.put_line('after swapping '
                           || x
                           || ' and '
                           || y);
END;
/

---pl/sql programs are interact with db tables

DECLARE
    v_empno   emp.empno%TYPE;
    v_ename   emp.ename%TYPE;
BEGIN
    SELECT
        empno,
        ename
    INTO
        v_empno,
        v_ename
    FROM
        emp
    WHERE
        empno = &empno;

    dbms_output.put_line(v_empno
                           || ' '
                           || v_ename);
END;
/

--write a pl/sql block to input employee and display corresponding boss name
declare 
    v_mgrname emp.ename%type;
    v_empno emp.empno%type := &empno;
begin
    select mgr.ename into v_mgrname
    from emp e, emp mgr where e.mgr = mgr.empno 
    and e.empno = v_empno;
    
    dbms_output.put_line('mgr of ' || v_empno || ' is ' || v_mgrname);
    
end;
/

--write a pl/sql block to input employee no. and display 
--corresponding employee grade

declare
    v_empno emp.empno%type := &empno;
    v_grade salgrade.grade%type;

begin
    select s.grade into v_grade
    from emp e, salgrade s
    where e.empno = v_empno and e.sal between s.losal and s.hisal;
    
    dbms_output.put_line('sal grade of ' || v_empno || ' is ' || v_grade);

end;
/

select e.empno, e.ename, s.grade, e.mgr
    from emp e, salgrade s
    where e.sal between s.losal and s.hisal;
    
--write a pl/sql block to input employee no.
--and display corresponding employee name, sal & deptno

declare
    v_empno emp.empno%type := &empno;
    v_ename emp.ename%type;
    v_sal emp.sal%type;
    v_deptno emp.deptno%type;

begin
    select e.ename, e.sal, e.deptno into v_ename, v_sal, v_deptno
    from emp e
    where empno = v_empno;
dbms_output.put_line(v_empno || ' ' || v_ename || ' ' || v_sal || ' ' || v_deptno);
end;
/

declare
    d dept%rowtype;
begin
    d.deptno := 50;
    d.dname := 'Maths';
    d.loc := 'Sec';
    insert into dept values d;
    dbms_output.put_line('record inserted');
    
    dbms_output.put_line(d.deptno|| '  ' || d.dname|| '  ' || d.loc);
end;
/

declare
    num number := &num;

begin
    if mod(num,2) = 0 then 
    dbms_output.put_line('even');
    else
    dbms_output.put_line('odd');
    end if;
    
end;
/

declare
    d dept%rowtype;

begin
    d.dname := 'FINANCE';
    d.deptno := 60;
    d.loc := 'SEC';
    
    update dept 
    set row = d
    where dname = 'FINANCE';
    

    dbms_output.put_line('record updated');
end;
/

select * from dept;


--write a pl/sql block to declare employees bonus based on 
--following conditions
--if employee is 'permanent ' and exp >= 10 yrs then 20% bonus
--if employee is 'permanent ' and exp < 10 yrs then 10% bonus
--if employee is 'temporary' declare 5% bonus

declare 
    v_exp number(2) := &exp;
    v_type char(1) := '&type';
    
begin
    if v_type = 'p' then
        if v_exp >= 10 then
            dbms_output.put_line('bonus 20%');
        else
            dbms_output.put_line('bonus 10%');
        end if;
    else 
        if v_type = 't' then
        dbms_output.put_line('bonus 5%');
        end if;
    end if ;

end;
/

--simple loop
--write a pl/sql block to display welcome message  10 times
declare 
    num number :=1;
begin 
    loop
    dbms_output.put_line('welcome ');
    num := num+1;
    if num > 10 then
        exit;
    end if;
    end loop;
end ;
/


--write a pl/sql block to display all employee names

declare 
    cursor my_cur is select ename from emp;
    v_ename emp.ename%type;
begin
    open my_cur;
    loop 
        fetch my_cur into v_ename;
        exit when my_cur%notfound;
        dbms_output.put_line(v_ename);
    end loop;
    close my_cur;
end;
/

--write a pl/sql block to display top 5 employee  maximum salaries

declare
    cursor maxsal_cur is select sal from emp order by sal desc;
    v_maxsal emp.sal%type;
    i number := 1;
    
begin
    open maxsal_cur;
    for i in 1..5
    loop
    fetch maxsal_cur into v_maxsal;
    dbms_output.put_line(v_maxsal);
    end loop;
    
    close maxsal_cur;

end;
/
    
    
declare
    cursor maxsal_cur is select sal from emp order by sal desc;
    v_maxsal emp.sal%type;
    
begin
    open maxsal_cur;
    loop
    fetch maxsal_cur into v_maxsal;
    exit when maxsal_cur%rowcount > 5;
    dbms_output.put_line(v_maxsal);
    end loop;
    
    close maxsal_cur;

end;
/
    
--write a cursor program to display empno, ename,job, sal and deptno

declare
    cursor my_cur is select empno, ename, job, sal , deptno from emp;
    v_empno emp.empno%type;
    v_ename emp.ename%type;
    v_job emp.job%type;
    v_sal emp.sal%type;
    v_deptno emp.deptno%type;

begin
    open my_cur;
    
    loop
    
    fetch my_cur into v_empno, v_ename, v_job, v_sal, v_deptno;
    exit when my_cur%notfound;
    dbms_output.put_line(v_empno || ' ' || v_ename || ' ' ||  rpad(lpad(v_job, 15, ' '),20, ' ' ) || ' ' ||  v_sal || ' ' ||  v_deptno);
    end loop;
    
    close my_cur;

end;
/



--write a cursor program to display alteranate records

declare
    cursor alt_cur is select * from emp where empno in ( select  empno from emp group by rownum, empno having mod(rownum, 2) = 0  );
    v_rec emp%rowtype;

begin
    open alt_cur;
    
    loop 
        fetch alt_cur into v_rec;
        exit when alt_cur%notfound;
        dbms_output.put_line(v_rec.ename);
    end loop;
    
end;
/

--using while loop

declare 
    cursor e_cur is select * from emp;
    e emp%rowtype;

begin
    open e_cur;
    fetch e_cur into e;
    while(e_cur%found)
    loop
        if mod((e_cur%rowcount),2) = 0 then
            dbms_output.put_line(e.empno || ' ' || e.ename);
        end if;
        fetch e_cur into e;
    end loop;
    close e_cur;
end;
/

--write a cursor program to input deptno and display corresponding employee names

--cursor with parameter
declare
    cursor emp_cur (pdeptno number) is select ename from emp where deptno = pdeptno;
   v_ename emp.ename%type;
   
begin 
    open emp_cur( &deptno );
    
    loop 
    fetch emp_cur into v_ename;
    exit when emp_cur%notfound;
    dbms_output.put_line(v_ename);
    end loop;

    close emp_cur;
end;
/

declare
    cursor emp_cur is select ename from emp where deptno = &deptno;
   v_ename emp.ename%type;
   
begin 
    open emp_cur;
    
    loop 
    fetch emp_cur into v_ename;
    exit when emp_cur%notfound;
    dbms_output.put_line(v_ename);
    end loop;

    close emp_cur;
end;
/

--write a cursor program to increment employee salaries based on following
--conditions and incremented details should be stored in employee audit table
-- if job is manager/analyst then 40%
-- if job is salesman/clerk then 20%
-- for others no increment

create table emp_audit03 (
    empno number(4),
    job varchar2(20),
    sal number(12,4)
    );
 
 declare
    cursor c1 is select empno, job, sal from emp;
    e c1%rowtype;

begin
 open c1;
 loop
 fetch c1 into e;
 exit when c1%notfound;
 dbms_output.put_line('record fetched');
 if e.job in ('MANAGER', 'ANALYST') then 
    e.sal := e.sal + e.sal * 0.4;
    insert into emp_audit03 values e;
elsif e.job in ('SALESMAN', 'CLERK') then 
    e.sal := e.sal + e.sal*0.2;
        insert into emp_audit03 values e;
else 
    e.sal := e.sal;
        insert into emp_audit03 values e;
end if;
 end loop;
 close c1;
end;
/

DELETE  from emp_audit03;

declare 
    cursor my_cur is select ename from emp;
    v_ename emp.ename%type;
begin
    open my_cur;
    loop 
        fetch my_cur into v_ename;
        exit when my_cur%notfound;
        dbms_output.put_line(v_ename);
    end loop;
    close my_cur;
end;
/


---explicit dynamic cursor

declare
    type emp_refcur is ref cursor;
    e_cur emp_refcur;
    x number;
begin 
    open e_cur for select empno from emp;
    loop
    fetch e_cur into x;
    exit when e_cur%notfound;
    dbms_output.put_line(x);
    end loop;
    close e_cur;
    dbms_output.put_line('*****************');
    open e_cur for select deptno from dept;
    loop
        fetch e_cur into x;
        exit when e_cur%notfound;
        dbms_output.put_line(x);
    end loop;
    close e_cur;
end;
/

--for cursor
declare
    cursor c1 is select empno, ename, job, sal , deptno from emp;
begin
    for i in c1
    loop
    dbms_output.put_line(i.empno || ' ' || i.ename || ' ' || i.job || ' ' ||i.sal || ' ' || i.deptno);
    end loop;
end;
/

set serveroutput on;
set verify off;

--exception handling

declare
    v_empno number(5);
    
begin
    select empno  into v_empno from emp;
    dbms_output.put_line(v_empno);
exception
    when invalid_number then
        dbms_output.put_line (' invalid number occured ');
end;
/

--user defined exceptions

--write a user defined exception program to restrict update command on every tuesday

declare
    holiday exception;
begin
    if to_char(next_day(sysdate, 'tue'), 'dy') = 'tue' then
        raise holiday;
    else
        update emp set sal = sal + 100;
    end if;
exception
    when holiday then
        dbms_output.put_line('tuesday is a holiday');
end;
/

---non pre defined exceptions
--used to handle constraint error


declare 
    duplicates_found exception;
    pragma exception_init(duplicates_found,-00001);
    
begin 
    insert into dept values('40', 'MATHS', 'hyd');
exception
    when duplicates_found then
        dbms_output.put_line('dept no already exists');
end;
/

insert into dept values('40', 'MATHS', 'hyd');

select * from dept;

alter table dept
drop constraint SYS_C0022538;

SELECT *
  FROM user_cons_columns
 WHERE table_name = 'EMP';
 
 create table constraintsdemo (
 empno number(2)   ,
 ename varchar2(20) not null,
 age number(2) check (age > 18),
 phno number(10) unique,
 sal number(7,2) default 20000,
 deptno number(2) ,
 constraint emp_pk03 primary key(empno)
 );
 
 insert into constraintsdemo values (04, 'JACOB', 31, 7331121464, 25000, 10);
 
 INSERT ALL
 INTO  constraintsdemo values ('02', 'JAMES', 30, 7331121466, 30000, 10)
 INTO  constraintsdemo values ('03', 'JONES', 20, 7331121467, 20000, 30)
 SELECT * FROM DUAL;
 
 SELECT * FROM CONSTRAINTSDEMO;
 
 SELECT * FROM CONSTRAINTSDEMO C, DEPT D
 WHERE C.DEPTNO = D.DEPTNO;
 
 declare 
    duplicates_found exception;
    pragma exception_init(duplicates_found,-00001);
    
begin 
    insert into CONSTRAINTSDEMO values('03', 'JONES', 20, 7331121467, 20000, 30);
exception
    when duplicates_found then
        dbms_output.put_line('dept no already exists');
end;
/

 insert into CONSTRAINTSDEMO values('03', 'JONES', 20, 7331121467, 20000, 30);
 
--write a pl/sql block to handle not null constraint error code
insert into CONSTRAINTSDEMO values('03', null, 20, 7331121467, 20000, 30);

 declare 
    not_null exception;
    pragma exception_init(not_null,-01400);
    
begin 
    insert into CONSTRAINTSDEMO values(05, null, 20, 7331121467, 20000, 30);
exception
    when not_null then
        dbms_output.put_line('employee name cannot be null');
end;
/


declare
    v_ename emp.ename%type;
    morethan_record_found exception;
    pragma exception_init(morethan_record_found, -01422);
begin
    select ename into v_ename from emp where deptno = 50;
    dbms_output.put_line(v_ename);
exception
    when morethan_record_found then
        dbms_output.put_line('More than one record fetched');
    when others then 
        dbms_output.put_line('Default exception is raised');
        dbms_output.put_line('raised error code is ' || sqlcode );
        dbms_output.put_line('raised error msg is ' || sqlerrm );
end;
/

--pl/sql collections
--composite datatypes

declare
     type arrtype is table of number(4) index by binary_integer;
     x arrtype;
    
begin
    for i in 1..10
    loop 
        x(i) := i*10;
    end loop;
    for k in 1..10
    loop 
        dbms_output.put_line(x(k));
    end loop;
    
end;
/

--pl/sql block to insert ename and sal into array and display array elements

declare
    type enamearr is table of emp.ename%type index by binary_integer;
    type salarr is table of emp.sal%type index by binary_integer;
    n enamearr;
    p salarr;
    cnt number :=0;
    
begin
    for i in (select ename,sal from emp)
    loop
        n(cnt) := i.ename;
        p(cnt) := i.sal;
        cnt := cnt+1;
    end loop;
    
    for i in n.first..n.last
    loop
        dbms_output.put_line(n(i) || ' ' || p(i));
    end loop;

end;
/
    
--
create or replace procedure my_proc3 (
name in varchar
)
    is 
    begin
        dbms_output.put_line('procedure executed' || ' ' || name);
    end my_proc3;
    /
--    
begin
    my_proc3('raj');
end;
/

--write a stored procedure to find the sum of two given numbers

create or replace procedure sumof2nums (
num1 in number, num2 in number, sum2 out number )
is 
begin 
    sum2 := num1+num2;
    dbms_output.put_line( sum2);
end sumof2nums;
/

begin 
    sumof2nums(4,8);
end;
/

--------------------------------------------
create or replace procedure mul_proc
is
x number(5) := 10;
y number(5) := 20;
begin 
    dbms_output.put_line('product is ' || (x*y));
end mul_proc;
/

begin
    mul_proc;
end;
/

set serveroutput on;
set verify off;

--write a procedure with parameters to add two numbers

create or replace procedure add_proc_par (
x in number,
y in number
)
is
z number(5);
begin 
    z := x + y;
    dbms_output.put_line('sum of numbers ' || z);
    
end add_proc_par;
/

begin 
    add_proc_par(100, 300);
    
end;
/
 --write a stored  procedure to input employee number and 
 --display corresponding employee name, sal and deptno
 
 create or replace procedure get_details (
 v_empno in emp.empno%type
 )
 is 
 v_ename emp.ename%type;
 v_sal emp.sal%type;
 v_deptno emp.deptno%type;
 begin
    select ename, sal , deptno into v_ename, v_sal , v_deptno
    from emp where empno = v_empno;
    dbms_output.put_line(v_ename || ' ' || v_sal || ' ' ||
    ' ' || v_deptno);
exception
    when no_data_found then
        dbms_output.put_line('Enter valid Employee no');
 
 end get_details;
 /
 
 begin
    get_details(&empno);
end;
/

--write a stored procedure using insert data into dept table

create or replace procedure insert_dept (
v_deptno dept.deptno%type,
v_dname dept.dname%type,
v_loc dept.loc%type
)
is
begin
    insert into dept values (v_deptno, v_dname, v_loc);
    dbms_output.put_line('data inserted into dept table');
exception
    when others then
        dbms_output.put_line('Please check the data entered');
end insert_dept;
/

begin 
    insert_dept(70, 'FINANCE', 'DUBAI');
end;
/

select * from dept;

--write a stored procedure to increment employee salary based
--on given percentage

create or replace procedure incr_sal (
v_incr number,
p_empno emp.empno%type
) 
is
begin
    update emp
    set sal = sal + sal * (v_incr/100) where empno = p_empno;
    
    if sql%found then 
        dbms_output.put_line('record updated');
    else 
        dbms_output.put_line('Employee record not found');
    end if;
    
end incr_sal;
/


select text from user_source where name='INSERT_DEPT';

select object_name  from user_objects where object_type = 'PROCEDURE';

cl scr;


create or replace procedure mode_demo (
x in number
)
is 
begin 
    dbms_output.put_line('Entered number is ' ||x);
exception 
    when value_error then
        dbms_output.put_line('there"s an error');
    when others then
        dbms_output.put_line('there"s an error');
end mode_demo;
/

begin 
    mode_demo('sfsd');
exception 
    when value_error then
        dbms_output.put_line('theres an error');
end;
/

--out parameter mode variables
create or replace procedure add_out(
x in number, y in number, z out number)
is 
begin 
    z:= x+y;
end add_out;
/

variable res number;

exec  add_out(10, 20, :res);

print :res;

--write a stored procedure to input employee number and
--return corresponding employee net salary

create or replace procedure get_netsal(
p_empno in emp.empno%type,
p_netsal out emp.sal%type
)
is
begin
    select sal + nvl(comm, 0) into p_netsal from emp
    where empno = p_empno;
end get_netsal;
/

variable netsal number;

exec get_netsal(7788, :netsal);

print :netsal;

declare
    netsal number;
    v_empno emp.empno%type;
begin
    v_empno := &empno;
    get_netsal(v_empno, netsal);
    dbms_output.put_line('net sal of ' || v_empno || ' is ' || netsal);
    
end;
/

--write a stored procedure to create a new user account
--and return status
DESC USER_DETAILS;

CREATE OR REPLACE PROCEDURE     user_reg_proc(
    p_user_name in user_details.user_name%type,
    p_password in user_details.password%type,
    p_cnf_password in user_details.password%type,
    p_role in user_details.role%type,
    p_status out varchar2
    )
    is
    Begin
        if length(p_password) < 6 then
            p_status := 'Min. password length is 6 chars...';
        elsif p_password != p_cnf_password then
            p_status := 'Enter and cnf password should be same';
        elsif p_role not in ('admin', 'employee', 'customer') then
            p_status := 'Invalid role';
        else  
            insert into user_details values( 'user'|| (uid_seq.nextval), p_user_name,
            p_password, p_role);
            p_status :='user created successfully';
        end if;
end user_reg_proc;
/

select * from user_details;

create sequence uid_seq
start with 1
increment by 1;

select * from user_sequences where sequence_name='UID_SEQ';


declare 
    v_status varchar(100);
begin
    user_reg_proc ('Surya', 'surya123','surya123','employee', v_status);
    dbms_output.put_line(v_status);
end;
/

update user_details
set user_id = upper(user_id)
where user_name ='SURYA';


--write a user defined function to find simple interest

create or replace function simple_int(
p number, t number, r number)
return number 
is 
interest number;
begin 
    interest :=  p*t*r/100;
    return interest;
end simple_int;
/

select  simple_int(1000, 10, 10) from dual;


declare 
    res number;
begin
    res := simple_int(1000,2,10);
    dbms_output.put_line(res);
end;
/

--write a user defined function to input employee number
--and return experience

create or replace function get_exp(
p_empno emp.empno%type
)
return number
is
v_exp number;
begin
    select trunc(months_between(sysdate, hiredate)/12,2)
    into v_exp from emp where empno = p_empno;
    return v_exp;
end get_exp;
/

select get_exp(7900) from dual;
select * from emp;


variable exp number;

declare
    exp number;
begin
    dbms_output.put_line(get_exp(7900));
end;
/

--write a package program to find given employee
--net sal and dept name

create or replace package emp_pack
is
procedure emp_netsal (v_empno emp.empno%type  );
function emp_dname(v_empno emp.empno%type) return varchar2;
end emp_pack;
/

create or replace package body emp_pack
is

procedure emp_netsal (v_empno emp.empno%type  )
is
v_netsal number;
begin
    select sal + nvl(comm, 0) into v_netsal from emp
    where empno = v_empno;
    dbms_output.put_line('Given employee netsal is ' || v_netsal);
end emp_netsal;

function emp_dname(v_empno emp.empno%type)
return varchar2
is
v_dname dept.dname%type;
begin
    select dname into v_dname from dept where deptno = (select deptno from emp where empno = v_empno);
    return v_dname;
end emp_dname;
end emp_pack;
/



exec emp_pack.emp_netsal( 7788 );
select  emp_pack.emp_dname( 7788 ) from dual;
  
--function overloading in packages

create or replace package fo_pack
is
function addval( x number, y number) return number;
function addval( x number, y number, z number) return number;
end fo_pack;
/

create or replace package body fo_pack 
is
function addval( x number, y number ) 
return number
is
begin
    return (x +y);
end addval;

function addval( x number, y number, z number)
return number
is
begin 
return (x+y+z);
end addval;
end fo_pack;
/

select fo_pack.addval(2, 4, 8) from dual;

--write a trigger program to change dept name into
--capital letter automatically while inserting data

create or replace trigger dept_trig
before insert on dept for each row
begin
    :new.dname = upper( :new.dname);
end;
/

--write a trigger to raise error if updated sal < existing sal
create or replace trigger sal_trig
before update on table04
for each row
declare
less_sal exception;
begin
    if (:new.sal < :old.sal) then
        raise less_sal;
    end if
exception 
    when less_sal then 
        dbms_output.put_line('New sal is less than existing sal');
end;
/

select * from tab where tname like '%EMP%';
desc emp2;

create table table04 as (select *  from emp where 1=3);
desc table04;

select * from table04;

insert into table04  select * from emp;

select trunc(sysdate) from dual;
select sysdate from dual;

--write a trigger program to restrict drop command on db objects


--materialised views





