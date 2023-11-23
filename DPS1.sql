set serveroutput on ;
set verify off;
declare
    i number(4) := 1;
begin
    loop
        if i > 10 then 
            exit;
        end if ;
        dbms_output.put_line('welcome');
        i := i +1;
    end loop;
end;
/

declare
    i number(4) := 1;
begin
    loop
      exit when i>10;
        dbms_output.put_line('welcome');
        i := i +1;
    end loop;
end;
/

declare
    i number(4) := 1;
begin
    while ( i < 10 )
    loop
        dbms_output.put_line('welcome');
        i := i +1;
    end loop;
end;
/

--factorial of a number
declare
     num number := &num;
    fact number := 1;  
begin
    while (num > 0)
    loop
        fact := fact * num;
        num := num -1;
    end loop;
    dbms_output.put_line(fact);
end;
/

--write a pl/sql block to input a string and display with vertical order
declare 
    str varchar2(20) := '&str';
    n number :=1;
    
begin
    while ( n <= length(str) )
    loop
        dbms_output.put_line(substr(str, n, 1));
        n := n+1;
    end loop;
end;
/

declare 
    str varchar2(20) := '&str';
    n number(2) := 1;

begin

    while(n <= length(str))
    loop
    dbms_output.put_line( substr(str, 1, n));
    n := n+1;
    end loop;
end;
/
    
--write a pl/sql block to display 10 to 1 number using for loop

declare 
    n number(2) := 10;
    i number(2) :=1;

begin
    for i in reverse 1..n
    loop 
        dbms_output.put_line(i);
        dbms_output.new_line();
    end loop;
    
end;
/

--write a pl/sql block to find given no. is even or odd 

declare
    n number(4) := &n;

begin
    if mod(n,2) = 0 then
        goto even;
    else
        goto odd;
    end if;
    
    <<even>>
        dbms_output.put_line('Given number is even');
        goto endl;
        
    <<odd>> 
        dbms_output.put_line('Given number is odd');
        goto endl;
    
    <<endl>>
        dbms_output.put_line('End of program');
end;
/

declare 
    v_ename emp.ename%type;
    c number;
begin
    select count(*) into c from emp;
    select ename into v_ename from emp;
    for i in 1..c
    loop
        dbms_output.put_line( v_ename );
    end loop;
    
end;
/


---cursors

--write a pl/sql block to 
--demonstrate cursor operations and attributes

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
    elsif mycur%notfound then
        dbms_output.put_line('cursor doesnot contain data');
    end if;
    close my_cur;
end;
/

--anonymous block

declare 
    v_ename emp.ename%type;
    cursor my_cur is select ename from emp;
    c number;
begin
    open my_cur;
    select count(*) into  c from emp;
    for i in 1..c
    loop
        fetch my_cur into v_ename;
        dbms_output.put_line( v_ename );
        dbms_output.put_line( my_cur%rowcount );
        
    end loop;
    close my_cur;
end;
/



















