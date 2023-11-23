--dynamic pl/sql 
SET SERVEROUTPUT ON;

DECLARE
    lv_sql        VARCHAR2(500);
    lv_emp_name   VARCHAR2(50);
    ln_emp_no     NUMBER;
    ln_salary     NUMBER;
    ln_manager    NUMBER;
BEGIN
    lv_sql := 'select ename, empno, sal, mgr from emp where empno = :empno';
    EXECUTE IMMEDIATE lv_sql
    INTO
        lv_emp_name,
        ln_emp_no,
        ln_salary,
        ln_manager
        USING 7788;
    dbms_output.put_line(lv_emp_name
                           || ln_emp_no
                           || ln_salary
                           || ln_manager);
END;
/
------------------------------------
--dynamic pl/sql block is an anonymous pl/sql block that invokes a sub

CREATE SEQUENCE dept_seq INCREMENT BY 10 START WITH 50;

SELECT
    dept_seq.NEXTVAL
FROM
    dual;

CREATE OR REPLACE PROCEDURE create_dept (
    deptno IN OUT NUMBER,
    dname   IN VARCHAR2,
    loc     IN VARCHAR2
) IS
BEGIN
    deptno := dept_seq.nextval;
    INSERT INTO dept VALUES (
        deptno,
        dname,
        loc
    );

    dbms_output.put_line('Department created successfully');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END create_dept;
/

DECLARE
    new_deptno    NUMBER(4);
    new_dname     VARCHAR2(20) := 'ADVERTISING';
    plsql_block   VARCHAR2(300);
    new_loc       VARCHAR2(10) := 'PARIS';
BEGIN
    plsql_block := 'begin create_dept(:deptno, :dname, :loc); end;';
    EXECUTE IMMEDIATE plsql_block
        USING IN OUT new_deptno,new_dname,new_loc;
END;
/
----------------------------------------------------------------
--better understading of in out paramter
create or replace procedure learning_param(
    param1 in number,
    param2 in number,
    param3 in out number,
    param4 out number
    )
is 
l_res number(5);
begin
    param3 := 45;
    param4 := param1 + param2;
    
    dbms_output.put_line('Executing...');
end;
/

declare
    num1 number(4) := 23;
    num2 number(4) := 37;
    num3 number(4);
    num4 number(4);
begin
    learning_param(num1, num2, num3, num4);
    dbms_output.put_line(num1);
    dbms_output.put_line(num2);
    dbms_output.put_line(num3);
    dbms_output.put_line(num4);
end;
/
--expected output: 23, 37, 45, 60

----------------------
declare
    sql_stmt varchar2(100);
    deptno number(3) := 80;
    dname varchar2(20) := 'HR';
    loc varchar2(20) := 'DUBAI';
begin
    sql_stmt := 'insert into dept values(:a, :b, :c)';
    execute immediate sql_stmt using deptno, dname, loc;
    
end;
/
-----------------------------------------------------------------------------
--dbms_sql package
create or replace procedure p as
    c1 sys_refcursor;
    c2 sys_refcursor;
    ename emp_srk.ename%type;
    job emp_srk.job%type;
begin
    open c1 for 
        select ename, job 
        from emp_srk
        where empno = 7788;
        
        fetch c1 into ename, job;
        dbms_output.put_line(ename || job);
        
        dbms_sql.return_result(c1);
            
end;
/

begin
    p;
end;
/

-----------------------------------------------------------------

declare
    lv_sql varchar2(500);
    lv_ename varchar2(50);
    ln_empno number;
    ln_salary number;
    ln_manager number;
    ln_cursor_id number;
    ln_rows_processed number;
begin
    lv_sql := 'select ename, empno, sal, mgr from emp_srk where empno = :empno';
    ln_cursor_id  := dbms_sql.open_cursor;
    
    dbms_sql.parse(ln_cursor_id, lv_sql, dbms_sql.native);
    
    dbms_sql.bind_variable(ln_cursor_id, :empno, 7788);
    
    dbms_sql.define_column(ln_cursor_id, 1, lv_ename);
    dbms_sql.define_column(ln_cursor_id, 2, ln_empno);
    dbms_sql.define_column(ln_cursor_id, 3, ln_salary);
    dbms_sql.define_column(ln_cursor_id, 4, ln_manager);
    
    ln_rows_processed := dbms_sql.execute(ln_cursor_id);
    
    
end;
/




















