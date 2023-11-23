set serveroutput on;
declare
    cursor my_cur is select ename from emp;
    v_ename emp.ename%type;
    
begin
    open my_cur;
    if my_cur%isopen then 
        dbms_output.put_line('cursor is open');
    end if;
    fetch my_cur into v_ename;
    if my_cur%found then
        dbms_output.put_line('cursor contains data');
    elsif my_cur%notfound then
        dbms_output.put_line('cursor doesnot contain data');
    end if;
    
    close my_cur;
    if my_cur%isopen = false then
        dbms_output.put_line('cursor is closed');
    end if;

end;
/

--write a pl/sql block to display all employee names

declare 
    cursor my_cur is select ename from emp;
    v_ename emp.ename%type;
    
begin
    open my_cur;
    if my_cur%isopen then 
        dbms_output.put_line('cursor opened successfully');
    end if;
    
    loop
    fetch my_cur into v_ename;
    exit when my_cur%notfound;
    dbms_output.put_line(v_ename);
    end loop;
    
    close my_cur;
end;
/