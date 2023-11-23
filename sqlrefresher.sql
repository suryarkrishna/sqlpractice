--creating a view
create or replace view emp_view as select * from emp;
select * from emp_view;

--creating a view using a check option
create or replace view emp_sal_view as select * from emp  where sal > 1500 with check option ;

select * from emp_sal_view;

insert into emp_sal_view values (7979, 'RAMESH', 'SALESMAN', 7839, '01-01-1982', 1400, null, 10);

create or replace view emp_ro_view as select * from emp with read only;
drop view emp_ro_view cascade constraints;

select * from emp_ro_view;

insert into emp_ro_view values(7979, 'RAMESH', 'SALESMAN', 7839, '01-01-1982', 1400, null, 10);
select * from emp;
commit;
select * from user_objects where object_type = 'VIEW' and object_name like '%EMP%' ;

--extract (year from date)
select extract(year from sysdate) from dual;

select * from emp inner join dept using(deptno) ;

-- pl/sql refresher
set serveroutput on;
declare
    v_message varchar2(10) := 'Hello';
begin
    dbms_output.put_line(v_message);
end;
/

--user defined exceptions

declare
    L_dob date := '01-DEC-1981';
    invalid_emp_date exception;
    pragma exception_init(invalid_emp_date, -20005);
    cursor c is select ename, deptno, hiredate from emp;
begin
    for i in c
    loop
        if i.hiredate < l_dob then
            raise_application_error(-20005, 'Hiredate earlier than the given date');
        else
            dbms_output.put_line(i.ename || i.hiredate);
        end if;
    end loop;
end;
/


--stored procedures
 create or replace procedure p_toupper ( p_str varchar2)
 is
 l_str varchar2(40);
 begin
    l_str := upper(p_str);
    dbms_output.put_line('Input string in upper case ' || l_str);
end p_toupper;
/


variable m_str varchar2(50);


begin
    :m_str := 'I am working for shahgaron';
    p_toupper(:m_str);
end;
/


--function
create or replace function f_get_double (p_num number)
return number
is
l_num number;
begin
    l_num := p_num * 2;
    return l_num;
end f_get_double;
/

variable m_num number;
execute :m_num := f_get_double(10);
print m_num;

--package


declare
    type coll_method_demo  is table of number;
    l_array1 coll_method_demo;
    l_array2 coll_method_demo := coll_method_demo(45, 87, 57) ;
    
begin
    if l_array1.exists(1) then 
        dbms_output.put_line('Element 1 is found in array 1');
    else
        dbms_output.put_line('Element 1 is not found in array 1');
    end if;
end;
/

-------
    
create or replace procedure p_upperStr
(p_str in varchar2)
is
l_str varchar2(10);
begin
    l_str := upper(p_str);
    dbms_output.put_line(l_str);
end p_upperStr;
/

begin
    p_upperStr('Shahgaron');
end;
/

set serveroutput on;


-----------------------------
create or replace function f_double (p_num in number) return number
is
l_num number;
begin
    l_num := p_num * 2;
    return l_num;
end f_double;
/

select f_double(13) from dual;

-----------------------------------------------------

create or replace package p_pack 
is
procedure p_upperStr(p_str varchar2);
function f_double(p_num number) return number;
end p_pack;
/

create or replace package body p_pack 
is
procedure p_upperStr(p_str varchar2)
is
begin
    dbms_output.put_line(upper(p_str));
end p_upperStr;
function f_double(p_num number) return number 
is
begin
    return p_num*2;
end f_double;
end p_pack;
/



begin
    p_pack.p_upperStr('RadheShyam');
end;
/

variable m_num number;
exec :m_num := p_pack.f_double(23);

print m_num;

select dbms_utility.get_cpu_time() from dual;
-----------------------------------------------------------------------------------

with function fun_annsal(p_sal number) return number is
begin
    return p_sal * 12;
end;
select ename, deptno, sal, fun_annsal(sal) "annual sal" from emp;
/

-----------------------------------------------------------------------------------

declare
    type string_asc_arr_t is table of number index by varchar2(10);
    l_str string_asc_arr_t;
    l_idx varchar2(10);
begin
    l_str('JAN-MAR') := 90;
    l_str('APR-JUN') := 91;
    l_str('JUL-SEP') := 92;
    l_str('OCT-DEC') := 93;
    l_idx := l_str.FIRST;
    
    while(l_idx is not null)
    loop
    dbms_output.put_line('Value at ' || l_idx || ' is ' || l_str(l_idx));
        l_idx := l_str.NEXT(l_idx);
    end loop;
end;
/
    
------------------------------------------
declare
    l_str varchar2(20);
begin
    l_str := dbms_random.string('x', 10);
    dbms_output.put_line(l_str);
end;
/
-----------------------------------------------------------------
--dynamic pl/sql 
set serveroutput on;

declare
    lv_sql varchar2(500);
    lv_emp_name varchar2(50);
    ln_emp_no number;
    ln_salary number;
    ln_manager number;
begin
    lv_sql := 'select ename, empno, sal, mgr from emp where empno = :empno';
    execute immediate lv_sql into lv_emp_name, ln_emp_no, ln_salary, ln_manager using 7788;
    dbms_output.put_line(lv_emp_name || ln_emp_no || ln_salary || ln_manager );
end;
/
------------------------------------









