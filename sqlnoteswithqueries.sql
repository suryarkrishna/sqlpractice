--                                                    SQL NOTES


Create user c##Rakesh Identified by "_Aa1rakesh1aA_";
Grant Connect, Resource to c##Rakesh;

create table example1(
id int,lname varchar(255),fname varchar(255)
);

insert into example1(id,lname,fname)
values(1,'n','rakesh');

create table stud_db(id varchar2(10),student_name varchar2(20),class varchar2(5),mobileno number(10)); --table renamed to studdb
desc stud_db
insert into stud_db values('1','abc','10','1234567890');
insert into stud_db values(&id,&student_name,&class,&mobileno);
select * from stud_db;
select std_name from stud_db;
update stud_db set std_id = std_id - 1;
update stud_db set std_name = 'sairakesh' where std_id=1;
delete from stud_db where std_id=22;


-- DEMO BLD DEMO DUMMY TABLES 


SET TERMOUT ON
PROMPT Building demonstration TABLES.  Please wait.
SET TERMOUT OFF
 
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE BONUS;
DROP TABLE SALGRADE;
DROP TABLE DUMMY;
 
CREATE TABLE EMP
       (EMPNO NUMBER(4) NOT NULL,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        HIREDATE DATE,
        SAL NUMBER(7, 2),
        COMM NUMBER(7, 2),
        DEPTNO NUMBER(2));
 
INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        TO_DATE('17-DEC-1980', 'DD-MON-YYYY'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        TO_DATE('20-FEB-1981', 'DD-MON-YYYY'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        TO_DATE('22-FEB-1981', 'DD-MON-YYYY'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        TO_DATE('2-APR-1981', 'DD-MON-YYYY'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        TO_DATE('28-SEP-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        TO_DATE('1-MAY-1981', 'DD-MON-YYYY'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        TO_DATE('9-JUN-1981', 'DD-MON-YYYY'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('09-DEC-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        TO_DATE('8-SEP-1981', 'DD-MON-YYYY'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('12-JAN-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        TO_DATE('3-DEC-1981', 'DD-MON-YYYY'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        TO_DATE('3-DEC-1981', 'DD-MON-YYYY'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);
 INSERT INTO EMP VALUES
        (0001, 'RAKESH', 'MANAGER',  7698,
        TO_DATE('28-SEP-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
 
CREATE TABLE DEPT
       (DEPTNO NUMBER(2),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );
 
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');
 
CREATE TABLE BONUS
        (ENAME VARCHAR2(10),
         JOB   VARCHAR2(9),
         SAL   NUMBER,
         COMM  NUMBER);
 
CREATE TABLE SALGRADE
        (GRADE NUMBER,
         LOSAL NUMBER,
         HISAL NUMBER);
 
INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);
 
CREATE TABLE DUMMY
        (DUMMY NUMBER);
 
INSERT INTO DUMMY VALUES (0);
 
COMMIT;
 
SET TERMOUT ON



--Arthimetic Operators
---WAQ TO DISPLAY WHO ARE BELONGS TO 10TH DEPARTMENT
select * from EMP where deptno=10;
--WAQ TO DISPLAY WHOSE SALARY IS MORE THAN 2000
select * from EMP where sal>2000;
--WAQ TO DISPLAY WHO ARE HIRED ATER 81 YEAR
select * from emp where hiredate> '31-12-81';
--WAQ TO DISPLAY EMPLOYEE NAME WHOSE ID IS 7369
select ename from emp where empno=7369;
--WAQ TO DISPLAY WHOSE mgr IS 7902
select * from emp where mgr=7902;

--Logical Operators

--WAQ TO DISPLAY THE MANAGERS BELONGS TO 30TH DEPT
select * from emp where deptno=30 AND job='MANAGER';
--WAQ TO DISPLAY WHO ARE BELONGS TO 10 AND 20 DEPT
select * from emp where deptno=10 or deptno=20;
--WAQ TO DISPLAY WHOSE SALRY IS MORE THAN 2500 IN DEPT 20
select * from emp where sal>2500 and deptno=20;
--WAQ TO DISPLAY THW CLERKS FROM 10 AND 20 DEPTS
select * from emp where (deptno=10 or deptno=20) and job='CLERK'
--WAQ TO DISPLAY WHO JOINED AFTER 81 YEAR AND BELONGS TO DEPT 30
select * from emp where hiredate>'31-12-81' and deptno=30;

--Not equals to operator
select * from emp where deptno!=20;

--Special Operators
--These are used to improve the performance while retriving or manipulating the data
--By using these special operators to reduce the conditions in where clause


--IN is a type of special operator
--This Operator used to compress given fixed list of values
--It supports all data types
--example:- waq to display the details of employes containing ids 7788,7839,7369
select * from emp where empno in (7788,7839,7369);

--NOT IN
--It is used to compare other than given list of values
--example:- waq to display whose names are not matched with smith allen and ford
select * from emp where ename not in ('SMITH','ALLEN','FORD');

--BETWEEN
--USED TO COMPARE THE DATA WITHIN THE GIVEN RANGE
--IT SUPPORTS ALL DATA TYPES
--NOTE LOWER BOUND VALUE SHOULD BE LESS THAN UPPER BOUND VALUE
--NOTE BETWEEN OPERATOR INCLUDES LOWER AND UPPER BOUND VALUES
--EXAMPLE:- WAQ TO DISPLAY WHO ARE GETTING SALARIES 1000 TO 4000
select * from emp where sal between 1000 and 4000;
select * from emp where deptno between 10 and 30;  --It includes who are working in dept 10 and 30 also

--NOT BETWEEN
--THIS OPERATOR USED TO COMPARE OTHER THAN GIVEN RANGE
--IT SUPPORTS ALL DATA TYPES
--NOTE THIS OPERATOR EXCLUDES LOWER AND UPPER BOUNDS
--EXAMPLE:- WAQ TO DISPLAY WHO ARE NOT JOINED IN 1981 YEAR
select * from emp where hiredate not between '01-01-81' and '31-12-81';
select * from emp where deptno not between 10 and 30;  --It excludes who are working in 10 and 30 depts also

--LIKE OPERATOR
--THIS OPERATOR USED TO COMPARE THE DATA BASED ON GIVEN PATTERN
--IT SUPPORTS ONLY CHAR VALUES
--IT HAS TWO WILD CHARACTERS 
--      (i) % (any characters)
--      (ii) _ (on or more occurunces)
--EXAMPLE:- WAQ TO DISPLAY WHOSE NAME STARTS WITH S CHAR
select * from emp where ename like 'S%';
--Example:- WAQ TO DISPLAY EHOSE NAME ENDS WITH S CHAR
select * from emp where ename like '%S';
--EXAMPLE:- WAQ TO DISPLAY WHOSE NAMES SECOND CHAR IS 'D'
select * from emp where ename like '_D%';
--Example:- WAQ T DISPLAY WHOSE NAMES HAVING LL CHARS
select * from emp where ename like '%LL%';
--EXAMPLE WAQ TO DISPLAY WHOSE NAMES HAVING TWO A's
select * from emp where ename like '%A%A%';
--Example WAQ TO DISPLAY WHO ARE JOINED ON 81 YEAR
select * from emp where hiredate like '%81';
--WAQ TO DISPLAY WHSOE NAMES HAVING 5 CHARS
select * from emp where ename like '_____';


--NOT LIKE OPERATOR
--OPPOSITE OF LIKE OPERSTOR
--EXAMPLE:- WAQ TO DISPLAY WHO ARE NOT JOINED ON 81 YEAR
select * from emp where hiredate not like '%81';


--IS NULL OPERATOR
--USED TO COMPARE NULLs
--IT SUPPORTS ALL DATA TYPES
--EXAMPLE:- WAQ TO DISPLAY WHO ARE NOT GETTING COMMISION
select * from emp where comm is null;
--EXAMPLE WAQ TO DISPLAY name WHICH EMPLOYEE HAS NO BOSS
select ename from emp where mgr is null;



--IS NOT NULL
--EXAMPLE: WAQ TO DISPLAY WHO ARE GETTING COMMISSION
select * from emp where comm is not null;


--WHAT IS NULL???
--NULL IS UNCOMPARABLE AND UNDEFINED VALUE
--IT IS NOT EQUAL TO 0 AND SPACE
--IT OCCUPIES 0 BYTES MEMORY
--IT IS COMMON FOR ANY RELATIONAL DATABASE


--DDL COMMANDS
--        (i)Create
--        (ii)Alter
--        (iii)Rename
--        (iv)truncate
--        (v)drop

-- (ii) Alter:-
--THIS COMMAND USED TO MODIFY THE STRUCTURE OF THE TABLE
--IT WORKS ON COLUMNS STRUCTURE ONLY
--IT HAS 4 OPTIONS
--        (i)Add  (ii)Modify  (iii)rename (iv)drop



--ALTER ADD
--  THIS OPTION USED TO ADD NEW COLUMN/COLUMNS INTO EXISTING
--EXAMPLE: WAQ TO ADD MARKS, REMARKS, PERCENTAGE COLUMNS TO STUD_DB
--SYNTAX:   ALTER TABLE <TABLENAME> ADD(<NEWCOLUMN1 NAME> NEW COLUMN 1 DATATYPE, <NEWCOLUMN2 NAME> NEW COLUMN 2 DATATYPE,...);
Alter table stud_db add(marks number(3),remarks varchar(20),percentage number(3));
select * from stud_db; --Added Columns successfully

--ALTER MODIFY
--USED TO INCREASE/DECREASE SIZE OF COLUMN
--AND ALSO USED TO CHANGE THE DATATYPE
--SYNTAX:   ALTER TABLE <TABLENAME> MODIFY <COLUMNNAME> <NEW DATATYPE SIZE>
--EXAMPLE TO INCREASE STD_ID COLUMN SIZE
Alter table stud_db modify std_id varchar2(4);


--ALTER RENAME
--USED TO RENAME A COULMN
--SYNTAXX:  ALTER TABLE <TABLENAME> RENAME COLUMN <COLUMN_NAME> TO <NEW COLUMN NAME>
--EXAMPLE: TO RENAME COLUMN NAME FROM MARKS TO TOTAL_MARKS
alter table stud_db rename column marks to total_marks;


--ALTER DROP
--USED TO DROP A SINGLE/GROUP OF COLUMNS
--SYNTAX:   ALTER TABLE <TABLENAME> DROP COLUMN <COLUMNNAME>; (to drop single column)
--          ALTER TABLE <TABLENAME> DROP(COL1,COL2,....,COLN); (to drop multiple columns)
--EXAMPLE: TO DROP REMARKS COLUMN FROM STUD_DB
alter table stud_db drop column remarks; --To drop single column 
alter table stud_db drop(percentage,total_marks); --To drop multiple columns, column keyword not required


--DDL RENAME
--TO RENAME A TABLE PERMANANTLY
--SYNTAX: RENAME <OLDTABLENAME> TO <NEWTABLENAME>;
--EX: RENAME STUD_DB TO STUDDB
RENAME stud_db to studdb;


--DDL TRUNCATE
--USED TO DELETE ALL RECORDS FROM THE TABLE PERMANANTLY
--TABLE WILL NOT BE DELETED ONLY THE DATA WILL DELETED
--ROLLBACK(UNDO) NOT SUPPORTED
--SYNTAX: TRUNCATE TABLE <TABLENAME>;


--DDL DROP
--THIS COMMAND USED TO DELETE ALL THE RECORDS AND TABLE PERMANANTLY
--TABLE ALSO DELETED
--ROLLBACK NOT SUPPORTED
--SYNTAX: DROP TABLE <TABLENAME>;


-- **************************************************************


--RECYCLEBIN
--IT IS ONE OF THE ORACLE PRE DEFINED TABLE AND IT HOLDS ALL THE DROPPED TABLE NAMES
--TO SEE THE DROPPED TABLES
--        SELECT Original_Name from Recyclebin;



--FLASHBACK COMMAND:
--THIS COMMAND IS USED TO RESTORE DROPPED TABLES FROM RECYCLE BIN TO ORIGINAL DB
--SYNTAX:   FLASHBACK TABLE <TABLENAME> TO BEFORE DROP;


--PURGE COMMAND:
--THIS COMMAND DROP THE TABLE WITHOUT STORING IN RECYCLE BIN.
--SYNTAX:     DROP TABLE <TABLENAME> PURGE;

--UNDERSTAND THE DIFFERENCES BETWEEN DELETE, TRUNCATE AND DROP


--PREDEFINED FUNCTIONS
--NUMERIC FUNCTIONS
--    ABS GIVES POSITIVE NUMBER OF GIVEN NEGATIVE NUMBER ABS(-100)=100
--    POWER(a,b) => a^b
--    sqrt(num) gives the square root value of givne number
--    MOD(a,b) returns reminder after the division a/b
--    SIGN(num) IF NUM IS +VE IT RETURNS 1, -VE RETURNS -1, 0 RETURNS 0
--    SIN(X)RETURNS SIN VALUE FOR X DEGREES
--    COS(X)RETURNS COS VALUE FOR X DEGREES
--    TAN(X)RETURNS TAN VALUE FOR X DEGREES
--EXAMPLE: select sin(90) from dual
--  ROUND USED TO ROUNDED THE NUMBER TO NEAREST VALUE





--*********FUNCTIONS CAN BE USED BY SELECT COMMAND
--WE ARE HAVING A PREDEFINED TABLE CALLED DUAL WHICH HAVE 1 ROW
--SO THE OUTPUT WILL BE DISPLAYED 1 TIME ONLY
--OR WE CAN CREATE ANY TABLE WITH 1 ROW AND WE CAN USE IT INSTEAD OF DUAL
--EXAMPLE: ROUND(15.67) = 16
select * from dual; --TO CHECK WHAT IN DUAL TABLE
select abs(-100) from dual;
select mod(10,6) from dual;
select SIGN(12) from dual;
select power(2,4) from dual;
select sqrt(100) from dual;
select round(15.67) from dual;
select trunc(15.67) from dual;
--EXAMPLE: WAQ TO DISPLAY EACH EMPLOYEE DAILY WAGES
select empno,ename,job, round(sal/30) from emp;



--CHARACTER FUNCTIONS:
--    SUPPORTS FOR ONLY CHARACTERS
--lower():
--    IT CONVERTS ANY FORMATED STRING TO LOWER CASE
select lower('RAKESH') FROM DUAL;
--upper():
--    Converts to upper case
SELECT UPPER('rakesh') from dual;
--INITCAP():
SELECT INITCAP('sai rakesh') from dual; --O/P is Sai Rakesh
--LENGTH():
--  RETURNS LENGTH OF STRING
select ename, lower(ename),upper(ename),initcap(ename),length(ename) from emp;
--ASCII():
--    IT CONVERTS CHAR VALUE TO EQUIVALENT ASCII CODE
select ascii('A') from dual;
--CHR():
--    CONVERTS ASCII CODE TO EQUIVALENT CHAR VALUE
select chr(65) from dual;
--CONCAT():
--    USED TO ADD TWO STRINGS
select concat('sai','rak') from dual;
--    TO ADD MORE THAN 2STRINGS NEED TO USE NESTED FUNCTIONS
--EXAMPLE
select concat(concat('sai','rakesh '),'nakirikanti') from dual;

--TO CONCATE MULTIPLE STRINGS CONTINUOUSLY ORACLE PROVIDE CONCATENATION OPERATOR( || )
select 'Mr.'||'Sai'||'Rakesh '||'Nakirikanti' from dual;
select 'Mr.'||ename||' is working as '||job||' and getting annual salary of Rs.'||(sal*12) from emp;
--WAQ TO DISPLAY '()' FOR THE NEGATIVE VALUE IN THE TABLE
    CREATE TABLE NEGATIVE(VALUE NUMBER(3));
    SELECT * FROM NEGATIVE;
    SELECT '('||VALUE||')' AS VALUE FROM NEGATIVE WHERE SIGN(VALUE)=-1
    UNION SELECT ''||VALUE FROM NEGATIVE WHERE SIGN(VALUE)=1;

--LPAD():
--THIS FUNCTION DISPLAYS PADDINGS ON LEFT SIDE
--IF NO CHARACTER IS GIVEN IT DISPLAYS SPACE
--SYNTAX:  SELECT LPAD(STRING,SIZE,SPECIAL CHARACTER) FROM TABLE NAME
--IF NO SPECIAL CHARACTER IS GIVEN IT AUTOMATICALLY ALLOCATES WHITE SPACES
--EXAMPLE: 
SELECT LPAD('RAKESH',10) FROM DUAL;  --O/P     RAKESH 4SPACES BEFORE RAKESH
SELECT LPAD('RAKESH',10,'*') FROM DUAL;  --O/P ****RAKESH


--RPAD():
--DISPLAY PADDINGS ON RIGHT SIDE 
--SYNTAX SAME AS LPAD
--EXAMPLE
SELECT RPAD('RAKESH',10,'@') FROM DUAL;  --O/P:RAKESH@@@@


--LTRIM():
--USED TO DELETE LEFT SIDE SPECIFIC MATCHING CHARACTERS
--SYNTAX: select ltrim('string','word need to get trimmed') from table;
--EXAMPLE
select ltrim('SAI RAKESH NAKIRIKANTI','SAI ') from dual;

--RTRIM():
--USED TO TRIM RIGHSIDE SPECIFIED MATCHING CHARACTERS
--EXAMPLE
    select rtrim('sairrrr','r') from dual; --O/P sai
    
--TRIM():
--USED TO DELETE BOTHSIDES MATCHING CHARACTERS
--NOTE BY DEFAULT ALL TRIM FUNCTIONS DELETES SPACES
--EXAMPLE:
select trim('a' from 'aaaaasaiaaaaa') from dual; --O/P sai
SELECT TRIM('   RAKESH   ') FROM DUAL;

--EXAMPLE: WAQ TO DISPLAY MIDDLE FROM GIVEN NAME sai rakesh nakirikanti
select trim(rtrim(ltrim('sai rakesh nakirikanti','sai'),'nakirikanti')) from dual; --O/P rakesh


--REPLACE():
--IT REPLACES WORD BY WORD
--EXAMPLE
--SYNTAX:   SELECT REPLACE(FULLWORD, WORD TO REPLACE, NEW WORD) FROM <TABLENAME>;
select replace('axis bank','axis','hdfc') from dual;


--TRANSLATE():
--TRANSLATES CHARACTER BY CHARACTER
select translate('abcvefv','v','d') from dual;  --O/P abcdefd


--SUBSTR():
--DISPLAYS SUBSTRING FROM GIVEN STRING
--COUNT STARTING FROM 1
--EXAMPLE
select substr('sai rakesh',5) from dual; --here 5 is starting posistion
select substr('sai rakesh',5,4) from dual; --here 5 is starting posistion and 4 is number of chars from starting posistion
--EXAMPLE:
select * from emp where substr(job,4,3)='AGE';
select 'Mr.'||ename||' is a '||substr(job,1,3)||' eater.' from emp where substr(job,4,3)='AGE';
--WAQ TO DISPLAY WHICH EMPLOYEE NAME STARTING AND ENDING CHARACTERS ARE SAME
--IN OUR DATA THERE IS NO SUCH TYPE OF NAME SO WE UPDATE THE NAMES FIRST
update emp set ename='HEMANTH' where empno=7902;
update emp set ename='ARUNA' where empno=1;
--EMPLOYEE NAMES UPDATED SUCCESSFULLY
--WAQ TO DISPLAY WHICH EMPLOYEE NAME STARTING AND ENDING CHARACTERS ARE SAME
select ename from emp where substr(ename,1,1)=substr(ename,-1,1);


--INSTR():
--RETURNS SEARCHING STRING POSISTION
--EX:
select instr('oracle corporation','or',3,2) from dual;
--or is searching string 
--3 searching start from 3rd posistion onwards
--2 searching for 2nd occurance of the word, means it dont care of 1st occurance
--returns the count from left to right
--IF NOTHING SPECIFIED AFTER THE SEARCHING STRING BY DEFAULT IT TAKES 1,1


--EXAMPLE: WAQ TO DISPLAY WHICH EMPLOYEES NAME CONTAINS 'A' CHARACTER 2TIMES
select ename from emp where instr(ename,'A',1,2)>0;

--EXAMPLE: WAQ TO DISPLAY AREA NAME FROM ADDRESS
select * from example1;
update example1 set addr='hitech hyd' where addr is null;
insert into example1 values(2,'m','sfdgc','kphb hyd');
insert into example1 values(3,'sa','jjvhgm','madhapur hyd');
select substr(addr,1, instr(addr,' ',1,1)-1)AS AREA from example1;


--WAQ TO DISPLAY ONLY CITI NAMES FROM ADDRESS
select substr(addr,instr(addr,' ',1,1)+1)AS CITY from example1;



--***DATE FUNCTIONS:
--SUPPORTS ONLY DATE VALUES

--SYSDATE
--    RETURNS CURRENT SERVER DATE
SELECT SYSDATE FROM DUAL;   --O/P 23-08-23

--MONTHS_BETWEEN()
--    RETURNS MONTHS BETWEEN TWO GIVEN DATES
    SELECT MONTHS_BETWEEN(SYSDATE, '01-01-23') FROM DUAL;
--CALCULATE AGE IN YEARS AND MONTHS
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,'30-11-2001')/12) AS YEARS, TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,'30-11-2001'),12)) AS MONTHS FROM DUAL;

        

--ADD_MONTHS()
--USED TO ADD MONTHS TO GIVEN DATE
--IT ACCEPTS + OR -
--EX:
SELECT ADD_MONTHS(SYSDATE,2) FROM DUAL;   --O/P: 23-10-23
SELECT ADD_MONTHS(SYSDATE,-2) FROM DUAL;  --O/P: 23-06-23


--NEXT_DAY()
--RETURNS COMING WEEK OF THE DATE
SELECT NEXT_DAY(SYSDATE,'SAT') FROM DUAL; --GIVES THE DATE OF UPCOMING SATURDAY
--NOTE BY DEFAULT ORACLE TAKES SUN=1 MON=2......SAT=7
--WE CAN PASS SAT OR WE CAN PASS 7


--LAST_DAY()
--    RETURNS LAST DATE OF THE MONTH
SELECT LAST_DAY(SYSDATE) FROM DUAL;     --31-08-23


--WAQ TO DISPLAY NEXTMONTH FIRST DATE
SELECT LAST_DAY(SYSDATE)+1 FROM DUAL;   --01-09-23

--WAQ TO DISPLAY CURRENT MONTH FIRSTDATE
SELECT ADD_MONTHS(LAST_DAY(SYSDATE),-1)+1 FROM DUAL;

--WAQ TO DISPLAY CURRENT MONTH 2ND AND 4TH SATURDAY DATES
SELECT NEXT_DAY(ADD_MONTHS(LAST_DAY(SYSDATE),-1)+7,'SAT') FROM DUAL; --2ND SATURDAY
SELECT NEXT_DAY(ADD_MONTHS(LAST_DAY(SYSDATE),-1)+21,'SAT') FROM DUAL; --4TH SATURDAY

--WAQ TO DISPLAY EACH EMPLOYEE EXPERIENCE IN YEARS
SELECT ENAME,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) FROM EMP;

--WAQ TO DISPLAY EACH EMPLOYEE HOW MUCH THEY EARNED UPTO LAST MONTH
SELECT ENAME, ROUND(SAL*(MONTHS_BETWEEN(SYSDATE,HIREDATE))) FROM EMP;

--ROUND AND TRUNC ON DATE:
    SELECT TRUNC(SYSDATE,'MM') FROM DUAL; --RETURNS FIRST DAY OF THE MONTH
    SELECT TRUNC(SYSDATE,'YY') FROM DUAL; --RETURNS FIRST DAY OF THE YEAR
    SELECT TRUNC(SYSDATE,'RR') FROM DUAL; --RETURNS FIRST DAY OF THE YEAR
    SELECT TRUNC(SYSDATE,'Q') FROM DUAL;  --RETURNS FIRST DAY OF THE QUARTER
    
    SELECT ROUND(SYSDATE,'MM') FROM DUAL; --ROUNDED TO NEAREST FIRST DAY OF THIS OR NEXT MONTH
    SELECT ROUND(SYSDATE,'YY') FROM DUAL; --ROUNDED TO NEAREST FIRST DAY OF THIS OR NEXT YEAR
    SELECT ROUND(SYSDATE,'RR') FROM DUAL; --ROUNDED TO NEAREST FIRST DAY OF THIS OR NEXT YEAR
    SELECT ROUND(SYSDATE,'Q') FROM DUAL;  --ROUNDED TO NEAREST FIRST DAY OF THIS OR NEXT QUARTER


--GROUP FUNCTIONS
--    GROUP FUNCTIONS CAN COMPARE MULTIPLE VALUES AND RETURNS SINGLE VALUE OUTPUT
--    ALSO CALLED AS AGGREGATE/MULTIROW FUNCTIONS
--    ALL GROUP FUNCTIONS ACCEPTS ONLY SINGLE ARGUMENT

--MIN()
--    RETURNS MINIMUM VALUE
SELECT MIN(SAL) FROM EMP;

--MAX()
--    RETURNS MAXIMUM VALUE
SELECT MAX(SAL) FROM EMP;

--SUM()
--RETURNS SUM OF A COLUMN
SELECT SUM(SAL) FROM EMP;

--AVG()
SELECT AVG(SAL) FROM EMP;

--COUNT()
--    RETURNS COUNT NO.OF VALUES/RECORDS
SELECT COUNT(COMM) FROM EMP; --O/P: 5 BECAUSE ONLY 5 ARE GETTING COMMISSION
--NOTE TO PASS ARGUMENT AS A COLUMN NAME THEN COUNT IGNORE NULLS
--TO COUNT NO.OF RECORDS IN A TABLE USE
SELECT COUNT(*) FROM EMP; --RETURNS TOTAL NUMBER OS ROWS
--VARIANCE():
  SELECT VARIANCE(SAL) FROM EMP;
  
--NOTE
    SELECT MAX(100,200) FROM DUAL; --ERROR ALL GROUP FUNCTION ACCEPTS SINGLE ARGUMENT ONLY


--CONVERSION FUNCTIONS
--THESE FUNCTIONS CAN CONVERT ONE DATA TYPE TO ANOTHER DATA TYPE TEMPORARILY
--THERE ARE 3 TYPES OF CONVERSION FUNCTIONS
--    to_char()
--    to_date()
--    to_number()

--to_char():
--    This function used to convert date/number into char format temporarily
--    syntax:  to_char(date/number, 'format');
--    SOME FORMATS ARE
--        'd' -> returns day of the week
               select to_char(sysdate,'d') from dual;
--        'dd'-> returns day of the month
               select to_char(sysdate,'dd') from dual;
--        'ddd'-> day of the year
               select to_char(sysdate,'ddd') from dual;
--        'dy'->returns first 3 characters of the day
                select to_char(sysdate,'dy') from dual;
--        'day'->fullname of the day
                select to_char(sysdate,'day') from dual;
--        'w'-> week of the month
                select to_char(sysdate,'w') from dual;
--        'ww'-> week of the year
                select to_char(sysdate,'ww') from dual;
--        'mm'-> month in numeric
                select to_char(sysdate,'mm') from dual;
--        'mon'->first three chars of the month
                select to_char(sysdate,'mon') from dual;
--        'month'->returns fullform of the month
                select to_char(sysdate,'month') from dual;
--        'y'->returns last digit of year
--        'yy'->returns last 2 digits
--        'yyy'->returns last 3 digits
--        'yyyy'->returns year in numberic
          select to_char(sysdate,'y-yy-yyy-yyyy') from dual;
--        'year'->year in character format
          select to_char(sysdate,'year') from dual;
--        'hh12:mi:ss a.m.'  -> returns 12hours time
           select to_char(sysdate,'hh12:mi:ss a.m.') from dual;
--        'hh24:mi:ss a.m.'  -> returns 12hours time
           select to_char(sysdate,'hh24:mi:ss') from dual;
--         'q'->returns quarter of the year
--        'cc'->returns current century
--        'ddth'->returns day of the month in following formats
--        ex: 1st, 2nd, 3rd, 4th, etc......
            select to_char(sysdate,'ddth') from dual;
--        'ddsp'->day of the month in spelled format
            select to_char(sysdate,'ddsp') from dual;

--WAQ TO DISPLAY WHO ARE JOINED IN 81YEAR
Select * from emp where to_char(hiredate,'yy')=81;

--WAQ TO DISPLAY WHO ARE JOINED ON JAN
select * from emp where to_char(hiredate,'mm')=01;

--WAQ TO DISPLAY WHO ARE JOINED ON FIRST QUARTER OF THE YEAR
select * from emp where to_char(hiredate,'q')=01;
--WAQ TO DISPLAY WHO ARE JOINED FIRST 6TH MONTHS
select * from emp where to_char(hiredate,'mm') between 1 and 6;
--WAQ TO DISPLAY EACH EMPLOYEE SYSTEM DATE IN FOLLOWING FORMAT
    --18/11/21
    --18TH NOV 2021
    select to_char(sysdate, 'dd/mm/yy') from dual;
    select to_char(sysdate, 'ddth mon yyyy') from dual;
--WAQ TO DISPLAY EACH EMPLOYEE DATE OF JOINING IN FOLLOWING FORMAT
    --18/11/21
    --18TH NOV 2021
    select empno,ename,sal,to_char(hiredate, 'dd/mm/yy'),deptno from emp;
    select empno,ename,sal,to_char(hiredate, 'ddth mon yyyy'),deptno from emp;
    
--WAQ TO DISPLAY WHO ARE JOINED ON LAST MONTH
    select * from emp where to_char(hiredate,'mm-yyyy')=to_char(add_months(sysdate,-1),'mm-yyyy');
    
--WAQ TO DISPLAY WHO ARE JOINED CURRENT MONTH TILL DATE
    select * from emp where to_char(hiredate,'mm-yyyy')=to_char(sysdate,'mm-yyyy');


--TO CONVERT NUMBER TO CHARACTER FORMATS
--TO_CHAR ALSO CONVERTS NUMBER TO CHAR FORMAT TEMPORARILY
--WAQ TO DISPLAY EMPLOYEE SALARIES IN THE FOLLOWING FORMAT
--    5,000.00
        select empno,ename,sal,to_char(sal,'9,999.99'),deptno from emp;
--    we can also write as
        select empno,ename,sal,to_char(sal,'9G999D99'),deptno from emp;

--NUMBER FORMATS:
--'L' -> RETURNS LOCAL CURRENCY SYMBOL BY DEFAULT IT SHOWS $
--'C' -> RETURNS LOCAL CURRENCY NAME
--'S' -> RETURNS SIGN SYMBOL IF POSITIVE + NEGATIVE -

--TO CHANGE CURRENCY FROM ONE COUNTRY TO ANOTHER TEMPORARILY
  ALTER SESSION SET NLS_TERRITORY='INDIA';  --NLS MEANS NATIONAL LAUNGUAGE SET
  select empno,ename,sal,to_char(sal,'L9G999D99'),deptno from emp;
  select empno,ename,sal,to_char(sal,'C9G999D99'),deptno from emp;
  
  
  
--TO_DATE():
--    THIS FUNCTION CONVERTS USER DEFINED DATE FORMAT INTO ORACLE PRE-DEFINED DATEFORMAT
--    MM/DD/YYYY
--EXAMPLE: WAQ TO CONVERT 23/08/23 INTO ORACLE PRE DEFINED FORMAT
    select to_date('08/23/23','mm/dd/yy') from dual;
--WAQ TO DISPLAY DAY OF INDEPENDENCE DAY
    select to_char(to_date('15/08/1947','dd/mm/yyyy'),'day') from dual;



--TO_NUMBER():
--THIS FUNCTION USED TO CONVERT CHAR NUMBER VALUES INTO NUMBER FORMAT TEMPORARILY
--EXAMPLE: ADD 1,234.56 +789.78
SELECT TO_NUMBER('1,234.56','9,999.99')+789.78 FROM DUAL;


--GENERAL FUNCTIONS():
--  THESE FUNCTIONS ARE APPLICABLE FOR ANY DATATYPES
--(i)Greatest():
--    Used to find greatest value from given list of values
--EXAMPLE:
SELECT GREATEST (10,30,20,14) FROM DUAL;

--(ii)LEAST
--RETURNS LEAST VALUE FROM GIVEN LIST
    SELECT LEAST('d','cd','bcd','abcd') from dual;

--(iii)DISTINCT
--    USED TO ELIMINATE DUPLICATES
    SELECT DISTINCT(DEPTNO) FROM EMP;
    
--(iv)NVL
--    USED TO PERFORM ARTHIMETIC OPERATIONS BY USING NULLS
--    IT ACCEPTS 2 ARGUMENTS
--    SYNTAX NVL(EXPRESSION1,EXPRESSION2)
--    IF EXPRESSION1 IS NULL THEN IT EVALUATES EXPRESSION2 OTHERWISE EXPRESSION1
--EXAMPLE:
    select nvl(null,200), nvl(100,190) from dual;
    
--WAQ TO DISPLAY EACH EMPLOYEE NET SALARY
select empno,ename,sal,nvl(comm,0),sal+nvl(comm,0), deptno from emp;
--WAQ TO MAKE NULL VALUES IN COMM TO N/A
select empno,ename,sal,nvl(to_char(comm),'N/A'),deptno from emp;
  

--SOUNDEX():
--    USED TO COMPARES THE DATA BASED ON GIVEN PRONOUNCIATION
select * from emp where ename='smith';  --NO RECORDS BECAUSE HERE IN SMALL LETTERS
select * from emp where ename='SMIT';   --NO RECORDS BECAUSE SPELLING WRONG
select * from emp where soundex(ename)=soundex('smit'); --BY CHECKING THE PRONOUNCIATION IT GIVES THE RESULT

--SELECT SYNTAX
--SELECT * / COLUMN_LIST FROM <TABLE_NAME> [WHERE <CONDITION>/GROUP BY CLAUSE/HAVING CLAUSE/ORDER BY CLAUSE]

--SELECT COMMAND RULES
--    IN SELECT SELECTED COLUMNS ALL ARE ORDINARY COLUMNS QUERY EXCECUTED
--    IN SELECT SELECTED COLUMNS ALL ARE GROUP/AGGREGATE FUNCTIONS QUERY EXCECUTED
--    BUT, ORDINARY COLUMNS WITH GROUP FUNCTIONS PARALLELY NOT EXCECUTED BECAUSE BOTH ARE NOT RETURNING SIMILAR NO.OF ROWS
--    IN SELECT STATEMENT ALL ARE ORDINARY (OR) ALL ARE GROUP FUNCTIONS THEN SELECT STATEMENT EXCECUTED


--GROUP BY CLAUSE
--    USED TO CONVERT ORDINARY COLUMNS INTO GROUPED COLUMNS
--    EX: WAQ TO DISPLAY DEPT.WISE SUM OF SALARIES(SUB-TOTALS)
select deptno, sal from emp order by deptno; 
select deptno, sum(sal) from emp group by deptno;

--WAQ TO DISPLAY IN EACH JOB MIN AND MAX SALARIES
select job,min(sal),max(sal) from emp group by job;

--WAQ TO DISPLAY IN EACH DEPT HOW MANY EMPLOYEES ARE WORKING
select deptno,count(ename) from emp group by deptno;
--WAQ TO DISPLY IN EACH YEAR HOW MANY EMPLOYEES ARE JOINED
select to_char(hiredate,'yyyy') as year,count(*) as no_of_emps from emp group by to_char(hiredate,'yyyy');
--WAQ TO DISPLAY UNDER EACH BOSS HOW MANY SUBORDINATES
select * from emp;
select mgr as boss,count(ename) as no_of_subordinates from emp where mgr is not null group by mgr; 



--HAVING CLAUSE/CONDITION
--    USED TO CHECK GROUP FUNCTION/GROUPED COLUMN VALUES
--    IT IS VALIDATE AFTER GROUP BY CLAUSE
--EX: WAQ TO TO DISPLAY IN WHICH DEPT MORE THAN 3 EMPLOYEES ARE WORKING
select deptno, count(*) from emp group by deptno having count(*)>3;

--WAQ TO DISPLAY IN WHICH JOBS MIN SAL > 2000
select job, min(sal) from emp group by job having min(sal)>2000;



--ORDER BY CLAUSE:
--    IT DISPLAYS INFORMATION EITHER ASCENDING OR DESCENDING ORDER
--    BY DEFAULT IT DISPLAYS ASCENDING ORDER
--    ONLY SELECT STATEMENT SUPPORTS ORDER BY CLAUSE
--    ORDER BY CLAUSE MUST PLACED AT END OF SELECT STATEMENT
--    IN ORDER BY CLAUSE MAXIMUM 32 COLUMNS ARE SUPPORTED
--    ORDER BY CLAUSE SUPPORTS ALIAS BUT GROUP BY CLAUSE NOT SUPPORTED
--EX:
SELECT * FROM EMP ORDER BY DEPTNO ASC;  --ASCENDING ORDER
SELECT * FROM EMP ORDER BY DEPTNO DESC; --DESCENDING ORDER
SELECT * FROM EMP ORDER BY DEPTNO ASC, ENAME DESC;
SELECT EMPNO,SAL+NVL(COMM,0) AS NETSALARY FROM EMP ORDER BY NETSALARY;
SELECT * FROM EMP ORDER BY 3; -- HERE 3 MEANS 3RD COLUMN GETTING SORTED



--CONSTRAINS:
-- -> IT IS A CONDITION OR RULE THAT APPLIED ON COLUMNS AT THE TIME OF TABLE CREATION
--    OR AFTER THE TABLE CREATION
-- -> CONSTRAINS ARE ACTIVATED WHENEVER DML COMMANDS ARE PERFORMED
-- -> ALSO ACTIVATED WHEN TABLES ARE MANIPULATED BY OTHER USERS OR BY OTHER APPLICATION SOFTWARE TOOLS
-- -> CONSTRAINS ARE USED TO RESTRICT USER DEFINED CONDITIONS OR BUSINESS RULES
-- -> ALL CREATED CONSTRAINT NAMES ARE STORED USER_CONSTRAINS/ USER_CONS_COLUMNS (SYSTEM TABLE)


--TYPES OF CONSTRAINS:
--    ORACLE SUPPORTS 6 TYPES OF CONSTRAINS
--        NOT NULL CONSTRAINT
--        UNIQUE CONSTRAINT
--        CHECK CONSTRAINT
--        DEFAULT CONSTRAINT
--        PRIMARY KEY CONSTRAINT
--        FOREIGN KEY CONSTRAINT


--    CONSTRAINS ARE ADDED TO TABLE THERE ARE 3 METHODS
--        COLUMN LEVEL
--        TABLE LEVEL
--        ALTER LEVEL

--(i)COLUMN LEVEL:
--    CONSTRAINS ARE ADDED NEXT TO COLUMN NAME AT THE TIME OF TABLE CREATION
--    SYNTAX
--      CREATE TABLE <TABLE_NAME> (COLUMN_NAME DATATYPE(SIZE) [CONSTRAINT <CONSTRAINT_NAME>] CONSTRAINT_TYPE);
--                                                                  (OPTIONAL PART [])

--(ii)TABLE LEVEL:
--    CONSTRAINS ARE ADDED AFTER DECLARING ALL COLUMNS AT THE TIME OF TABLE CREATION
--    SYNTAX
--        CREATE TABLE <TABLE_NAME> (COL1 DATATYPE(SIZE),
--                                   COL2 DATATYPE(SIZE),
--                                   .
--                                   .
--                                   COLN DATATYPE(SIZE),
--                                        CONSTRAINT CONSTRAINT_NAME CONSTRAINT_TYPE(COL1,COL2,....COLN)


--(iii)ALTER LEVEL:
--    AFTER TABLE CREATION TO ADD CONSTRAINS TO EXISTING COLUMNS
--    SYNTAX:
--        ALTER TABLE <TABLE_NAME> ADD/MODIFY [CONSTRAINT CONSTRAINT_NAME] CONSTRAINT_TYPE(COL1,COL2,.....);
--                                                 (OPTIONAL PART [])
--    TO ADD A CONSTRAINT FOR MORE THAN ONE COLUMN IS CALLED COMPOSITE CONSTRAINTS
--    IN COMPOSITE CONSTRAINS MAX 32 COLUMNS ARE SUPPORTED
--    ALL COMPOSITE CONSTRAINS ARE SUPPORTED IS TABLE LEVEL AND ALTER LEVEL
--    IF THE TABLE CONTAINS PRIMARY KEY THEN THE TABLE IS KNOWN AS MASTER/PARENT/INDEPENDENT TABLE
--    IF THE TABLE CONTAINS FOREIGN KEY THEN THE TABLE IS KNOWN AS TRANSCATION/CHILD/DEPENDENT TABLE
--    WE CANNOT DELETE PARENT RECORD IF ANY CHILD RECORDS ARE FOUND
--    CONSTRAINS ARE NOT SUPPORTED IF ANY COLUMN CONTAINS UN-STRUCTURED DATA TYPES LIKE LOB, CLOB, RAW,LONG RAW .....
--    ONLY NOT NULL CONSTRAINT IS SUPPORTED


--NOT NULL CONSTRAINT
--    BY DEFAULT ALL COLUMNS ACCEPT NULLs
--    TO RESTRICT NULLS THEN WE NEED TO ADD NOT NULL CONSTRAINT
--    SUPPORTS IN COLUMN LEVEL ONLY
--    NOT NULL DOESNT ACCEPT NULL VALUES
--    NOT NULL ACCEPTS DUPLIACATE VALUES
--EXAMPLE: CREATE A EMPLOYEE DATA BASE TABLE WITH EMPLOYEE ID AND EMPLOYEE NAME
--    VALIDATIONS: EMPID IS MANDATORY
       create table employee_db(empid number(4) CONSTRAINT EMPLOYEE_DB_EMPID_NN NOT NULL,ename varchar2(20));
       INSERT INTO EMPLOYEE_DB VALUES (1001,'RAKESH'); --INSERTED SUCCESSFULLY
       INSERT INTO EMPLOYEE_DB VALUES (NULL ,'RAKESH1'); -- ERROR CANNOT INSERT NULL INTO ("SYS"."EMPLOYEE_DB"."EMPID")



--   

    


    



--(ii)UNIQUE CONSTRAINT:
--    THIS CONSTRAIN USED TO AVOID DUPLICATE VALUES
--    UNIQUE CONSTRAINS SUPPORTED IN 3 LEVELS
--    UNIQUE CAN ACCEPTS NULLS
--EX: CREATE A STUDENT DATABASE TABLE WITH SID, SNAME,CLASS
--VALIDATIONS: SID IS MANDATORY
--SID SHOULD NOT ALLOW DUPLICATES
create table studentdb(sid number(4) UNIQUE not null, sname varchar2(20),class varchar2(20));
insert into studentdb values(1,'fds','6'); --inserted succesfully
insert into studentdb values(1,'bvms','7'); --error ORA-00001: unique constraint (SYS.SYS_C0023004) violated
drop table studentdb;   --Table STUDENTDB dropped.



--CHECK CONSTRAINT:
--    USED TO CHECK THE GIVEN CONDITION 
--    IF GIVEN CONDITION IS TRUE THEN RECORD INSERTED ELSE ERROR
--EX:CREATE A EMPLOYEE TABLE WITH EMPLOYEE ID, EMPLOYEE NAME&SALARY
--VALIDATION    MINIMUM EMPLOYEE SALARY 3000
create table employee10(eid number(2),ename varchar2(10),sal number(8,2) check (sal>=3000));
--test
insert into employee10 values(1,'dss',2000); --error check constraint (SYS.SYS_C0023005) violated
--write a validation for age between age 18-35;
--      check(age between 18 and 35);
--validation status to accept only y or n
--      check (status='y' or status='n');
--validate transcation amount should me multiples of 100
--      check(mod(transaction,100)=0);
--mail id should end with .com or .co.in
--      check(email like '%.com' or email like '%.co.in');
--mobile number should be accept 10 digits
--      check(length(mobileno)=10);



--(iv)DEFAULT CONSTRAINT
--    THIS CONSTRAINT USED TO TAKE SPECIFIED DEFAULT VALUE
--    IF ANY COLUMN VALUE IS FIXED THEN USE DEFAULT CONSTRAINS
--EXAMPLE: DATE COLUMN NEED TO HAVE TODAYS DATE
create table today(today date default sysdate);
insert into today values(default); --TO ADD DEFAULT VALUE
insert into today values('01-01-1999'); --TO ADD A VALUE OTHER THAN DEFAULT
select * from today;





--PRIMARY KEY (UNIQUE + NOT NULL + INDEX)
--    IT IS ONE OF THE ORACLE INTEGRATED CONSTRAINT
--    ONCE ADD PRIMARY KEY CONSTRAINT THEN DEFAULT ORACLE ADDED UNIQUE,NOT NULL AND INDEX
--    DOESNT ACCEPT NULLS    
--    AVOIDS DUPLICATE VALUES
--    IN COLUMN LEVEL ONLY ONE COLUMN ACCEPTS PRIMARY KEY CONSTRAINT
--    ONCE ADD PRIMARY KEY CONSTRAINT THEN IT IMPROVES THE PERFORMANCE WHILE RETRIEVING OR MANIPULATING DATA
--    IF TABLE CONTAINS PRIMARY KEY CONSTRAINS THE TABLE IS CALLED AS MASTER/PARENT/INDEPENDENT TABLE
--    PRIMARY KEY CONSTRAINS NOT SUPPORTED IF ANY COLUMN DATA TYPE CONTAINS UNSTRUCTUED DATATYPES
--EXAMPLE: CREATE A DEPARTMENT TABLE WITH DEPT ID, DEPT NAME AND LOCATION
--VALIDATION:
--    DEPT ID IS MANDATORY
--    DEPT ID SHOULD NOT ALLOW DUPLICATES
CREATE TABLE DEPT(DID NUMBER(2) PRIMARY KEY,DNAME VARCHAR2(10),LOC VARCHAR2(10));
-- HERE ID DID NOT ACCEPTS NULL VALUES AND DUPLICATE VALUES

create table dept_mas1(deptid number(2) primary key,dname varchar2(20),loc varchar2(20));
select * from dept_mas1;
select * from employ10;



--FOREIGN KEY CONSTRAINTS(REFERENCES):
--    IT IS ONE OF THE ORACLE REFENTIAL INTEGRITY CONSTRAINT
--    THIS CONSTRAINT MAIN FUNCTIONALITY IS TO ESTABLISH RELATIONSHIP BETWEEN TWO TABLES OR COLUMNS OR SAME TABLE
--    TO ADD FOREIGN KEY CONSTRAINT TO ANY COLUMN REFERENCED TABLE, REFERENCED COLUMN EITHER PRIMARY KEY OR UNIQUE CONSTRAINT
--    ACCEPTS DUPLICATES AND NULLS
--    IF TABLE CONTAINS ONLY FOREIGN KEY CONSTRAINS THE TABLE IS CALLED AS TRANS/CHILD/DEPENDENT TABLE
--    FOREIGN KEY CONSTRAINT NOT SUPPORTED IF ANY COLUMN CONTAINS UNSTRUCTURED DATA TYPE
--EXAMPLE:  CREATE A EMPLOYEE TABLE WITH ID,NAME,SAL,DEPTID
--VALIDATIONS:  RECRUITING EMPLOYEE DEPTID SHOULD BE AVAILABLE IN ORGANIZATION
--TABLE CREATED WITH NAMES DEPT_MAS1 ORGANIZATION TABLE
--TABLE CREATED WITH NAME EMPLOY10 NEW EMPLOYEES TABLE
--TESTING:
CREATE TABLE EMPLOY10(EID NUMBER(2),ENAME VARCHAR2(20),SAL NUMBER(6),DEPTNO NUMBER(4) REFERENCES DEPT_MAS1(DEPTID));
INSERT INTO EMPLOY10 VALUES(11,'DEF',3000,30);
--DATA ONLY ACCEPTS IF THE DEPTNO WE ARE GIVING MATCHES TO DEPTID IN MASTER TABLE


--EXAMPLE:
--    CREATE A BOOKMASTER TABLE WITH BOOKID, BOOKNAME, AUTHORNAME;
--VALIDATIONS:
    --BOOKID IS MANDATORY
    --BOOKID SHOULD NOT ALLOW DUPLICATES
--CREATE A BOOK ISSUE TABLE WITH TNO,TDATE,STUDENTID,BOOKID
--VALIDATIONS:
    --ISSUING BOOK ID SHOULD BE AVAILABLE IN LIBRARY
CREATE TABLE BOOKMASTER(BOOKID NUMBER(3) PRIMARY KEY,BOOKNAME VARCHAR2(20),AUTHORNAME VARCHAR2(20));
CREATE TABLE BOOKISSUE(TNO NUMBER(3),TDATE DATE,STUDENTID NUMBER(3),BOOKID NUMBER(3) REFERENCES BOOKMASTER(BOOKID));
Insert into bookissue values(103,'28-08-2023',264,2);
select * from bookmaster;
select * from bookissue;



--create a model of training institute with
    --coursemaster table(courseid,coursename,duration)
    --coursefee table(courseid,fee)
    --student_details table(sid,sname,mobile,address)
    --transaction table(tid,tdate,sid,courseid,doj,amount)
    
create table coursemaster(cid number(3) primary key,cname varchar2(20) unique not null,duration number(3) not null);
create table coursefee(cid number(3) references coursemaster(cid), fee number(5) not null);
create table studdetails(sid number(3) primary key, sname varchar2(20), mobile number(10),address varchar2(30));
create table stud_trans(tid number(8) primary key,sid number(3) references studdetails(sid),cid number(3) references coursemaster(cid),doj date,fee number(5));
--INSERTED VALUES ACCORDING TO THE REQUIREMENT
SELECT * FROM COURSEMASTER;
SELECT * FROM COURSEFEE;
SELECT * FROM STUDDETAILS;
SELECT * FROM STUD_TRANS;


--SELF FOREIGN KEY
    --FOREIGN KEY CONSTRAINS IS REFERENCED WITH SAME TABLE OF PRIMARYKEY CONSTRAINT

--TO CHECK THE CONSTRAINTS DETAILS
        SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='COURSEMASTER';
--ON DELETE CASCADE
    --USED TO DELETE WHENEVER PARENT RECORD DELETED THEN CORRESPONDING CHILD REOCORDS DELETED
    --THIS OPTION WILL BE ADDED AT THE TIME OF FOREIGN KEY DECLARATION
    --AFTER DECLARING FOREIGN KEY WE CAN ADD THE OPTION ON DELETE CASCADE
--IF FOREIGN KEY TABLE IS ALREADY CREATED:
    --DROP FOREIGN KEY CONSTRAINT
        --ALTER TABLE <TABLENAME> DROP CONSTRAINT <CONSTRAINTNAME>
    --ADD FOREIGN KEY WITH ON DELETE CASCADE OPTION
        --ALTER TABLE <TABLENAME> ADD CONSTRAINT <CONSTRAINT NAME> FOREIGN KEY(COLUMNNAME) REFERENCES TO .... ON DELETE CASCADE;

--ON DELETE SET NULL
    --THIS OPTION IS USED TO WHENEVER PARENT RECORD IS DELETED THEN CORRESPONDING CHILD RECORD VALUES SET TO NULLs
    --THIS OPTION ALSO NEED TO ADDED AT TIME OF FOREIGN KEY DECLARATION
--NOTE: SAME STEPS FOLLOWED BY USING ON DELETE CASCASDE


--COMPOSITE CONSTRAINTS:
    --CONSTRAINTS ARE ADDED TO MORE THAN ONE COLUMN IS CALLED AS COMPOSITE CONSTRAINT
    --IN COMPOSITE CONSTRAINTS MAXIMUM 32 COLUMNS ARE ADDED
    --ALL COMPOSITE CONSTRAINTS ARE ADDED IN TABLE/ALTER LEVEL ONLY
    --IN COMPOSITE CONSTRAINTS DATA IS COMPARED WITH PAIRWISE


--COMPOSITE PRIMARY KEY:
    --PRIMARY KEY IS ADDED TO MORE THAN ONE COLUMN
    --EXAMPLE: 
        --CREATE A PRODUCT MASTER TABLE WITH COMPANY ID,PRODUCTID AND PROD.NAME
    --VALIDATIONS: 
        --CID AND PID ARE MANDATORY
        --CID AND PID PAIR SHOULD NOT BE REPEATED
    --TABLE CREATION
        CREATE TABLE PROD_MASTER(CID VARCHAR2(10),PID VARCHAR2(10),PNAME VARCHAR2(20),PRIMARY KEY(CID,PID));
        INSERT INTO PROD_MASTER values('c2','p1','coffee');
        select * from prod_master;
        
--COMPOSITE FOREIGN KEY:
    --FOREIGN KEY CONSTRAINT ADDED TO MORETHAN ONCE COLUMN
    --COMPOSITE FOREIGN KEY IS REFERENCED WITH COMPOSITE PRIMARY KEY
    --EXAMPLE:
        --CREATE A SALES MAS TABLE WITH SALES ID, SALES DATE,CID,PID AND AMOUNT
    --VALIDATIONS
        --SELLING CID AND PID SHOULD BE AVAILABLE IN PROD_MASTER TABLE OF CID AND PID
    --TABLE:
        Create table sales_mas(sid number(3),sdate date,cid varchar2(10),pid varchar2(10),qty number(3),amount number(8,2),foreign key(cid,pid) references prod_master(cid,pid));
        select * from sales_mas;

        
--COMPOSITE CHECK CONSTRAINT:
    --CHECK CONSTRAINT IS ADDED TO MORETHAN ONE COLUMN
    --EXAMPLE:
    --VALIDATION:
        --EMPLOYEE SAL+COMM SHOULD NOT EXCEEDS 10000/
    --TABLE
        --create table employ(eid number(4),sal number(8,2),comm number(8,2),check(sal+nvl(comm,0)<=10000));
        
        
--HOW TO ADD CONSTRAINS IN ALTER LEVEL:
    --AFTER TABLE CREATION TO ADD CONSTRAINS TO EXISTING COLUMNS
    --TABLE:
        create table emp_tab1(eid number(4),ename varchar2(20), sal number(8,2),deptno number(3));
    --PRIMARY KEY ON EID COLUMN
        Alter table emp_tab1 add primary key(eid);
    --NOT NULL ON ENAME COLUMN
        Alter table emp_tab1 modify ename not null;
    --DEFAULT
        Alter table emp_tab1 modyfy sal default 3000;
    --CHECK
        Alter tab emp_tab1 add check(sal>3000);
--FOREIGN KEY CONSTRAINT
        Alter table emp_tab1 add foreign key(deptno) references dep_mas(deptno);
--HOW TO RENAME CONSTRAINT NAMES
    --ALTER TABLE <TABLE NAME> RENAME <OLD COLUMN NAME> TO <NEW COLUMN NAME>
--TO SEE CREATED CONSTRAINTS
    --SELECT * FROM USER_CONSTRAINTS
    --SELECT * FROM USER_TAB_CONS_COLUMNS;
--TO SEE CONSTRAINS ON PARTICULAR TABLE
    --SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='<REQUIRED TABLE>';
--HOW TO ENABLE/DISABLE CONSTRAINTS
    --BY DEFAULT ALL CONSTRAINTS ARE ENABLED
    --TO DISABLE A CONSTRAINT:
        --ALTER TABLE <TABLENAME> DISABLE CONSTRAINT <CONSTRAINT_NAME>;
        --ALTER TABLE <TABLENAME> ENABLE CONSTRAINT <CONSTRAINT_NAME>;
--HOW TO DROP A CONSTRAINT
    --ALTER TABLE <TABLENAME> DROP CONSTRAINT <CONSTRAINT_NAME>;




--what is a query?
    --TO REQUESTING DATA FROM DATABASES
    --QUERIES ARE CLASSIFIED TO 3 TYPES
    --(i)ROOT QUERY
        -- THE QUERY WHICH IS NOT DEPENDS UPON ANOTHER QUERY OUTPUT FOR ITS CONDITIONAL VALUE
            --EX: SELECT * FROM EMP;
    --(ii)PARENT QUERY
        -- THE QUERY WHICH IS DEPENDS UPON ANOTHER QUERY OUTPUT FOR ITS CONDITIONAL VALUE
        --PARENT QUERY IS ALSO CALLED AS OUTER/DEPENDENT QUERY
            --EX: SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL)FROM EMP);
    --(iii)CHILD QUERY:
        -- WHICH RETURNS OUTPUT TO ITS PARENTS QUERY
        --CHILD QUERY IS ALSO CALLED AS INNER/NESTED/SUB/INDEPENDENT QUERY
            --EX: SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP);
--SUB-QUERY:
    --QUERY WITHIN A QUERY IS A SUB-QUERY
    --SUB-QUERIES ARE SUPPORTED BY SELECT,UPDATE,DELETE AND INSERT COMMANDS
    --SUB QUERIES ARE PLACED IN WHERE CLAUSE OF SELECT STATEMENT
    --SUB-QUERIES ARE ALSO PLACED IN FROM CLAUSE AND COLUMN_LIST OF OUTER QUERY
    --IF SUB-QUERIES ARE PLACED IN FROM CLAUSE THAT TYPE OF QUERIES ARE CALLED AS IN-LINE SUB-QUERIES
    --SYNTAX:   SELECT * FROM (SUBQUERY);
    --IF SUB-QUERIES ARE PLACED IN COLUMN LIST THEN THE QUERIES ARE CALLED AS SCALAR SUB-QUERIES
    --SYNTAX:   SELECT COL1,COL2,(SUBQUERY),COL3 FROM <TABLENAME>;
--RESTRICTIONS:
    --SUB-QUERIES MUST BE ENCLOSED WITHIN THE BRACKETS()
    --SUB-QUERIES ARE NOT SUPPORTED ORDER BY CLAUSE, ONLY IN-LINE SUB-QUERIES ARE SUPPORTED
    --MAXIMUM 255 SUB-QUERIES CAN BE NESTED
    
--ADVANTAGES:
    --BY USING SUB-QUERIES IT IMPROVES THE PERFORMANCE WHILE RETRIEVING OR MANIPULATING DATA
    
--TYPES OF SUB-QUERIES:
    --ORACLE SUPPORTS 5TYPES OF SUB-QUERIES
    --(I)SINGLE ROW SUB-QUERIES
    --(II)MULTI ROW SUB-QUERIES
    --(III)MULTI COLUMN SUB-QUERIES
    --(IV)CO-RELATED SUB-QUERIES
    --(V)SCALAR SUB-QUERY
    
    
--(I)SINGLE ROW SUB-QUERIES
    --SUB-QUERY RETURNS SINGLE VALUE
    --IN SINGLE ROW SUBQUERIES, SUB-QUERY OUTPUTS ARE COMPARED WITH >,<,>=,<=,=,BETWEEN,NOT NETWEEN etc..
    --EXAMPLE:
        --WAQ TO DISPLAY SMITH EMPLOYEE AND HIS COLLEGEOUS
        SELECT ENAME FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SMITH');
    --WAQ TO DISPLAY MAXIMUM EMPLOYEE SALARY DETAILS
        SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP);
    --WAQ TO DISPLY WHO ARE GETTING MORETHAN CLERK SALARY
        SELECT * FROM EMP WHERE SAL>(SELECT MAX(SAL) FROM EMP WHERE JOB='CLERK');
    --WAQ TO DISPLAY SECOND HIGHEST SALARY
        SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP WHERE SAL<(SELECT MAX(SAL) FROM EMP));
    --WAQ TO DISPLAY WHO ARE JOINED AFTER HEMANTH EMPLOYEE
        SELECT * FROM EMP WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='HEMANTH');
    --WAQ TO DISPLAY WHO ARE WORKING IN NEW YORK LOCATION
        SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='NEW YORK');
    --WAQ TO DISPLAY SENIOR MOST EMPLOYEE RECORDS
        SELECT * FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP);
    --WAQ TO DISPLAY LATEST EMPLOYEE JOINING DETAILS
        SELECT * FROM EMP WHERE HIREDATE=(SELECT MAX(HIREDATE) FROM EMP);
    --WAQ TO DISPLAY WHO ARE WORKING IN SALES DEPT AND THEIR SALARY>2000
        SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES') AND SAL>2000;
    --WAQ TO DISPLAY SMITH EMPLOYEE BOSS
        SELECT * FROM EMP WHERE EMPNO=(SELECT MGR FROM EMP WHERE ENAME='SMITH');
    --WAQ TO DISPLAY WHO JOINED IN SALESDEPT,IN 1981 YR
        SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY')='1981' AND DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
        
        
        
--(II)MULTI-ROW SUBQUERIES:
    --SUB-QUERY RETURNS MORETHAN ONE ROW IS CALLED AS MULTIROW SUBQUERIES
    --IN MULTIROW SUBQUERIES OUTPUTS ARE COMPARED WITH SPECIAL OPERATORS 
    --THOSE ARE IN, ANY, ALL, EXISTS, NOT EXISTS OPERATORS
    --EXAMPLE:
    --WAQ TO DISPLAY WHO ARE JOINED IN SALES & RESEARCH DEPT
        SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME IN('SALES','RESEARCH'));  
    --WAQ TO DISPLY ONLY SUPERIOR NAMES(BOSSES)
        SELECT ENAME FROM EMP WHERE EMPNO IN(SELECT MGR FROM EMP);
    
    
    --ALL OPERATOR
    --WAQ TO DISPLAY WHO ARE GETTING MORETHAN ALL SALESMAN SALARIES
        SELECT * FROM EMP WHERE sal>ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
    
    
    
    --ANY OPERATOR
    --WAQ TO DISPLAY WHO ARE GETTING MORE THAN ANY SALESMAN SALARY
        SELECT * FROM EMP WHERE sal>ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
    
    
    
    --EXISTS OPERATOR:
        --IT RETURNS BOOLEAN VALUE (TRUE/FALSE)
        --IT RETURNS
            --TRUE -> IF SUB-QUERY EXCECUTES SUCCESSFULLY AND RETURNS ATLEAST ONE RECORD
            --FALSE -> IF SUBQUERY EXCECUTES SUCCESSFULLY AND NO ROWS SELECTED
        --EXAMPLE:
        --WAQ IF ANY EMPLOYEE WORKING IN 10TH DEPT THEN TO INCREMENT ALL EMPLOYEE SALARIES WITH 50%
        UPDATE EMP SET SAL=SAL+SAL*0.5 WHERE EXISTS(SELECT * FROM EMP WHERE DEPTNO=10);





--(III)MULTI-COLUMN SUB-QUERIES
    --SUBQUERY RETURNS MORE THAN ONE COLUMN
    --IN MULTICOLUMN SUB-QUERIES NO.OF COLUMNS RETURN BY SUB-QUERY SHOULD BE MATCHED WITH NO.OF COLUMNS IN WHERE CLAUSE
    --cont.. of OUTER QUERY AND CORRESPONDING COLUMNS DATATYPE SHOULD BE SAME
    --SYNTAX:   SELECT * FROM <TABLENAME> WHERE (COL1,COL2) IN (SELECT COL1,COL2 FROM <TABLENAME>);
    --IN MULTI-COLUMN SUB-QUERIES, SUB-QUERIES OUTPUTS ARE COMPARED WITH PAIRWISE
    --IT ALSO KNOWN AS PAIR-WISE SUB-QUERIES
    --EXAMPLE:
    --WAQ TO DISPLAY DEPT.WISE MAX SALARY EMPLOYEE DETAILS
        SELECT * FROM EMP WHERE (DEPTNO,SAL) IN (SELECT DEPTNO,MAX(SAL) FROM EMP GROUP BY DEPTNO);
    --WAQ TO DISPLAY DEPT WISE BOSSES(SUPERIORS)
        SELECT * FROM EMP WHERE (EMPNO,DEPTNO) IN (SELECT MGR,DEPTNO FROM EMP);
        
        
        
        
--(IV)CO-RELATED SUB-QUERY:
    --HERE FIRST OUTER QUERY EXCECUTED THEN SUB-QUERY WILL EXCECUTE
    --IF OUTER QUERY EXCECUTES N TIMES THEN SUB-QUERY ALSO EXCECUTES N TIMES
    --ONE OF THE OUTER QUERY COLUMN IS PLACED IN SUB-QUERY WHERE CONDITION
    --THAT OUTPUT COLUMN IS CALLED AS CO-RELATED COLUMN
    --SYNTAX:   SELECT COL1,COL2,COL3,.... FROM <TABLENAME> WHERE COL2=(SELECT COL4 FROM <TABLENAME> WHERE COL5=COL3);
    --EXAMPLE:
        --WAQ TO DISPLAY WHO ARE GETTING MORE THAN THEIR DEPT AVG SALARIES
            SELECT E.EMPNO,E.ENAME,E.SAL,E.DEPTNO FROM EMP E WHERE E.SAL>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
        --WAQ TO DISPLAY WORKING EMPLOYEE DEPT DETAILS
            SELECT D.DEPTNO,D.DNAME,D.LOC FROM DEPT D WHERE EXISTS (SELECT * FROM EMP WHERE DEPTNO=D.DEPTNO);
        --WAQ TO DISPLAY IN WHICH DEPT NO EMPLOYEES ARE WORKING
            SELECT D.DEPTNO,D.DNAME,D.LOC FROM DEPT D WHERE NOT EXISTS (SELECT * FROM EMP WHERE DEPTNO=D.DEPTNO);



--(V)SCALAR SUB-QUERIES:
    --SUB-QUERIES ARE PLACED IN COLUMN LIST OF OUTER QUERY
    --SYNTAX:   SELECT COL1,COL2,( ),COL4,... FROM <TABLENAME>;
    --IN SCALAR SUB-QUERIES, sub-query should be RETURN SINGLE COLUMN AND SINGLE VALUE AT A TIME
    --EXAMPLE:
    --WAQ TO DISPLAY EMPLOYEE DETAILS WITH ALL EMPLOYEE SUM OF SALARIES
        SELECT EMP.*,(SELECT SUM(SAL) FROM EMP) AS SUMSAL FROM EMP;
    --WAQ TO DISPLAY DEPT WISE SUM TOTALS AND GRAND TOTAL
        SELECT DEPTNO,SUM(SAL) AS SUB_TOTAL,(SELECT SUM(SAL) FROM EMP) AS GRAND_TOTAL FROM EMP GROUP BY DEPTNO;
    --WAQ TO DISPLAY DEPT WISE SUBTOTALS WITH DEPT WISE PERCENTAGES
        SELECT DEPTNO,SUM(SAL) AS SUB_TOTAL, SUM(SAL)/(SELECT SUM(SAL) FROM EMP)*100 AS PERCENTAGE FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO;
        select deptno,min(sal),max(sal) from emp group by deptno;
    --WAQ TO DISPLAY DEPTNAME WISE MIN AND MAX SALARIES
        SELECT D.DNAME, (SELECT NVL(MIN(SAL),0) FROM EMP WHERE EMP.DEPTNO=D.DEPTNO) AS MIN_SAL,
        (SELECT NVL(MAX(SAL),0) FROM EMP WHERE EMP.DEPTNO=D.DEPTNO) AS MAX_SAL FROM DEPT D;
        
        
        
        



--NESTED SELECT
    --SELECT WITH IN THE SELECT
    --EXAMPLE:
    --WAQ TO DISPLAYNO.OF EMPLOYEES, NO.OD DEPTS AND NO,OF GRADES
    SELECT (SELECT COUNT(*) FROM EMP) AS TOTAL_EMPS, (SELECT COUNT(*) FROM DEPT) AS TOTAL_DEPTS,
    (SELECT COUNT(*) FROM SALGRADE) AS NO_OF_GRADES FROM DUAL;
    




--PSEUDO COLUMNS:
    --ORACLE PRE DEFINED COLUMNS ARE CALLED AS PSEUDO COLUMNS
    --IT IS A COLUMN NOT RELATED TO ONE TABLE AND IS APPLICABLE FOR ANY TABLE
    --ORACLE SUPPORTS SOME PRE-DEFINED COLUMNS
        --(I)UID   (II)USER   (III)SYSDATE  (IV)SYSTIEMSTAMP    (V)ROWID    (VI)ROWNUM  (VII)LEVEL  (VIII)CURRVAL   (IX)NEXTVAL
    --UID:
        --IT RETURNS CURRENTLY CONNECTED USER IDENTIFICATION NUMBER
    --USER:
        --IT RETURNS CURRENTLY CONNECTED USERNAME
    --SYSDATE:
        --RETURNS SERVER DATE AND TIME
    --SYSTIMESTAMP:
        --RETURNS  DATE ALONG WITH TIME
    --EXAMPLE:
    CREATE TABLE LOGIN_DETAILS1(USER_ID VARCHAR2(20),USER_NAME VARCHAR2(20),LOGIN_TIME DATE,LOGOUT_TIME TIMESTAMP);
    INSERT INTO LOGIN_DETAILS1 VALUES(UID,USER,SYSDATE,SYSTIMESTAMP);
    SELECT * FROM LOGIN_DETAILS1;
    
    --ROWID:
        --IT IS AN UNIQUE VALUE
        --ROWID's ARE GENERATED AT THE TIME OF INSERTING DATA INTO TABLE
        --ROWID's ARE STORED IN DATABASE PERMANANTLY
        --ROWID's RETURNS POSISTION OF RECORD
        --ROWID CONTAINS 16BIT HEXADECIMAL VALUE
        --THAT HEXADECIMAL VALUE CONTAINS BLOCK ID, FILE ID AND RECORD ID
        --EXAMPLE:
            SELECT ROWID, EMP.* FROM EMP;
            select rowid,deptno,dname,loc from dept;
        --WAQ TO DISPLAY FIRST RECORD FROM THE TABLE
            SELECT * FROM EMP WHERE ROWID=(SELECT MIN(ROWID)FROM EMP);
        --WAQ TO DISPLAY LAST RECORD FROM THE TABLE
            SELECT * FROM EMP WHERE ROWID=(SELECT MAX(ROWID) FROM EMP);
        --WAQ TO DELETE DUPLICATE RECORDS FROM THE TABLE
            DELETE FROM EMP WHERE ROWID NOT IN (SELECT MIN(ROWID) FROM EMP GROUP BY EMPNO);
        --WAQ TO DISPLAY DUPLICATE RECORDS
            SELECT * FROM EMP WHERE ROWID NOT IN (SELECT MIN(ROWID) FROM EMP GROUP BY EMPNO);
    --ROWNUM:
        --IT IS AN UNIQUE VALUE
        --ROWNUM's ARE GENERATED BASED ON THE SELECT STATMENT OUTPUT
        --ROWNUM IS DYNAMIC VALUE
        --ROWNUM NOT STORED IN DATABASE PERMENANTLY
        --ROWNUM RETURNS POSISTION OF RECORD
        --ON ROWNUM PSEUDO COLUMN =,>,>=,BETWEEN,NOT BETWEEN ETC... OPERATORS ARE NOT SUPPORTED
        --AFTER SELECTING DATA FROM DB TABLES THEN ROWNUMS ARE GENERATED
        SELECT ROWNUM,EMPNO,ENAME,DEPTNO FROM EMP;
        SELECT ROWNUM,EMPNO,ENAME,DEPTNO FROM EMP WHERE DEPTNO=10;
        --FROM ABOVE 2 QUERIES WE CAN SEE ROWNUM IS NOT FIXED IT CHANGES QUERY TO QUERY
        --WAQ TO DISPLAY FIRST TWO RECORDS FROM THE TABLE
        SELECT * FROM EMP WHERE ROWNUM<=2;
        
    
    
--SET OPERATOR:
    --UNION:
        --IT IS ONE OF THE ORACLE SET OPERATOR
        --SET OPERATOR ARE USED TO JOIN SELECT STATEMNET OUTPUTS
        --UNION IS ONE OF THE SET OPERATOR AND IT DISPLAYS MATCHING RECORDS FROM TABLE1 AND TABLE2 AND UNMATCHED RECORDS FROM BOTH TABLES
        SELECT JOB FROM EMP WHERE DEPTNO=10 UNION SELECT JOB FROM EMP WHERE DEPTNO=20;
                
        
        
--SET OPERATOR:
    --USED TO JOIN OUTPUTS OF SELECT STATEMENTS
    --MINUS IS ONE OF THE SET OPERATOR AND IT DISPLAYS UNMATCHED RECORDS FROM QUERY1, COMPARE TO QUERY2
    --EXAMPLE:  A={1,3,5,6} B={2,3,4,5}
    --                  A-B={1,6}
    --IT DISPLAYS UNMATCHED ELEMENTS FROM A COMPARED TO B
    --EXAMPLE:
    --WAQ TO DISPLAY LAST TWO RECORDS FROM THE TABLE
    SELECT ROWNUM,EMP.* FROM EMP MINUS SELECT ROWNUM,EMP.* FROM EMP WHERE ROWNUM<=(SELECT COUNT(*)-2 FROM EMP);
    --WAQ TO DISPLAY MIDDLE RECORD FROM THE TABLE
    SELECT ROWNUM,EMP.* FROM EMP WHERE ROWNUM<=(SELECT TRUNC(COUNT(*)/2) FROM EMP) MINUS SELECT ROWNUM,EMP.* FROM EMP WHERE ROWNUM<(SELECT TRUNC(COUNT(*)/2) FROM EMP);
    --WAQ TO DISPLAY TOP 5 MAX SALARIES
    SELECT ROWNUM,SAL FROM(SELECT SAL FROM EMP ORDER BY SAL DESC) WHERE ROWNUM<=5;
    --WAQ TO DISPLAY NTH MAXIMUM SALARY
    SELECT ROWNUM,SAL FROM(SELECT SAL FROM EMP ORDER BY SAL DESC) GROUP BY ROWNUM, SAL HAVING ROWNUM=&n;
    --WAQ TO DISPLAY ALTERNATIVE RECORDS(EVEN RECORDS)
    SELECT ROWNUM,EMPNO,ENAME,JOB,SAL FROM EMP GROUP BY ROWNUM,EMPNO,ENAME,JOB,SAL HAVING MOD(ROWNUM,2)=0 ORDER BY ROWNUM;
    --WAQ TO DISPLAY BANK MINI STATEMENT
    SELECT * FROM BANK_TRANS;
    SELECT * FROM (SELECT ACCNO,TDATE,TTYPE,TAMOUNT FROM BANK_TRANS WHERE ACCNO='SBI001' ORDER BY TDATE DESC ) WHERE ROWNUM<=5;
    INSERT INTO BANK_TRANS VALUES('SBI001','26-08-2023','S',300);
    
    
        --LEVEL:
            --IT WILL ARRANGE SELECT STATEMENT OUTPUT WITH INVERTED TREE STRUCTURE
            --IT RETURNS A NUMBER
            --IT DEPENDS UPON HIERARCHIAL QUERIES
        --HIERARCHIAL QUERIES:
            --THESE ARE THE QUERIES THAT ARE EXCECUTED UPON THE TABLES THAT CONTAINS HIERARCHIAL DATA
            --IF ANY TABLE SUPPORTS SELF RELATION THAT TYPE OF TABLE IS CALLED AS SELF-RELATION
            --TO WRITE THE HIERARCHIAL QUERIES WE NEED THE FOLLOWING
            --(I)START WITH CLAUSE:
                --IT IS USED TO IDENTIFIES ROOT NODE OF THE HIERARCHY
                --IF START WITH IS OMITTED THE ORACLE USED ALL ROWS IN THE TABLE AS ROOT ROWS
            
            --(II)CONNECT BY PRIOR:
                --IT IS USED TO ESTABLSIH RELATIONSHIP B/W PARENT NODE AND CHILD NODE OF HIERARCHY
                --AFTER CONNECT BY CLAUSE TO WRITE A CONDITION, THAT CONDITION SHOULD CONTAIN COMPARISION OPERATORS
           
            --(III)WHERE CLAUSE:
                --USED TO FILTER THE DATA WITHOUT AFFECTING OTHER ROWS OF THE HIERARCHY
            
            --EX: WAQ TO DISPLAY KING's EMPLOYEE HIERARCHY
                SELECT LEVEL, ENAME FROM EMP START WITH ENAME='KING' CONNECT BY PRIOR EMPNO=MGR;
         
            --SYS_CONNECT_BY_PATH():
                --IT IS ONE OF THE ORACLE PREDEFINED PROCEDURE
                --IT DISPLAYS OUTPUT WITH HIERARCHIAL FORMAT
                --SELECT SYS_CONNECT_BY_PATH(ENAME,'\') AS ORG_CHART FROM EMP START WITH ENAME='KING' CONNECT BY PRIOR EMPNO=MGR;
            
            --EXAMPLE FOR LEVEL PSEUDO COLUMN:
                SELECT LEVEL,ENAME FROM EMP START WITH ENAME='KING' CONNECT BY PRIOR EMPNO=MGR;
                SELECT LPAD(ENAME,LENGTH(ENAME)+(LEVEL*2)-2) AS ORG_CHART FROM EMP START WITH ENAME='KING' CONNECT BY PRIOR EMPNO=MGR;
                
                       
            --CURRVAL & NEXTVAL:
                --BOTH PSEUDO COLUMNS ARE SUPPORTED IN SEQUENCES OBJECT
                
                --SEQUENCE:
                    --SEQUENCE ARE USED TO GENERATE SEQUENCE OF NUMBERS AUTOMATICALLY
                    --SEQUENCES ARE NOT RELATED TO ONE TABLE AND IT IS APPLICABLE FOR ANY TABLE
                    --SEQUENCES ARE SUPPORTS ONLY NUMERIC VALUES
                    --SUPPORTS 2 TYPES OF PSEUDO COLUMNS
                        --(I)CURRVAL => RETURNS CURRENT SEQUENCE VALUE
                        --(II)NEXTVAL => RETURNS COMING GENERATED SEQUENCE VALUE
                    --ALL CREATED SEQUENCES ARE STORED IN USER_SEQUENCES (SYSTEM TABLE)
                    --SYNTAX: CREATE SEQUENCE <SEQ_NAME> START WITH <VALUE> MINVALUE <VALUE> INCREMENT BY <VALUE> MAXVALUE <VALUE>
                    --        CACHE/NOCACHE CYCLE/NOCYCLE;
                    --EXAMPLE:
                    CREATE SEQUENCE MY_SEQ START WITH 1 INCREMENT BY 5 MAXVALUE 5 MINVALUE 1 CACHE 20KB NOCYCLE;
                    
                    
--JOINS:
    --TO RETRIEVE DATA FROM MORE THAN ONE TABLE IN A SINGLE QUERY
    --JOINS ARE BEST EXAMPLE FOR RELATIONAL DATABASE
    --SYNTAX:
        --SELECT TABLE1.COL1,T1.C2,T2.C1,T2.C2,... FROM TABLE1,TABLE2,.... WHERE T1.C1=T2.C1;
    --JOIN QUERIES ARE SUPPORTED ONLY SELECT STATEMENT
    --IF 'N' TABLES ARE JOINED THERE WILL BE MINUMUM N-1 JOIN CODITIONS ARE REQUIRED
    --JOIN QUERIES ARE MAINLY USED FOR TO GENERATE REPORTS LIKE INVOICES,SALARY STATEMENTS,DAILY REPORTS ETC...
    
    
--TYPES OF JOINS
    --ORACLE SUPPORTS 5 TYPES OF JOINS
    --EQUI JOIN/INNER JOIN
    --NON-EQUI JOIN
    --CARTESIAN JOIN
    --OUTER JOINS
    --SELF JOINS
--TO WRITE ANY TYPE OF EQUI JOIN,ORACLE RETURNSONE COMMON ERROR MESSAGE IS AMBIGUTY;
SELECT DEPTNO FROM EMP,DEPT;
--TO OVERCOME THIS ERROR MESSAGE PRECEEDING COLUMN NAMES TO USE TABLE NAMES OR TABLE ALIASE
    --EX: EMPLOYEE_MASTER_TABLE EMT,EMPLOYEE_TRNASCATION_TABLE ETT,ETC..
--BY USING TABLE ALIASES TO IMPROVE THE PERFORMANCE
--(I)EQUI JOIN/INNER JOIN:
    --TO RETREIVING DATA FROM MORETHAN 1 TABLE IN A SINGLE QUERY BY USING EQUALITY OPERATOR
    --TO WRITE EQUI JOIN QUERIES, JOINING TABLE SHOULD CONTAIN ATLEAST ONE SIMILAR COLUMN NAME
    --AND CORRESPONDING COLUMN DATATYPES SHOULD BE SAME
    --WAQ TO DISPLAY EMPLOYEE DETAILS AND DISPLY CORRESPONDING EACH EMPLOYEE DEPT DETAILS
        SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;
    --WAQ TO DISPLAY WHO ARE WORKING IN NEWYORK LOCATION
        SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND DEPT.LOC='NEW YORK';
    --WAQ TO DISPLAY WHO ARE WORKING IN ACCOUNT AND RESEARCH DEPT AND THEIR SALARIES >2000
        SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND DEPT.DNAME IN ('ACCOUNTING','RESEARCH') AND EMP.SAL>2000;
    --WAQ TO DISPLAY WHO ARE JOINED SALES DEPT IN 1981 YEAR
        SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND DEPT.DNAME='SALES' AND TO_CHAR(HIREDATE,'YYYY')=1981;
    SELECT * FROM BANK_MAS1;
    SELECT * FROM BANK_TRANS;
    UPDATE BANK_TRANS SET TTYPE='W' WHERE TDATE='01-09-2023';
    insert into bank_trans values('hdfc1','01-09-2023','W',300);
    --WAQ TO DISPLAY EACH CUSTOMER DETAILS AND EACH CUSTOMER TRANS. DETAILS FOR MONTH OF AUG 2023
        SELECT * FROM BANK_MAS1,BANK_TRANS WHERE BANK_MAS1.ACCNO=BANK_TRANS.ACCNO AND TO_CHAR(TDATE,'MM-YYYY')='08-2023'; 
    --WAQ TO DISPLAY SBI1 CUSTOMER DETAILS AND HIS TRANSACTION DETAILS FOR THE MONTH OF AUG 2023
        Select * from Bank_mas1,bank_trans where bank_mas1.accno=bank_trans.accno and bank_trans.accno='sbi1' and TO_CHAR(TDATE,'MM-YYYY')='08-2023'; 
    --WAQ TO DISPLAY LAST MONTH SBI1 CUSTOMER DETAILS AND HIS TRANS.DETAILS
        Select * from Bank_mas1,bank_trans where bank_mas1.accno=bank_trans.accno and bank_trans.accno='sbi1' and TO_CHAR(TDATE,'MM-YYYY')=To_char(add_months(sysdate,-1),'mm-yyyy');
    --WAQ TO DISPLAY LASTMONTH,CURR MONTH, TILL DATE SBI1 CUSTOMR DETAILS AND HIS TRANSACTION DETAILS
        Select * from bank_mas1,bank_trans where bank_mas1.accno=bank_trans.accno and bank_trans.accno='sbi1' and TO_CHAR(TDATE,'MM-YYYY')=To_char(sysdate,'MM-YYYY');
    
    --WAQ TO DISPLAY LASTMONTH SBI1 CUSTOMER HOWMANY WITHDRAWS ARE COMPLETED
        SELECT bank_mas1.accno,cname,ttype,COUNT(ttype) FROM BANK_MAS1,BANK_TRANS WHERE BANK_MAS1.ACCNO=BANK_TRANS.ACCNO 
        AND BANK_TRANS.ACCNO='sbi1' and bank_trans.ttype='W' 
        and TO_CHAR(TDATE,'MM-YYYY')=To_char(add_months(sysdate,-1),'mm-yyyy') group by bank_mas1.accno,cname,ttype;
   
    --WAQ TO DISPLAY CURR MONTH WHICH CUSTOMERS ARE COMPLETED MORE THAN 2 WITHDRAWS
        SELECT BANK_MAS1.ACCNO,CNAME,TTYPE,COUNT(TTYPE) FROM BANK_MAS1,BANK_TRANS 
        WHERE BANK_MAS1.ACCNO=BANK_TRANS.ACCNO 
        AND TO_CHAR(TDATE,'MM-YYYY')=TO_CHAR(SYSDATE,'MM-YYYY') 
        group by (bank_mas1.accno,cname,ttype) having count(ttype)>2 order by bank_mas1.accno;
        
        
--NON EQUI JOINS:
    --RETRIEVING DATA FROM MORETHAN ONE TABLE IN SINGLE QUERY WITHOUT USING EQUALS OPERATOR IN JOIN CONDITION
    --NON EQUI JOINS, JOIN CONITIONS ARE COMPARED WITH >,<.>=,<=,!=,BETWEEN,NOT BETWEEN ETC...
    --WAQ TO DISPLAY EMPLOYEE DETAILS AND CORRESPONDING EACH EMPLOYEE GRADES
    SELECT EMP.*,GRADE FROM EMP,SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;
    
    
--EXAMPLE FOR BOTH EQUI AND NON-EQUI JOINS:
    --WAQ TO DISPLAY EMPLOYEE NAME AND CORRESPONDING EMP DEPT.DNAME WITH GRADES
    SELECT ENAME,DNAME,GRADE FROM EMP,DEPT,SALGRADE WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
    
    
--CROSS JOIN:
    --TO RETREIVING DATA FROM MORETHAN ONE TABLE IN A SINGLE QUERY WITHOUT USING ANY CONDITION
    --IN CROSS JOIN O/P DISPLAYS LIKE NO.OF RECORDS IN TABLE1 * NO.OF RECORDS IN TABLE2
        --EX: TABLE1=8 ROWS AND TABLE2= 10ROWS CROSS JOIN DISPLAYS 80ROWS
        SELECT * FROM EMP,DEPT;
        
        
--OUTER JOINS:
    --IN THIS JOINS, FIRST DISPLAYS MATCHING RECORDS FROM TABLE1 AND TABLE2 , UNMATCHED RECORDS FROM TABEL1 ND TABLE2
    --CLASSIFIED INTO 3 TYPES 
        --RIGHT OUTER JOIN
        --LEFT OUTER JOIN
        --FULL OUTER JOIN
    --FROM ORACLE 10G ONWARDS OUTER REPRESNETED WITH + SYMBOL
    
    --RIGHT OUTER JOIN:
        --IN THIS JOIN IT DISPLAYS MATCHING RECORDS FROM TABLE1,TABLE2 
        --AND UNMATCHED RECORDS FROM RIGHT SIDE OF TABLE JOIN CONDITION
        --EXAMPLE: 
            SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO(+)=DEPT.DEPTNO;
    
    --LEFT OUTER JOIN:
        --IN THIS JOIN IT DISPLAYS MATCHING RECORDS FROM TABLE1,TABLE2 
        --AND UNMATCHED RECORDS FROM LEFT SIDE OF TABLE JOIN CONDITION
        SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO(+);
        
    --NOTE: IF JOINING TABLES ARE MAINTAINING PRIMARY KEY AND FOREIGN KEY RELATIONSHIP 
    --THEN LEFT OUTER JOIN RETURNS EQUI JOIN OUTPUT
    
    --FULL OUTER JOIN:
        --IN THIS JOINS, IT DISPLAYS MATCHING RECORDS FROM TABLE1,TABLE2 AND UNMATCHED RECORDS FROM BOTH TABLES
        --FULL OUTER JOIN = LEFT OUTER JOIN + RIGHT OUTER JOIN
        --EXAMPLE:
            SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO(+)=DEPT.DEPTNO
                                   UNION
            SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO(+);
            
            

--SELF JOIN:
    --TO JOIN THE TABLES IT-SELF IS CALLED AS SELF JOIN
    --TO WRITE SELF JOIN QUERIES, TABLE ALIASES ARE MANDATORY
    --WAQ TO DISPLAY SUPERIORS AND THEIR SUBORDINATES
        SELECT M.ENAME AS BOSS_NAME, E.ENAME AS EMPLOY_NAME FROM EMP M,EMP E WHERE M.EMPNO=E.MGR;
    --WAQ TO DISPLAY WHO ARE GETTING MORE THAN THEIR BOSS SALARY
        SELECT E.ENAME AS EMP_NAME, E.SAL AS EMP_SAL, M.ENAME AS BOSS_NAME, M.SAL AS BOSS_SAL FROM EMP M,EMP E WHERE M.EMPNO=E.MGR AND E.SAL>M.SAL;
    --WAQ TO DISPLAY WHO ARE JOINED BEFORE JOINING OF THEIR BOSSES
        SELECT E.ENAME AS EMP_NAME, E.HIREDATE AS EMP_JOINED,M.ENAME AS BOSS_NAME,M.HIREDATE AS BOSS_JOINED FROM EMP M,EMP E WHERE M.EMPNO=E.MGR AND E.HIREDATE<M.HIREDATE;
    
    
--ORACLE 9I JOINS:
    --ORACLE 9I JOINS ARE ALSO CALLED AS ANSI(AMERICAL NATIONAL STANDARD INSTITUTE) JOINS
    --ORACLE 9I SUPPORTS 8 TYPES OF JOINS
        --(I)NATURAL JOIN
        --(II)JOIN WITH USING
        --(III)JOIN WITH ON
        --(IV)INNER JOIN
        --(V)RIGHT OUTER JOIN
        --(VI)LEFT OUTER JOIN
        --(VII)FULL OUTER JOIN
        --(VII)CROSS JOIN
    --FIRST (I) TO (IV) RETURNS EQUI JOIN OUTPUTS
    
    
    --(I)NATURAL JOIN: 
        --TO WRITE NATURAL JOIN,JOINING TABLE SHOULD CONTAIN ATLEAST ONE SIMILAR COLUMN NAME
        --OTHERWISE IT RETURNS CROSS JOIN OUTPUT
        SELECT * FROM EMP NATURAL JOIN DEPT;
        SELECT * FROM DEPT NATURAL JOIN SALGRADE; --IT DONT HAVE SIMILAR COLUMN SO RETURNS CROSS JOIN OUTPUT
        
    --(II)JOIN WITH USING:
        --TO WRITE JOIN WITH USING, JOINING TABLES SHOULD BE CONTAIN ATLEAST ONE SIMILAR COLUMN NAME OTHERWISE IT RETURNS CROSS JOIN O/P
        SELECT * FROM EMP JOIN DEPT USING(DEPTNO);
        
    --(III)JOIN WITH ON:
        SELECT * FROM EMP JOIN DEPT ON (EMP.DEPTNO = DEPT.DEPTNO);
        
    --(IV)INNER JOIN:
        SELECT * FROM EMP INNER JOIN DEPT ON(EMP.DEPTNO=DEPT.DEPTNO);
        
    --(V)RIGHT OUTER JOIN:
        --IN THIS JOINS IT DISPLAYS MATCHING RECORDS FROM BOTH TABLES AND UNMATCHED RECORDS FROM RIGHT TABLE
        SELECT * FROM EMP RIGHT OUTER JOIN DEPT ON (EMP.DEPTNO=DEPT.DEPTNO);
        
    --(VI)LEFT OUTER JOIN:
        --IN THIS JOINS IT DISPLAYS MATCHING RECORDS FROM BOTH TABLES AND UNMATCHED RECORDS FROM LEFT TABLE
        SELECT * FROM EMP LEFT OUTER JOIN DEPT ON (EMP.DEPTNO=DEPT.DEPTNO);
    
    --(VIII)CROSS JOIN:
        --TO JOIN THE TABELS WITHOUT ANY CONDITIONS
        --DEPT: DEPTNO,DNAME,LOC
        --EMP: EMPNO,ENAME,SAL,DEPTNO
        --SHIFT: SHIFTID,SHIFTNAME
        --TASK: TID,TNAME
        --TRANS: TNO,TDATE,EMPNO,DEPTNO,TID,SHIFTID,STATUS
        --WAQ TO DISPLAY EMPNO,ENAME,SAL,DEPTNO,DNAME,LOC,SHIFTID,SHIFTNAME,TID,TNAME,STATUS AND WHICH EMPLOYEES ARE COMLETED TASK TODAY
        --SELECT E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME,D.LOC,S.SHIFTID,S.SHIFTNAME,T.TID,T.TNAME,TR.REMARKS
        --FROM EMP E,DEPT D,TASK T, TRANS TR, SHIFT S WHERE
        --E.DEPTNO=D.DEPTNO AND S.SHIFTID=TR.SHIFTID AND T.TID=TR.TID AND TR.EMPNO=E.EMPNO;



--(IV)DCL COMMANDS:
    --THIS LAUNGUAGE COMMANDS ARE USED TO CONTROL THE DATA IN BETWEEN USERS
    --THERE ARE 2 TYPES OF DCL COMMANDS
    --(I)GRANT      (II)REVOKE
    
    --GRANT:
        --THIS COMMAND USED TO GRANT THE PERMISSIONS ON DB OBJECTS TO DIFFERENT USERS
        --SYNTAX:
--             GRANT <PERMISSION/PRIVILAGES> ON <DB OBJECT> TO <USER1>,<USER2>,.....<USERN>;
    
    --REVOKE
        --USED TO REVOKE THE GRANTED PERMISSIONS
        --SYNTAX:
                --REVOKE <PERMISSION/PRIVILIGES> ON <DB OBJECTS> FROM <USER1>,....<USERN>;
    
    --TO PRACTICE DCL COMMANDS WE MUST CONTAINS TWO USERS
    --TO SEE THE GRANTED PERMISSIONS
    SELECT * FROM USER_TAB_PRIVS_MADE;
    --TO SEE THE RECEIVED PERMISSIONS
    SELECT * FROM USER_TAB_PRIVS_RECD;
    
    


--(V)TCL COMMANDS:
    --THIS LAUNGUAGE COMMANDS ARE USED TO CONTROL DML TRANSACTIONS ONLY
    --3TYPES ARE THERE
    --(I)COMMIT     (II)SAVEPOINT       (III)ROLLBACK
    
    
    --COMMIT:
        --THIS COMMAND IS USED TO SAVE DML OPERATIONS INTO DATABASE PERMANANTLY
        --THERE ARE 2 TYPES OF COMMITS
        --(A)IMPLICIT COMMIT
                    --IT IS PERFORMED BY ORACLE IMPLICITLY
                    --EX: DDL COMMANDS(CREATE, ALTER, RENAME, TRUNCATE, DROP)
        
        --(B)EXPLICIT COMMIT
                    --IT IS PERFORMED BY USER EXPLICITELY
                    --EX:DML COMMANDS(INSERT, UPDATE,DELETE,MERGE)
    
    
    --SAVEPOINT:
        --USED TO CREATE BOOKMARK
        --SYNTAX:   SAVEPOINT <SAVEPOINT NAME>;
        
        
    --ROLLBACK:
        --USED TO UNDO DML TRANSACTIONS ONLY
        --AFTER COMMIT WHATEVER DML TRANSACTIONS EXCECUTED ALL ARE UNDO
        
    
--DATABASE OBJECTS(DB OBJECTS):
    --A COMPONENT AUTOMATICALLY REGISTERED IN SYSTEM SOFTWARE 
    --EX:TABLES,VIEWS,INDEXES,SEQUENCES,SYNONUMS,ROLES,ETC..
    
    --TABLE:
        --TABLE IS A COLLECTION OF INFORMATION STORED ROWS AND COLUMNS FORMAT
        --MAXIMUM 1000 COLUMNS ARE ALLOWED AND UNLIMITED RECORDS PER TABLE
        --IT IS COMMON DB OBJECT FOR ANY RELATIONAL DATABASES
        
    --VIEWS:
        --IT IS ONE OF THE VIRTUAL DB OBJECT
        --VIEWS ARE CREATED BY USING SELECT STATEMENT OUTPUT
        --VIEWS ARE BASED ON BASE TABLE
        --VIEWS DOESNT HOLD ANY DATA AND IT REPRESENTS ONLY STRUCTURE
        --VIEWS PROVIDES SECURITY ON DB TABLES
        --BY USING VIEWS WE CAN HOLD MULTIPLE TABLES INFORMATION INTO SINGLE VIEW
        --TO PERFORM ANY DML COMMANDS ON VIEWS THAT ARE REFLECTED ON BASE TABLE AND VICE VERSA
        
    --VIEW SYNTAX:
        --CREATE OR REPLACE VIEW <VIEW NAME> AS <SELECT STATEMENT>;
    
    --TYPES OF VIEWS:
        --4 TYPES OF VIEWS
            --(I)SIMPLE VIEWS
                --THESE VIEWS ARE CREATED BY SELECT DOESNT CONTAIN JOIN CONDITIONS,AGGREGATE FUNCTIONS,GROUP BY OR HAVING CLAUSE
                                            --(OR)
                --TO CREATE THE VIEWS ON SINGLE TABLE IS CALLED AS SIMPLE VIEWS  
                --EX: 
                    CREATE OR REPLACE VIEW MY_VIEW AS SELECT * FROM EMP;
                    SELECT * FROM MY_VIEW;
                    DESC MY_VIEW;
                --INSERTING INTO MY_VIEW:
                    INSERT INTO MY_VIEW VALUES(1001,'VIEW_EX','MANAGER',7839,SYSDATE,4000,100,10);
                    SELECT * FROM EMP;
                    SELECT * FROM MY_VIEW;  
            `   --UPDATE COMMAND ON MY_VIEW:
                    UPDATE MY_VIEW SET SAL=SAL+100;
                    SELECT * FROM EMP;
                    SELECT * FROM MY_VIEW; 
                --READ ONLY VIEWS:
                    --THESE VIEWS ARE ONLY FOR READING PURPOSE
                    --DML COMMANDS ARE NOT SUPPORTED
                    --ONLY SELECT AND DESC COMMANDS ARE VALID
                    --SYNTAX: CREATE OR REPLACE VIEW <VIEWNAME> AS <SELECT CONDITION> WITH READ ONLY;
                
            --(II)COMPLEX VIEWS
                --THESE VIEWS ARE CREATED BY SELECT STATEMENT CONTAINS JOIN CONDITION OR ARTHIMETIC EXPRESIONS, GROUP BY, HAVING CLAUSE ETC..
                --                          (OR)
                --TO CREATE THE VIEW BY USING MORETHAN ONE TABLE
                --ON COMPLEX USE DML COMMANDS ARE NOT SUPPORTED
                --ONLY SELECT,DESC COMMANDS ARE VALID
                --BY USING COMPLEX VIEWS WE CAN HOLD MULTIPLE TABLE INFORMATION INTO SINGLE TABLE
                --EXAMPLE:
                    CREATE OR REPLACE VIEW EMPDEPT AS SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,D.DEPTNO,D.DNAME,D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
                    SELECT * FROM EMPDEPT;
                    
                --UPDATE ON COMPLEX VIEWS
                    UPDATE EMPDEPT SET ENAME='FORD' WHERE ENAME='HEMANTH';
                    --NOT SUPPORTED
                    --NOT ONLY UPDATE, INSERT ALSO NOT WORK
            
            
            --(III)FORCE VIEWS
                --THESE VIEWS ARE CREATED WITHOUT HAVING BASE TABLE
                --FORCE VIEWS ARE ACTIVATED WHENEVER BASETABLE IS CREATED
                --CREATE A FORCE VIEW
                    --CREATE OR REPLACE FORCE VIEW F_VIEW AS SELECT * FROM EMP123;
                    
            
            
            --(IV)MATERIALIZED VIEWS
                --TO STORE THE DATA IN VIEWS ARE CALLED AS MATERIALIZED VIEWS
            
            
            --VIEWS PROVIDES SECURITY:
                --TO PROVIDE THE SECURITY TO CREATE A VIEW ON EMP TABLE
            
    --22 DECEMBER 40MIN ONWARDS
    
        --INDEXES:
            --INDEXES ARE USED TO IMPROVES THE PERFORMANCE WHILE RETRIEVING OR MANIPULATING DATA
            --INDEXES ARE ACTIVATED WHENEVER INDEXED COLUMN IS PLACED IN WHERE CLAUSE OF SELECT STATEMENT
            --INDEXES ARE ALSO ACTIVATED WHEN THE TABLES ARE MANIPULATED BY OTHER USERS OR OTHER APP. SOFTWARE TOOLS
            --ALL CREATED INDEXES ARE STORED USER_INDEXES TABLES(SYSTEM TABLE)
            --BASICALLY INDEXES ARE TWO TYPES
                --I.IMPLICIT INDEX:
                    --THESE INDEXES ARE CREATED BY SYSTEM IMPLICITELY
                    --EX: PRIMARY KEY & UNIQUE CONSTRAINTS
                
                --II.EXPLICIT INDEX:
                    --THESE INDEXES ARE CREATED BY USER EXPLICITELY
                    --CLASSIFIED INTO DIFFERENT TYPES
                        --(A).NORMAL INDEXES:
                            --THESE INDEXES ARE CREATED ON NORMAL DB COLUMNS
                            --CREATE INDEX <INDEX_NAME> ON <TABLENAME>(COL1,COL2,....);
                            CREATE INDEX EMPNO_INDEX ON EMP(EMPNO);
                            SELECT * FROM EMP WHERE EMPNO=7934;
                        
                        --(B).COMPOSITE INDEX:
                            --TO CREATE INDEX ON MORE THAN ONE COLUMN
                            --IN COMPOSITE INDEXES MAX 32 COLUMNS ARE SUPPORTED
                            --EX:
                            CREATE INDEX COMP_IND ON EMP(DEPTNO,JOB);
                            
                        --(C).FUNCTIONAL BASED INDEXES:
                            --THESE INDEXES ARE CREATED BY USING BUILT IN FUNCTIONS
                        
                        --(D).UNIQUE INDEXES:
                            --THESE INDEXES ARE CREATED ON UNIQUE DATA COLUMNS
                            --THIS INDEX IS ADDED BY DEFAULT AT THE TIME OF DECLARING PRIMARY KEY/UNIQUE CONSTRAINT
                            --EX:   CREATE UNIQUE INDEX UNI_IND_EMPID ON EMP(EMPID);\
                        --NOTE: IF ANY COLUMN CONTAINS UNSTRUCTURED DATA TYPE THEN INDEXES ARE NOT CREATED
                        --TO SEE THE CREATED INDEXES NAME
                            SELECT * FROM USER_INDEXES;
                        --TO DROP INDEXES
                            --DROP INDEX <INDEXNAME>
                            
        --SEQUENCES:
            --USED TO GENERATE SEQUENCE OF NUMBERS AUTOMATICALLY
            --SEQUENCES ARE SUPPORTS ONLY NUMERIC VALUES
            
        --SYNONYMS:
            --SYNONYM IS ANOTHER NAME FOR GIVEN TABLE NAME
            --SYNONYMS ARE CREATED ON ENTIRE TABLE
            --SYNONYMS SUPPORTS DML,SELECT & DESCRIBE COMMANDS
            --SYNONYMS PROVIDES HIGH SECURITY COMPARED TO VIEWS
            --ALL CREATED SYNONYMS ARE STORED IN USER_SYNONYMS TABLE
            --SYNTAX:   CREATE SYNONYM <SYNONYM NAME> FOR <TABLENAME>;
            
            --INSERT INTO SYNONYM:
                --INSERT INTO <SYNONYM NAME> VALUES();
                        
                
        --ROLES: 
            --ROLE IS A COLLECTION OF DIFFERENT OBJCT PRIVILIGES ON DIFFERENT DB OBJECTS
            --IT IS CREATED BY DBA 
            --SYN: CREATE ROLE <ROLENAME>;
            --GRANT PERMISSIONS:    GRANT SELECT,INSERT ON <USERNAME>.<TABLE/VIEW NAME> TO <ROLENAME>;
            --REVOKE: REVOKE <COMMANDS> ON <USERNAME>.<MY_SYN> FROM <ROLENAME>;
            
            
            
            
--OBJECT TECHNOLOGY:
    --OBJECT IS A COLLECTION OF ELEMENTS OF DIFFERENT DATATYPES STORED AT ONE LOCATION
    --OBJECTS ARE SUPPORTED METHODS(FUNCTIONS)
    --OBJECT SUPPORTS ONLY DESC COMMAND
    --OBJECTS DOESNT HOLD ANY DATA AND IT REPRESENTS ONLY STRUCTURE
    --OBJECTS ARE REUSABLE COMPONENTS
    --OBJECTS ARE STORED IN DATABASE PERMANANTLY
    --ALL CREATED OBJECT NAMES ARE STORED IN USER_TYPES (SYSTEM TABLE)
    SELECT * FROM USER_TYPES;
    --SYNTAX:
--        CREATE OR REPLACE TYPE <TYPE_NAME> AS OBJECT(
--            ELE1 DATATYPE(SIZE),
--            ELE2 DATATYPE(SIZE),
--            .
--            .
--            .
--        );
--        /
    --CREATE A OBJECT WITH HNO,STREET,CITY AND PINCODE
    CREATE OR REPLACE TYPE ADDRESS_OBJ AS OBJECT(
        HNO VARCHAR2(10),
        STREET VARCHAR2(20),
        CITY VARCHAR2(20),
        PINCODE NUMBER(6)
    );
    /
    DESC ADDRESS_OBJ;
    
    --CREATE A EMPLOYEE DB USIND ADDRESS_OBJ
    SELECT * FROM EMPLOYEE_DB;
    DESC EMPLOYEE_DB;
    INSERT INTO EMPLOYEE_DB VALUES(1001,'RAKESH',ADDRESS_OBJ('1-212','NEAR ANDRA BANK','MLCR',508246),9110384788);
    
    --UPDATING OBJECT COLUMNS:
        UPDATE EMPLOYEE_DB E SET E.ADDRESS.CITY='MELLACHERUVU' WHERE E.EMPID='1001';
    
    --OBJECTS ARE REUSABLE COMPONENTS:
        --CREATE A STUDENT DATABASE TABLE WITH STUDENT ID, STUDENT NAME, CLASS, PRESENT ADDRESS & PERMANENT ADDRESS
            SELECT * FROM STUDENT_DB;
            DESC STUDENT_DB;
            
    --OBJECTS ARE SUPPORTS METHODS(USER_DEFINED FUNCTIONS):
        --CREATE A MARKS OBJECT WITH MATHS,PHY,CHEM AND TWO METHODS
        --PL SQL
        CREATE OR REPLACE TYPE MARKS_OBJ AS OBJECT
        ( MATHS NUMBER(6,2),
          PHY NUMBER(6,2),
          CHEM NUMBER(6,2),
          MEMBER FUNCTION TOT RETURN NUMBER,
          MEMBER FUNCTION RES RETURN VARCHAR2
        );
        /
        DESC MARKS_OBJ;
        
    --METHOD DEFINATIONS:
        CREATE OR REPLACE TYPE BODY MARKS_OBJ 
                         AS
          MEMBER FUNCTION TOT RETURN NUMBER
                         IS
            BEGIN RETURN(MATHS+PHY+CHEM);
                        END TOT;
          MEMBER FUNCTION RES RETURN VARCHAR2
                         IS
                      T NUMBER;
                BEGIN T:=MATHS+PHY+CHEM;
        IF MATHS<35 OR PHY<35 OR CHEM<35 THEN
                    RETURN('FAIL');
          ELSIF T>=180 THEN RETURN ('GRADE A');
      ELSIF T>=150 AND T<180 THEN RETURN ('GRADE B');
      ELSIF T>=120 AND T<150 THEN RETURN ('GRADE C');
                ELSE RETURN('GRADE D');
                        END IF;
                        END RES;
                          END;
                           /
    --CREATE A STUDENT TABLE WITH MARKS OBJECT:
    SELECT * FROM STUDENT_DB;
    DESC STUDENT_DB;
    --INSERTING DATA INTO STUDENT_DB
    INSERT INTO STUDENT_DB VALUES('S4','DEF','CLASS1',ADDRESS_OBJ('11','KKNI','GUNTUR',522502),ADDRESS_OBJ('11','KKNI','GUNTUR',522502), MARKS_OBJ(36,36,36));
    
    --CALLING METHODS:
    SELECT S.STUDENT_ID,S.STUDENT_NAME,S.MARKS.TOT() AS TOTAL,S.MARKS.RES() AS GRADE FROM STUDENT_DB S;
    
    --TO SEE THE CREATED OBJECT NAMES
        SELECT TYPE_NAME FROM USER_TYPES;
    
    --DROPPING OBJECTS:
        --DROP TYPE <OBJECTNAME>;
        
        
--SQL ADVANCED FEATURES:
--28 DEC VIDEO
    --INSERT ALL
        --TO INSERT DATA INTO MULTIPLE TABLES SAMETIME
        --MULTIPLE INSERTS:
            --SUPPORTS TO INSERT DATA INTO MORE THAN ONE TABLE AT a TIME BUT INPUT MUST BE RETRIEVED FROM EXISTING TABLE
            
        --CONDITIONAL INSERT
            --INSERTS DATA WHEN CONDITIONS ARE PASSED
        
    
    
    --MERGE STATEMENT:
        --USED TO MERGE TWO TABLES INFORMATION INTO SINGLE TABLE
        --28 DEC 26 MIN
        
    --NVL2(EXPR1,EXPR2,EXPR3): 
        --EXPR1 IS NOT NULL IT MANIPULATES EXPR2 OTHERWISE IT MANIPULATES EXPR3
        SELECT ENAME,SAL,COMM,NVL2(COMM,SAL+COMM,SAL) AS NET_PAY FROM EMP;
        
    --NULLIF(EXPR1,EXPR2):
        --IF EXPR1 & EXPR2 RESULTS ARE SAME THEN IT RETURNS NULL VALUE, OTHERWISE EXPR1 RESULT
        SELECT ENAME,NULLIF(DEPTNO,10) FROM EMP ORDER BY DEPTNO;
        
    --COALESCE(EXPR1,EXPR2,EXPR3,.......):
        --IT PICKS FIRST NOT NULL VALUE
        SELECT COALESCE(10+NULL,2*NULL,10/NULL,100,NULL,50) FROM DUAL;
        --WAQ TO DISPLAY EMPLOYEE BONUS BASED ON GIVEN CONDITIONS
            --(I)IF EMP GETTING COMMISSION ON COMM DOUBLE BONUS
            --(II)IF EMP IS NOT GETTING COMM ON SAL 5% BONUS
            SELECT ENAME,SAL,COMM,COALESCE(COMM*2,SAL*0.05) AS BONUS FROM EMP;
            
    --CASE IN SELECT:
        SELECT EMPNO,ENAME,JOB,SAL,
        CASE WHEN SAL>=5000 THEN 'EXCELLENT'
             WHEN SAL>=4000 THEN 'HIGH'
             WHEN SAL>=3000 THEN 'GOOD'
             WHEN SAL>=2000 THEN 'AVERAGE'
             ELSE 'POOR'
        END AS SALARY_STATUS FROM EMP;
        
        
    --TEMPORARY TABLES:
        --USED TO HOLD THE INFORMATION FOR A PARTICULAR PERIOD OF TIME IN LOGICAL
        --ON COMMIT DELETE ROWS: CONDITION MEANS IT HOLDS DATA UNTIL IT COMMITS
            CREATE GLOBAL TEMPORARY TABLE TEMP1(C1 DATE) ON COMMIT DELETE ROWS;
            INSERT INTO TEMP1 VALUES(SYSDATE);
            SELECT * FROM TEMP1;
            COMMIT;
            --AFTER COMMIT DATA GOT DELETED
        
        --ON COMMIT PRESERVE ROWS:
            --AFTER COMMIT ALSO RECORDS ARE AVAILABLE
            CREATE GLOBAL TEMPORARY TABLE TEMP2(C1 DATE) ON COMMIT PRESERVE ROWS;
            INSERT INTO TEMP2 VALUES(SYSDATE);
            SELECT * FROM TEMP2;
            COMMIT;
            --AFTER COMMIT ALSO DATA NOT DELETED
            
            
    --EXTRACT(DATETIME):
        --USED TO EXTRACTS DATE,TIME FROM THE EXPRESSION
        SELECT EXTRACT(YEAR FROM DATE'2001-11-30') YEAR FROM DUAL;
        --WAQ TO DISPLAY WHO ARE JOINED IN FIRST 15DAYS FROM JAN TO JUNE IN 1981,82 AND 83 YR
        SELECT * FROM EMP 
        WHERE (EXTRACT(DAY FROM HIREDATE) BETWEEN 1 AND 15) 
        AND (EXTRACT(MONTH FROM HIREDATE)BETWEEN 1 AND 6)
        AND (EXTRACT(YEAR FROM HIREDATE)IN (1981,1982,1983));
        
        
    --OLAP FUNCTION():
        --USED TO GENERATE REPORTS
        --USED FOR DATA WAREHOUSING, DATAMART APPLICATIONS AND BOTH BUSINESS AND IT DEPARTMENTS
        --ROLLUP():
            --A ROLLUP IS AN EXTENSION TO GROUP BY  CLAUSE USED TO CALCULATE AND RETURN SUBTOTALS AND GRAND TOTAL AS ROWS OF THE QUERY EFFICIENTLY
            --IF N IS THE NUMBER OF COLUMNS LISTED IN THE ROLLUP, THERE WILL BE N+1 LEVELS OF SUBTOTALS
            --EX:
                SELECT DEPTNO,SUM(SAL) FROM EMP GROUP BY DEPTNO;  --NORMAL GROUP BY FUNCTION
                SELECT DEPTNO,SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);  --ROLLUP GROUP BY FUNCTION
                SELECT DEPTNO,JOB,SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO,JOB);
                
                
                
        --CUBE():
            --IT IS EXTENSION TO ROLLUP
            --CUBE ENABLES A SELECT STATEMENT TO CALCULATE SUBTOTALS FOR ALL POSSIBLE COMBINATIONS OF GROUP OF DIMENSIONS
            --IF N IS NUMBER OF COLUMNS LISTING THE CUBE THERE WILL BE 2*N SUBTOTAL COMBINATIONS
            --EX:
                SELECT DEPTNO,JOB,SUM(SAL) FROM EMP GROUP BY CUBE(DEPTNO,JOB);
                
                
    --DECODE FUNCTION()
        --SIMILAR TO IF-THEN-ELSE, OR CASE STATEMENT
        --IF ALL CONDITIONS ARE FALSE DEFAULT EXCECUTED
        --THE FUNCTION HAS NO RESTRICTIONS ON INPUT AND OUTPUT DATATYPE.
        --SYNTAX: DECODE(EXPRESSION,CONDITION1,IF TRUE DATA,CONDITION2,IF TRUE DATA)
        --EX: WAQ TO FIND GIVEN NUMBER IS EVEN OR ODD
              SELECT DECODE(MOD(&n,2),0,'EVEN',1,'ODD') FROM DUAL;
        --WAQ TO DISPLAY EMP DETAILS AND CORRESPONDING EACH EMP DEPT NAME
            SELECT E.*,D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
            SELECT EMPNO,ENAME,SAL,DEPTNO,DECODE(DEPTNO,10,'ACCOUNTING',20,'RESEARCH',30,'SALES',40,'OPERATIONS','UNKNOWN') AS DNAME FROM EMP;
        --WAQ TO SWAP TWO ACCOUNT BALANCES
        SELECT * FROM BANK_DB;
        UPDATE BANK_DB SET BALANCE=DECODE(ID,'SBI1',(SELECT BALANCE FROM BANK_DB WHERE ID='SBI2'),
                                             'SBI2',(SELECT BALANCE FROM BANK_DB WHERE ID='SBI1'))
                                             WHERE ID IN('SBI1','SBI2');
                                             
           
    
    --RANKING FUNCTION:
        --THE FUNCTION WILL COMPUTE THE RANK OF EACH ROW RETURNED FROM A QUERY WITH RESPECT TO THE
        --     OTHER ROWS RETURNED BY THE QUERY AS DEFINED BY THE ORDER BY CLAUSE
        SELECT EMPNO,ENAME,SAL,RANK() OVER (ORDER BY SAL DESC) AS RANK FROM EMP;
        SELECT EMPNO,ENAME,SAL,RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANK FROM EMP GROUP BY EMPNO,ENAME,SAL,DEPTNO;
        
        
    --DENSE RANK:
        --RETURNS THE RANKS IN SEQUENCE, THERE IS NO GAP
        SELECT EMPNO,ENAME,SAL,DENSE_RANK() OVER (ORDER BY SAL DESC) AS RANK FROM EMP;
        --WAQ TO DISPLAY NTH MAXIMUM SALARY
        SELECT SAL,RANK FROM (SELECT SAL,DENSE_RANK() OVER(ORDER BY SAL DESC)RANK FROM EMP) WHERE RANK=&N;
          


--LIST AGG:
    SELECT DEPTNO,LISTAGG(ENAME,',')WITHIN GROUP (ORDER BY ENAME)
    FROM EMP GROUP BY DEPTNO;
     
     
     SELECT MGR,LISTAGG(ENAME,',') FROM EMP GROUP BY MGR;
     
     SELECT MGR,LISTAGG(ENAME,',') FROM EMP GROUP BY MGR HAVING MGR=7839;
     
     
     
     
     
     
     select * from emp;
     select * from dept;
     select * from salgrade;
       
            
    --CHECK ALL THE FILES THAT CONTAIN DOUBTS
    --DML 10,19,20,21           
   
      
    SELECT COALESCE(NULL+100,2*NULL,2,1,100-nULL) FROM DUAL;
    SELECT MGR,LISTAGG(ENAME,'->')FROM EMP GROUP BY MGR;
    
    (SELECT GRADE,AVG(SAL) FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL GROUP BY GRADE);
         
    SELECT TO_DATE('15 NOV 2020','DD MON YYYY') FROM DUAL; 
    SELECT 'RAKESH IS BOSS OF '||ENAME FROM EMP;
    SELECT 'RAKESH '||CASE
        WHEN ENAME='KING' THEN 'IS SUBORDINATE OF '
        WHEN ENAME!='KING' THEN 'IS BOSS OF '
    END||ENAME FROM EMP;
    
    SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY')=1981 AND TO_CHAR(HIREDATE,'Q')IN(1,2);
    
    
    SELECT CASE WHEN TO_CHAR(HIREDATE,'YYYY')=1981 THEN '81ST YEAR EMPLOYEE'
                WHEN TO_CHAR(HIREDATE,'YYYY')=1982 THEN '82ST YEAR EMPLOYEE'
                WHEN TO_CHAR(HIREDATE,'YYYY')=1983 THEN '83ST YEAR EMPLOYEE'
                               ELSE 'NOT IN LIST'
                                    END FROM EMP;
    
    
    
    SELECT * FROM EMP WHERE
    SAL IN(SELECT DISTINCT SAL FROM EMP WHERE JOB='MANAGER'
    UNION
    (SELECT SAL FROM EMP WHERE JOB='CLERK' AND EMPNO IN(SELECT MGR FROM EMP WHERE MGR IS NOT NULL GROUP BY MGR))
    UNION
    (SELECT COMM AS SAL FROM EMP E,DEPT D,SALGRADE S WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND COMM IS NOT NULL AND JOB='SALESMAN' AND DNAME='SALES' AND GRADE IN(1,2,3))
    UNION
    (SELECT DISTINCT ROUND(M.SAL/3) AS SAL FROM EMP E,EMP M,SALGRADE S WHERE E.MGR=M.EMPNO AND M.SAL BETWEEN LOSAL AND HISAL AND GRADE IN(4,5)));
    
----------------------------------------------------------------------------------------------------------------------------------------------------

--WITH CLAUSE

    --EMPLOYEE DEPT COUNT AND MANAGER DEPT COUNT
    with dept_count as (
    select deptno, count(*) as dept_count
    from   emp
    group by deptno)
    select e.ename as employee_name,
       dc1.dept_count as emp_dept_count,
       m.ename as manager_name,
       dc2.dept_count as mgr_dept_count
    from   emp e,
       dept_count dc1,
       emp m,
       dept_count dc2
    where  e.deptno = dc1.deptno
    and    e.mgr = m.empno
    and    m.deptno = dc2.deptno;
    
    --MORE EXAMPLES USING WITH CLAUSE
    --DISPLAY ONLY MGR DETAILS
        WITH EX AS(SELECT MGR FROM EMP)
        SELECT * FROM EMP WHERE EMPNO IN (SELECT MGR FROM EX);
    
    
    --WAQ TO DISPLAY WHICH DEPT SAL>AVG OF TOTAL DEPTS SAL
        with 
        dept_costs as (
        select dname, sum(sal) dept_total
        from  emp e, dept d
        where  e.deptno = d.deptno
        group by dname),
        avg_cost as (
        select sum(dept_total)/count(*) avg
        from   dept_costs)
        select *
        from   dept_costs
        where  dept_total > (select avg from avg_cost)
        order by dname;
    
    --SELECT WHICH DEPT HAS HIGHEST EMPLOYEES
        WITH DC AS(SELECT DEPTNO,COUNT(*)AS COUNT FROM EMP GROUP BY DEPTNO ORDER BY COUNT DESC)
        SELECT * FROM DC GROUP BY ROWNUM,DEPTNO,COUNT HAVING ROWNUM=1;
    
    --SELECT WHICH DEPT HAS LEASE EMPLOYEES
        WITH DC AS (SELECT DEPTNO,COUNT(*)AS COUNT FROM EMP GROUP BY DEPTNO ORDER BY COUNT)
        SELECT * FROM DC GROUP BY ROWNUM,DEPTNO,COUNT HAVING ROWNUM=1;
    
    --DISPLAY ALL GRADE 3 EMPLOYEES
        WITH GRADE3 AS(SELECT E.*,GRADE FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=3)
        SELECT * FROM GRADE3;
        
    --DISPLAY SENIOR MOST EMPLOYEE OF GRADE 4
        WITH GRADE4 AS(SELECT E.* FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=4 ORDER BY HIREDATE)
        SELECT * FROM GRADE4 GROUP BY ROWNUM,EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO HAVING ROWNUM=1;
    
    --DISPLAY ALL THE DETAILS OF RESEARCH DEPT EXCEPT THE LOWEST PAID EMPLOYEE
        WITH RES AS(SELECT DEPTNO FROM DEPT WHERE DNAME='RESEARCH'),
        MINSAL AS(SELECT MIN(SAL)FROM EMP WHERE DEPTNO=(SELECT * FROM RES))
        SELECT * FROM EMP WHERE DEPTNO=(SELECT * FROM RES) AND SAL!=(SELECT * FROM MINSAL);
        
    --DISPLAY SENIOR MOST EMPLOYEE WHO IS MANAGER TO OTHER
        WITH M AS(SELECT MGR FROM EMP),
        H AS(SELECT MIN(HIREDATE)FROM EMP WHERE EMPNO IN(SELECT * FROM M))
        SELECT * FROM EMP WHERE HIREDATE=(SELECT * FROM H);
        

---------------------------------------------------------------------------------------------------------------------

--SQL SUBQUERIES:
    --1.Display the details of employees whose salary more than james salary and less than kings  
    --  salary but should not equal to sal of miller and adams in the descending order of salary. 
        SELECT * FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='JAMES')
        AND SAL<(SELECT SAL FROM EMP WHERE ENAME='KING') AND 
        SAL NOT IN(SELECT SAL FROM EMP WHERE ENAME IN('MILLER','ADAMS'))
        ORDER BY SAL DESC;
        
    --2.Display the jobs that are same as the jobs of employees of newyork but don't display newyork's jobs. (DOUBT)
        SELECT JOB FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='NEW YORK');
        
    --3.Display all grade 2,3 employees belongs to the department of King. 
        SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='KING')
        AND SAL BETWEEN(SELECT LOSAL FROM SALGRADE WHERE GRADE=2)
        AND (SELECT HISAL FROM SALGRADE WHERE GRADE=3);
        
    --4.Display the details of highest paid employees.  
        SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP);
        
    --5.Display the details of highest paid employee of accounting department. 
        SELECT * FROM EMP WHERE (DEPTNO,SAL)=
        (SELECT DEPTNO,MAX(SAL)FROM EMP WHERE DEPTNO=
        (SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING')
        GROUP BY DEPTNO);
        
    --6.Display the highest salary of accounting department. 
        SELECT MAX(SAL) FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING');
        
    --7.Display the details of highest paid employee of grade 3. 
        SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL)FROM EMP 
        WHERE SAL BETWEEN(SELECT LOSAL FROM SALGRADE WHERE GRADE=3)
        AND(SELECT HISAL FROM SALGRADE WHERE GRADE=3));
       
    --8.Display the details of senior most employee of grade 4. 
        SELECT E.* FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND 
        HIREDATE=(SELECT MIN(HIREDATE) FROM EMP
        WHERE SAL BETWEEN(SELECT LOSAL FROM SALGRADE WHERE GRADE=4)
        AND (SELECT HISAL FROM SALGRADE WHERE GRADE=4))
        AND GRADE=4;
        
    --9.Display the details of senior most employee of accounting department. 
        SELECT E.* FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO
        AND HIREDATE=(SELECT MIN(HIREDATE)FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING'))
        AND DNAME='ACCOUNTING';
        
    --10.Display the details of all employees of Research department except lowest paid employee of that department.
        SELECT E.* FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO
        AND DNAME ='RESEARCH' AND
        SAL NOT IN(SELECT MIN(SAL)FROM EMP WHERE DEPTNO IN(SELECT DEPTNO FROM DEPT WHERE DNAME ='RESEARCH')GROUP BY DEPTNO);
        
    --11.Display the details of senior most employee who is manager to other. 
        SELECT DISTINCT M.* FROM EMP M,EMP E WHERE E.MGR=M.EMPNO AND
        M.HIREDATE=(SELECT MIN(M.HIREDATE)FROM EMP E,EMP M WHERE E.MGR=M.EMPNO);
        
    --12.Display the details of lowest paid grade 4 employees.
        SELECT E.* FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL
        AND SAL IN(SELECT MIN(SAL)FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=4);
        
    --13.Display lowest paid employee of each job group. 
        SELECT * FROM EMP WHERE (JOB,SAL)IN(SELECT JOB,MIN(SAL)FROM EMP GROUP BY JOB);
        
    --14.Find out employees who joined 5th in company based in hiredate.
        SELECT ENAME FROM (SELECT * FROM EMP ORDER BY HIREDATE) GROUP BY ROWNUM,ENAME HAVING ROWNUM=5;
        
    --15.Find out top paid employee with annual salary.
        SELECT EMP.*,SAL*12 AS ANNUAL_SAL FROM EMP WHERE SAL=(SELECT MAX(SAL)FROM EMP);
        
    --16.Display department wise first joined employee based on the job.
        SELECT DEPTNO,JOB,ENAME,HIREDATE from EMP WHERE (DEPTNO,JOB,HIREDATE)IN
        (SELECT DEPTNO,JOB,MIN(HIREDATE)FROM EMP GROUP BY DEPTNO,JOB)ORDER BY DEPTNO;
        
    --17.Display all odd rows. 
        SELECT * FROM EMP GROUP BY ROWNUM,EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO HAVING MOD(ROWNUM,2)=1;
        
    --18.Display all even rows.
        SELECT * FROM EMP GROUP BY ROWNUM,EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO HAVING MOD(ROWNUM,2)=0;
        
    --19.Display the departments where there are atleast 2 grade 1,2 employees.
        SELECT DEPTNO,COUNT(*) FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL
        AND GRADE IN(1,2) GROUP BY DEPTNO HAVING COUNT(*)>=2;
        
    --20.Display the department that has highest number of employees
        SELECT * FROM (SELECT DEPTNO,COUNT(*)AS CNT FROM EMP GROUP BY DEPTNO 
        ORDER BY COUNT(*)DESC) GROUP BY ROWNUM,DEPTNO,CNT HAVING ROWNUM=1;
        
    --21.Display details of the departments where there are employees with 2 'A''s in their ename.
        SELECT DISTINCT DEPTNO FROM EMP WHERE ENAME LIKE '%A%A%';
    
    --22.Display departments where there are employees joined in the month of december. 
        SELECT DISTINCT DEPTNO FROM EMP WHERE HIREDATE LIKE '___12___';
    

---------------------------------------------------------------------------------------------------------------------        

--SQL CORRELATED SUBQUERIES
    --1.Display highest paid employee details for each grade by deptno.
        SELECT * FROM EMP E WHERE (DEPTNO,SAL)IN
        (SELECT DEPTNO,MAX(SAL)FROM EMP,SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL 
        AND E.DEPTNO=DEPTNO GROUP BY DEPTNO,GRADE)order by deptno;
    
    --2.Display Senior most employee of each location.
        SELECT * FROM EMP E WHERE (HIREDATE,deptno)IN(SELECT MIN(HIREDATE),deptno FROM EMP WHERE E.DEPTNO=DEPTNO group by deptno);
        
    --3.Display Senior most employee working as Manager for each Deptno. 
        SELECT * FROM EMP E WHERE HIREDATE IN(SELECT MIN(HIREDATE)FROM EMP WHERE E.DEPTNO=DEPTNO AND JOB='MANAGER');
        
    --4.Display lowest paid employee for each Job by Deptno
        SELECT * FROM EMP E WHERE (DEPTNO,JOB,SAL)IN(SELECT DEPTNO,JOB,MIN(SAL) 
        FROM EMP WHERE E.DEPTNO=DEPTNO GROUP BY DEPTNO,JOB)ORDER BY DEPTNO;
    
    --5.Display employees who are earning morethan average salary of their own Job and Deptno combination.
        SELECT * FROM EMP E WHERE SAL>(SELECT AVG(SAL)FROM EMP 
        WHERE E.JOB=JOB AND E.DEPTNO=DEPTNO GROUP BY JOB,DEPTNO);
        
    --6.Display year wise highest paid employees.
        SELECT * FROM EMP E WHERE (SAL,TO_CHAR(e.HIREDATE,'YYYY')) IN
        (SELECT MAX(SAL),TO_CHAR(HIREDATE,'YYYY') FROM EMP WHERE TO_CHAR(E.HIREDATE,'YYYY')=TO_CHAR(HIREDATE,'YYYY')
        group by TO_CHAR(HIREDATE,'YYYY'));
        
    --7.Display year wise highest paid employees BY DEPTNO.
        SELECT * FROM EMP E WHERE (SAL,TO_CHAR(e.HIREDATE,'YYYY'),deptno) IN
        (SELECT MAX(SAL),TO_CHAR(HIREDATE,'YYYY'),deptno FROM EMP WHERE TO_CHAR(E.HIREDATE,'YYYY')=TO_CHAR(HIREDATE,'YYYY')AND DEPTNO=E.DEPTNO
        group by TO_CHAR(HIREDATE,'YYYY'),deptno);
        
    --8.Display year wise highest paid employees BY LOCATION.
        SELECT TO_CHAR(HIREDATE,'YYYY')AS YEAR,SAL,LOC FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO 
        AND (SAL,e.deptno,TO_CHAR(e.HIREDATE,'YYYY')) IN
        (SELECT MAX(SAL),deptno,TO_CHAR(HIREDATE,'YYYY') FROM EMP WHERE TO_CHAR(E.HIREDATE,'YYYY')=TO_CHAR(HIREDATE,'YYYY')
        AND DEPTNO=E.DEPTNO group by deptno,TO_CHAR(HIREDATE,'YYYY'))
        ORDER BY TO_CHAR(HIREDATE,'YYYY');
          
    --9.Display MGR wise highest paid employees.
        SELECT * FROM EMP E WHERE (MGR,SAL)IN(SELECT MGR,MAX(SAL)FROM EMP WHERE E.MGR=MGR GROUP BY MGR);
        
    --10.Display first employee joined for each manager.
        SELECT * FROM EMP E WHERE (MGR,HIREDATE)IN(SELECT MGR,MIN(HIREDATE)FROM EMP WHERE E.MGR=MGR GROUP BY MGR);
        
------------------------------------------------------------------------------------------------------------------------        
        
--SQL JOINS:
    --1. Display all employee details ACCCOUNTING AND RESEARCH department with having sal between 1000 and 5000
        SELECT * FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO AND DNAME IN('ACCOUNTING','RESEARCH') AND SAL BETWEEN 1000 AND 5000;
        
    --2. Display all employees of Grade 3 to 5 and working in location NEW YORK and CHICAGO
        SELECT ENAME,JOB,SAL,GRADE,LOC FROM EMP E,SALGRADE S,DEPT D WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
    
    --3. Display all employees whose job is Manager and Experience is more than 30 years not belongs to grade 1 
        SELECT E.*,GRADE FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE!=1 AND JOB='MANAGER' AND MONTHS_BETWEEN(SYSDATE,HIREDATE)>360;
        
    -- Display distinct Jobs of Grade 3 
        SELECT DISTINCT JOB FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=3;
        
    --5. Display all employee details with their manager name where employees grade is 2 to 5 
    --      but his manager grade must be between 3 and 5. 
        SELECT E.*,M.ENAME MANAGER_NAME FROM EMP E,EMP M WHERE E.MGR=M.EMPNO 
        AND E.SAL BETWEEN(SELECT LOSAL FROM SALGRADE WHERE GRADE=2)AND(SELECT HISAL FROM SALGRADE WHERE GRADE=5)
        AND M.SAL BETWEEN(SELECT LOSAL FROM SALGRADE WHERE GRADE=3)AND(SELECT HISAL FROM SALGRADE WHERE GRADE=5);
        
    --6. Display all employee details with their manager name where employees grade is 3 to 4 
    --      but his manager grade must be between 3 and 4 and working for accounting, sales departments only. 
        SELECT E.*,M.ENAME MANAGER_NAME FROM EMP E,EMP M WHERE E.MGR=M.EMPNO 
        AND E.SAL BETWEEN(SELECT LOSAL FROM SALGRADE WHERE GRADE=3)AND(SELECT HISAL FROM SALGRADE WHERE GRADE=4)
        AND M.SAL BETWEEN(SELECT LOSAL FROM SALGRADE WHERE GRADE=3)AND(SELECT HISAL FROM SALGRADE WHERE GRADE=4)
        AND M.DEPTNO IN(SELECT DEPTNO FROM DEPT WHERE DNAME IN('ACCOUNTING','SALES'));
        
    --7. Display the name, location and the department of employees whose salary is greater than 1500. 
        SELECT ENAME,LOC,E.DEPTNO FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO AND SAL>1500;
        
    --8. Display all the employees staying in Dallas.
        SELECT E.*,LOC FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS';
        
    --9. Display ename, job, salary, grade and dname for everyone in the RESEARCH department
    --      except clerks, sort on salary, displaying the highest salary. 
        SELECT ENAME,JOB,SAL,GRADE,DNAME FROM EMP E,DEPT D,SALGRADE S 
        WHERE SAL BETWEEN LOSAL AND HISAL
        AND E.DEPTNO=D.DEPTNO
        AND DNAME='RESEARCH' AND JOB!='CLERK'
        ORDER BY SAL DESC;
        
    --10. Display all employees who earn less than their managers.
        SELECT E.ENAME,E.SAL,M.ENAME,M.SAL FROM EMP E,EMP M
        WHERE E.MGR=M.EMPNO AND E.SAL<M.SAL;
        
    --11. Display all employees who earn more than their managers. 
        SELECT E.ENAME,E.SAL,M.ENAME,M.SAL FROM EMP E,EMP M
        WHERE E.MGR=M.EMPNO AND E.SAL>M.SAL;
        
    --12. Find the department that has no employees. 
        SELECT D.* FROM DEPT D WHERE NOT EXISTS(SELECT * FROM EMP WHERE DEPTNO=D.DEPTNO);
        
    --13.Display the details all Managers of Accounting Department. 
        SELECT * FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO 
        AND DNAME = 'ACCOUNTING' AND JOB= 'MANAGER';
        
    --14.Display all the Salesman of sales dept who are receiving some commision
        SELECT * FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO
        AND JOB='SALESMAN' AND DNAME='SALES' AND NVL(COMM,0)>0;
        
    --15.Display all managers and analysts of both Accounting and Reasearch Department who annual salary morethan 20000
        SELECT E.* FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO
        AND DNAME IN('ACCOUNTING','RESEARCH') AND SAL*12>20000;
        
    --16.Display all 1981 and 1982 employees joined in Newyork and Chicago with salary morethan 1250 joined under some manager.
        SELECT * FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO
        AND TO_CHAR(HIREDATE,'YYYY')IN(1981,1982) AND
        LOC IN('NEW YORK','CHICAGO') AND SAL>1250 AND
        MGR IS NOT NULL;
        
    --17.Display grade of Adams.
        SELECT ENAME,GRADE FROM SALGRADE S,EMP E 
        WHERE SAL BETWEEN LOSAL AND HISAL AND ENAME='ADAMS';
    
    --18.Display all grade 2 Salesman. 
        SELECT * FROM EMP E,SALGRADE S WHERE
        SAL BETWEEN LOSAL AND HISAL AND JOB='SALESMAN' AND GRADE=2;
        
    --19.Display all grade 4 & 5 managers working under some manager having an experience not less thean 35 years. 
        SELECT DISTINCT M.* FROM EMP E,EMP M,SALGRADE S WHERE E.MGR=M.EMPNO
        AND M.SAL BETWEEN LOSAL AND HISAL AND GRADE IN(4,5) AND M.MGR IS NOT NULL
        AND TRUNC(MONTHS_BETWEEN(SYSDATE,M.HIREDATE)/12)>35;
        
    --20.Display the details of employees belongs to New York working as Managers beloging to grade 4 & 5. 
        SELECT E.*,DNAME,LOC,GRADE FROM EMP E,DEPT D,SALGRADE S WHERE
        E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND LOC='NEW YORK' AND JOB='MANAGER' AND GRADE IN(4,5);
    
    
---------------------------------------------------------------------------------------------------------------------

--                                              SQL SET OPERATORS

    --JOINS,GROUP FUNCTIONS
        --1.Display department wise, average salary where average salary ranging between 1000-3000.
            SELECT DEPTNO,AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) BETWEEN 1000 AND 3000;
            
        --2.Display grade wise, location wise, count of employees where count of employees =2.
            SELECT GRADE,LOC,COUNT(*) FROM EMP E,SALGRADE S,DEPT D 
            WHERE D.DEPTNO=E.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
            GROUP BY GRADE,LOC HAVING COUNT(*)>=2;
            
        --3.Display department name wise, job wise, sum of annual salary 
        --      where annual salary between 20000 to 40000 for year 1980,81,82. 
            SELECT TO_CHAR(HIREDATE,'YYYY'),DNAME,JOB,SUM(SAL*12) FROM EMP E,DEPT D 
            WHERE E.DEPTNO=D.DEPTNO AND SAL*12 BETWEEN 20000 AND 40000 
            AND TO_CHAR(HIREDATE,'YYYY')IN('1980','1981','1982')
            GROUP BY DNAME,JOB,TO_CHAR(HIREDATE,'YYYY');
            
        --4.Display location wise, count of employees, average salaries for location new york, chicago and dallas.
            SELECT LOC,COUNT(*),AVG(SAL) FROM EMP E,DEPT D WHERE
            E.DEPTNO=D.DEPTNO AND LOC IN('NEW YORK','CHICAGO','DALLAS')
            GROUP BY LOC;
    
        --5.Display year wise count of employees where count is more than 3. 
            SELECT TO_CHAR(HIREDATE,'YYYY'),COUNT(*) FROM EMP
            GROUP BY TO_CHAR(HIREDATE,'YYYY') HAVING COUNT(*)>3;
            
        --6.Display mgr wise sum of all mgr salaries whose sum of employee salaries ranging between 3000 to 30000.
            SELECT M.EMPNO,SUM(M.SAL) FROM EMP E,EMP M WHERE E.MGR=M.EMPNO 
            GROUP BY M.EMPNO HAVING SUM(E.SAL) BETWEEN 3000 AND 30000;
            
        --7.Display month wise employees joined in every department. 
            SELECT TO_CHAR(HIREDATE,'YYYY-MM'),LISTAGG(ENAME,' AND '),COUNT(*) FROM EMP 
            GROUP BY TO_CHAR(HIREDATE,'YYYY-MM') ORDER BY TO_CHAR(HIREDATE,'YYYY-MM');
            
        --8.Display department number wise, department name wise, grade wise, job wise mgrs where mgrs name has atleast one 'A' in it. 
            SELECT M.DEPTNO,GRADE,M.JOB,M.ENAME FROM EMP E,SALGRADE S,EMP M 
            WHERE M.SAL BETWEEN LOSAL AND HISAL AND E.MGR=M.EMPNO
            GROUP BY M.DEPTNO,GRADE,M.JOB,M.ENAME HAVING M.ENAME LIKE '%A%';
            
        --9.Display department, sum of salaries for those employees who are not managers.
            select deptno,sum(sal) from emp where empno not in(select mgr from emp where mgr is not null) group by deptno;  
            
    --SET OPERATORS
        --1.Display details of all employees whose salaries are same as any of the following: 
            --The salary of all employee who are working as managers. 
            --Salaries of all clerks who are first level managers. 
            --The commission of all salesman of sales department belongs to grade 1,2,3. 
            --One third of salary of 1st level of mgr of grade 4,5. 
            SELECT * FROM EMP WHERE SAL IN
            (SELECT SAL FROM EMP WHERE JOB='MANAGER'
            UNION
            SELECT SAL FROM EMP WHERE JOB='CLERK' AND EMPNO IN(SELECT MGR FROM EMP WHERE MGR IS NOT NULL)
            UNION
            SELECT COMM FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND NVL(COMM,0)>0 AND GRADE IN(1,2,3)
            UNION
            SELECT SAL/3 FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND EMPNO IN(SELECT MGR FROM EMP WHERE MGR IS NOT NULL) AND GRADE IN(4,5));
            
        --2.Display all the jobs available with department 10 and 20 but not with the sales department. 
            SELECT JOB FROM EMP WHERE DEPTNO IN(10,20) 
            MINUS 
            (SELECT JOB FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES'));
            
        --3.Find the job that filled in the first half of 1983 and the same job that has hired during the same period in 1984. 
            SELECT JOB FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY Q')IN('1983 1','1983 2')
            INTERSECT
            SELECT JOB FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY Q')IN('1984 1','1984 2');
        
        
-----------------------------------------------------------------------------------------------------------------------------

--SQL GROUP FUNCTIONS
    --1)Calculate the job and the average salary for each of different job. 
        SELECT JOB,AVG(SAL) FROM EMP GROUP BY JOB;
    
    --2)Display the average monthly salary bill for each job type with in a department. 
        SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY JOB,DEPTNO ORDER BY DEPTNO;
        
    --3)Find the maximum salary of each job. 
        SELECT JOB,MAX(SAL) FROM EMP GROUP BY JOB;
        
    --4)Find the minimum salary of each department. 
        SELECT DEPTNO,MIN(SAL) FROM EMP GROUP BY DEPTNO;
        
    --5)Find average salary for all department having more than 3 employees 
        SELECT DEPTNO,COUNT(*),AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>3;
    
    --6)Find all the jobs where the maximum salary of greater or equal to 3000. 
        SELECT JOB,MAX(SAL) FROM EMP GROUP BY JOB HAVING MAX(SAL)>=3000;
    
    --7)Find the department and the average salary of each department if it is greater than 2000.
        SELECT DEPTNO,AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>2000;
    
    --8)Find the minimum salary of all the employees. 
        SELECT MIN(SAL) FROM EMP;
    
    --9)Find the maximum, minimum and average salary of all employees. 
        SELECT MAX(SAL),MIN(SAL),AVG(sal) FROM EMP;
      
    --10)Find the maximum, minimum and average salary for each job type. 
        SELECT JOB,MAX(SAL),MIN(SAL),AVG(sal) FROM EMP GROUP BY JOB;
        
    --11)Find how many managers are there in the employee table. 
        SELECT COUNT(*) FROM EMP WHERE JOB='MANAGER';
                        --(OR)
        SELECT COUNT(*) FROM (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);    
        
    --12)Find out the difference of the highest and lowest salary. 
        SELECT MAX(SAL)-MIN(SAL) FROM EMP;
    
    --13)Find the departments having more than 3 employees. 
        SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>3;
    

---------------------------------------------------------------------------------------------------------------------------

--SQL DML QUESTIONS
    --1.Change the name of the employee james to upper case. 
        UPDATE EMP SET ENAME=UPPER(ENAME) WHERE ENAME=LOWER(ENAME);

    --2.Increment the salaries of all employees by 20%. 
        UPDATE EMP SET SAL=SAL+SAL*0.2;
    
    --3.Transfer all the clerks of department 20 to 10 by incrementing the salary 
    --   with 500 and changing their manager to 7839.  
        UPDATE EMP SET DEPTNO=10,SAL=SAL+500,MGR=7839 WHERE DEPTNO=20 AND JOB='CLERK';
    
    --4.Replace the century component where ever it is 20 to 19. 
        UPDATE EMP SET HIREDATE=(TO_DATE(TO_CHAR(HIREDATE,'DD-MM-')
        ||REPLACE(SUBSTR(TO_CHAR(HIREDATE,'YYYY'),1,2),19,20)||TO_CHAR(HIREDATE,'YY')));

    --5.Increment the salaries of all grade 3 employees by 10%. 
        UPDATE EMP SET SAL=SAL+SAL*0.1 
        WHERE SAL BETWEEN(SELECT LOSAL FROM SALGRADE WHERE GRADE=3)
        AND(SELECT HISAL FROM SALGRADE WHERE GRADE=3);
    
    --6.Transfer all clerks of research department to sales department by incrementing the salary 10%. 
        UPDATE EMP SET SAL=SAL+SAL*0.1,DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES')
        WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='RESEARCH') AND JOB='CLERK';
    
    --7.Replace the lowest paid employees salary with average salary 
    --   of employee table which is rounded to nearest rupee. 
        UPDATE EMP SET SAL=ROUND(AVG(SAL)) WHERE SAL=(SELECT MIN(SAL)FROM EMP);
    
    --8.Replace the salaries of all the employees of department 10 with the average salary 
    --   of department 10 itself wherever employees are receiving less than average salary  
        UPDATE EMP SET SAL=ROUND(AVG(SAL)) WHERE DEPTNO=10 
        AND SAL<(SELECT AVG(SAL)FROM EMP WHERE DEPTNO=10);
    
    --9.Replace the salary of highest paid employee of grade 2 with lowest paid employee of grade 3. 
        UPDATE EMP SET SAL=(SELECT MIN(SAL)FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=3)
        WHERE SAL=(SELECT MAX(SAL)FROM EMP E,SALGRADE S WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE=2);
    
    --10.Replace the salaries of all the employees whose salary is less than the average salary
    --    of their own grade with the average salary of their own grade. 
    /*(DOUBT)*/ UPDATE EMP E SET E.SAL=(SELECT AVG(SAL)FROM EMP E1,SALGRADE S WHERE E.SAL=E1.SAL AND E1.SAL BETWEEN LOSAL AND HISAL GROUP BY GRADE)
            WHERE E.SAL<(SELECT AVG(SAL)FROM EMP E1,SALGRADE S WHERE E.SAL=E1.SAL AND E1.SAL BETWEEN LOSAL AND HISAL GROUP BY GRADE);

    --11.Delete the record of blake. 
        DELETE FROM EMP WHERE ENAME='BLAKE';
        
    --12.Delete all the employees working under the manager 7839 except jones.
        DELETE FROM EMP WHERE MGR='7839' AND ENAME!='JONES';
            
    --13.Delete all the employees belongs to second and fourth quarter of 1981 and 1983 joined under manager 7566. 
        DELETE FROM EMP WHERE MGR=7566 AND TO_CHAR(HIREDATE,'YYYY Q')IN('1981 2','1981 4','1983 2','1983 4');
            
    --14.Delete all employees of sales department working as salesman.
        DELETE FROM EMP WHERE JOB='SALESMAN' AND DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
        
    --15.Delete all grade 3 employees working as clerks. 
        DELETE FROM EMP WHERE JOB='CLERK' AND SAL BETWEEN
        (SELECT LOSAL FROM SALGRADE WHERE GRADE=3) AND
        (SELECT HISAL FROM SALGRADE WHERE GRADE=3);
        
    --16.Delete all employees working as managers to others with annual salary ranging from 2400 to 42000. 
        DELETE FROM EMP WHERE SAL*12 BETWEEN 2400 AND 42000 AND
        EMPNO IN(SELECT MGR FROM EMP WHERE MGR IS NOT NULL);
        
    --17.Delete all employees working for the department where blake's manager is working. 
        DELETE FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE');
    
    --18.Delete the details of all the employees whose salary is less than average salary of all the employees. 
        DELETE FROM EMP WHERE SAL<(SELECT AVG(SAL)FROM EMP);
    
    --19.Delete those employees where less than 4 employees are working for their department. 
        DELETE FROM EMP WHERE DEPTNO IN(SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*)<4);
    
    --20.Delete the details of employees who belongs to department where minimum number of employees are working.
        DELETE FROM EMP WHERE DEPTNO IN(SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING MIN(COUNT(*)));
    
    --21.Delete all employees whose salary is less than the average salary of their own department. 
        DELETE FROM EMP E WHERE E.SAL<(SELECT AVG(SAL)FROM EMP WHERE E.DEPTNO=DEPTNO);
    
    --22.Delete all emplpoyees. 
        DELETE FROM EMP;
        
--------------------------------------------------------------------------------------------------------------------------

--SQL 2
    --13)Find the employee details name, his number, his job, deptno of all clerks. 
        SELECT ENAME,EMPNO,JOB,DEPTNO FROM EMP WHERE JOB='CLERK';
        
    --14)Find the department details for all the whose deptno>20 
        SELECT * FROM DEPT WHERE DEPTNO>20;
    
    --15)Find the empno, name, salary and comm. where Sal>comm. 
        SELECT EMPNO,ENAME,SAL,COMM FROM EMP WHERE SAL>NVL(COMM,0);
    
    --16)Find ename, empno, sal of employee earning between 1000 and 2000. 
        SELECT ENAME,EMPNO,SAL FROM EMP WHERE SAL BETWEEN 1000 AND 2000;
     
    --17)Find EMP details (name, number, sal and mgr of employees working under the managers with mgr 7902 or 7566 or 7788. 
        SELECT ENAME,EMPNO,SAL,MGR FROM EMP WHERE MGR IN(7902,7566,7788);
    
    --18)Find the emp names whose name starts with ‘S’ 
        SELECT ENAME FROM EMP WHERE ENAME LIKE 'S%';
    
    --19)Find the EMP name of size 4. 
        SELECT ENAME FROM EMP WHERE ENAME LIKE '____';
    
    --20)Find the employees not working under any managers. 
        SELECT * FROM EMP WHERE MGR IS NULL;
    
    --21)Find the employees who are not working between 1000 and 2000 salary. 
        SELECT * FROM EMP WHERE SAL BETWEEN 1000 AND 2000;
    
    --22)Find all the employees who are not managers. 
        SELECT * FROM EMP WHERE EMPNO NOT IN(SELECT MGR FROM EMP WHERE MGR IS NOT NULL);
    
    --23)Find all the managers who are working under some manager. 
        SELECT * FROM EMP WHERE empno in(SELECT MGR FROM EMP WHERE MGR IS NOT NULL) AND MGR IS NOT NULL;
    
    --24)Find the EMP details like name,number, job, salary earning between 1000 and 2000 and who are also clerk
        SELECT ENAME,EMPNO,JOB,SAL FROM EMP WHERE SAL BETWEEN 1000 AND 2000 AND JOB='CLERK';
    
    --25)Find the emp details like name.number,job,salary who are either earning between 1000  and 2000 or job=’clerk’ 
        SELECT ENAME,EMPNO,JOB,SAL FROM EMP WHERE SAL BETWEEN 1000 AND 2000 OR JOB='CLERK';
    
    --26)Find all the employees who are all managers and earn above 1500  
         SELECT * FROM EMP WHERE JOB='MANAGER' AND SAL>1500;
    
    --27)Find all the mangers and salesman with salaries over 1500. 
        SELECT * FROM EMP WHERE JOB IN('SALESMAN','MANAGER') AND SAL>1500;
    
    --28)Find all the information from the salary grade.
        SELECT * FROM SALGRADE;
     
     --29)Find the employee and the department they are working in the ascending order of deptno. 
        SELECT ENAME,DEPTNO FROM EMP ORDER BY DEPTNO;
     
     --30)Find all the different types of jobs. 
        SELECT DISTINCT JOB FROM EMP;
        
    --31)Find all the employees working in deptno 10 or 20 in the alphabet order of name. 
        SELECT ENAME,DEPTNO FROM EMP WHERE DEPTNO IN(10,20) ORDER BY ENAME;
    
    --32)Find all the details of the clerks of deptno 20 
        SELECT * FROM EMP WHERE JOB='CLERK' AND DEPTNO=20;
    
    --33)Find all the employees who have ‘TH’ or ‘TL’ in their names. 
        SELECT ENAME FROM EMP WHERE ENAME LIKE '%TH%' OR ENAME LIKE '%TL%';
    
    --34)Find all the employee names and their annual salary. 
        SELECT ENAME,SAL*12 ANNUAL_SAL FROM EMP;
    
    --35)Find all the employees hired during 1983.
        SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY')=1983;
    
    --36)Find all the employee names their annual salary of all sales people 
    --     whose monthly salary >comm. the output should be ordered by salary highest 
    --     first of two more employees have the same salary 
    --     sort by their names with the highest salary in order. 
        
        SELECT ENAME,SAL*12 FROM EMP WHERE SAL>NVL(COMM,0) 
        AND DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES')
        ORDER BY SAL DESC,ENAME;
    
    --37)Find all the employees details in the following format. 
    --Who                 what                            when 
    --SMITH    HELD POSITION OF CLERK IN DEPT 20     SINCE 13-JUN-83 
        SELECT ENAME WHO,' HELD POSITION OF '||JOB||' IN DEPT '||DEPTNO WHAT,
        ' SINCE '||TO_CHAR(HIREDATE,'DD-MON-YY') WHEN FROM EMP;
        
    --38)Find the ename, deptno and annual salary 
    --    where the job of the employee is entered by user at runtime. 
        SELECT ENAME,DEPTNO,JOB,SAL*12 ANNUAL_SAL FROM EMP WHERE JOB='&JOB';
        
    --39)Repeat the same query using the ‘&&’ command. 
            SELECT ENAME,DEPTNO,JOB,SAL*12 ANNUAL_SAL FROM EMP WHERE JOB='&JOB';
    
    --40)Find the annual salary and find the ename,job and the annsal salary in the decreasing order by the annsal 
        SELECT ENAME,JOB,SAL*12 ANNUAL_SAL FROM EMP ORDER BY ANNUAL_SAL DESC;
        
        
---------------------------------------------------------------------------------------------------------------------------

--SQL 3
    --41)Display the department name and string ‘HELLO’ in lower case. 
        SELECT LOWER(DNAME||' HELLO') FROM DEPT;
    
    --42)Display the ename in upper case and the job in lower case. 
        SELECT UPPER(ENAME),LOWER(JOB) FROM EMP;
    
    --43)Display the employee name with initial letter in capital. 
        SELECT INITCAP(ENAME)FROM EMP;
    
    --44)Display the empno, ename together using concat. 
        SELECT EMPNO||ENAME FROM EMP;
    
    --45)Display the ename left justified using 25 spaces. 
        SELECT LPAD(ENAME,LENGTH(ENAME)+25) FROM EMP;
    
    --46)Display the ename right justified using 25 spaces. 
        SELECT RPAD(ENAME,LENGTH(ENAME)+25) FROM EMP;
    
    --47)Display the employee name from 2nd letter onwards and the job the five characters from 2nd position onwards. 
        SELECT SUBSTR(ENAME,2),SUBSTR(JOB,2,5) FROM EMP;
    
    --48)Display the character position of ‘A’ in employee name and the character position of 2nd occurrence of ‘C’
    --     in name starting at position 1 onwards. 
        SELECT ENAME,INSTR(ENAME,'A'),INSTR(ENAME,'C',1,2) FROM EMP;
    
    --49)Remove any occurrence of ‘A’ on the left of the employee name. 
        SELECT LTRIM(ENAME,'A') FROM EMP;
    
    --50)Remove any occurrence of ‘G’ on the right of the department name. 
        SELECT RTRIM(ENAME,'G')FROM EMP;
        
    --51)Find the length of the character of ename. 
        SELECT ENAME,LENGTH(ENAME)FROM EMP;
    
    --52)Change every occurrence of ‘C’ in the department name to ’P’. 
        SELECT REPLACE(DNAME,'C','P') FROM DEPT;
    
    --53)Change every occurrence of ‘C’ to ‘P’ and ‘I’ to ‘T’ in dname. 
        SELECT TRANSLATE(DNAME,'CI','PT')FROM DEPT;
    
    --54)Change every occurrence of job from salesman to salesman. 
        (DOUBT);
    
    --55)Find the number of times the character ’S’ occurs in the deptname. 
        SELECT LENGTH(DNAME)-LENGTH(REPLACE(DNAME,'S',NULL)) FROM DEPT;
        
    --~~~~~~~~~~CHARACTER FUNCTIONS~~~~~~~~~~ 
    --1.Display the details of employees whose name ends with H. 
        SELECT * FROM EMP WHERE ENAME LIKE '%H';
    
    --2.Display the details of employees who are hired in the month of MAY irrespective of the year. 
        SELECT * FROM EMP WHERE HIREDATE LIKE '___05___';
    
    --3.Display the employee details whose name starts with S and has 5 characters. 
        SELECT * FROM EMP WHERE ENAME LIKE 'S____';
    
    --4.Display the details of the employees whose name start with C and has 
    --   salary greater than 2400 and whose job name starts with M. 
            SELECT * FROM EMP WHERE ENAME LIKE 'C%' AND JOB LIKE 'M%' AND SAL>2400;
    
    --5.Display the details of employees whose job name has 7 characters 
    --   and joined in the year 1981 and having commission greater than 500.
         SELECT * FROM EMP WHERE JOB LIKE '_______' AND NVL(COMM,0)>500 AND TO_CHAR(HIREDATE,'YYYY')=1981;
    
    --6.Display employee names having character 'A' after second position more than 2 times. 
        SELECT ENAME FROM EMP WHERE ENAME LIKE '__%A%A%';
    
    --7.Display all the salaries of employees with fixed size format of 8 characters. 
        DOUBT;
        
        
---------------------------------------------------------------------------------------------------------------------------

--SQL 4
    --1)Display the ename and date of joining the service in the following format. SCOTT JUNE, THIRTEEN 1983 
        SELECT ENAME||' '||TO_CHAR(HIREDATE,'MONTH, DDSP YYYY') FROM EMP;
    
    --2)Display the ename, hiredate and the then review date which is hiredate+1.
        SELECT ENAME,HIREDATE,HIREDATE+1 REVIEWDATE FROM EMP;
    
    --3)Write a query to return the day of the week for any date entered in the format DD.MM.YYYY 
        SELECT TO_CHAR(TO_DATE('&DATE','DD.MM.YYYY'),'DAY') FROM DUAL;
    
    --4)Write a query to calculate the length of the time any employee has been with the company. 
        SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) YEARS,
        TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,HIREDATE),12))AS MONTHS
        FROM EMP;
    
    --5)Display the ename, total salary and hiredate of all the employees whose salary is greater than 
    --    twice their commission. Format the hiredate to look like 15th of January 1998. 
        SELECT ENAME,SAL+NVL(COMM,0) TOTAL_SAL,NVL(COMM,0)COMM,TO_CHAR(HIREDATE,'DDTH')||' OF '
        ||TO_CHAR(HIREDATE,'MONTH YYYY') HIREDATE FROM EMP WHERE SAL>2*NVL(COMM,0);
        
    --6)Display the employee details and the hiredate as Jan 31, 98. 
        SELECT EMPNO,ENAME,SAL,JOB,DEPTNO,TO_CHAR(HIREDATE,'MON DD,YY')HIREDATE FROM EMP;
    
    --7)Write the query which produces the following output. 
    --    SCOTT EARNS 2000 PER MONTH BUT WANTS 4000 
        SELECT ENAME||' EARNS '||SAL||' PER MONTH BUT WANTS '||SAL*2 AS SENTENCE FROM EMP;
    
    --8)Display the details of all the salesman having an exp ranging from 2 to 40 years 
    --    by considering first 1 year is training period. 
        SELECT * FROM EMP WHERE JOB='SALESMAN' AND
        TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12)-1 BETWEEN 2 AND 40;
    
    --9)Display current date, yesterdays date, tomorrows date. 
        SELECT SYSDATE-1 YESTERDAY,SYSDATE CURRENT_DATE,SYSDATE+1 TOMORROW FROM DUAL;
    
    --10)Display current date, add 5 hours to current date and convert it to 24 DEC 2019 15:30:30 PM. 
        select to_char(sysdate+5/24,'dd MON yyyy') ||' '||to_char(sysdate+5/24 ,'hh24:mi:ss a.m.')AS DATE_TIME from dual;
    
    --11)List the emps along with their Exp and whose Daily Sal is more than Rs.100. 
        SELECT ENAME,SAL,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12)EXP FROM EMP WHERE SAL/30>100;
    
    --12)List the emps whose Salary is more than 3000 after giving 20% increment 
        SELECT * FROM EMP WHERE SAL+SAL*0.2>3000;
    
    --13)List all emps joined on 1 May, 1981 using TO_DATE function. 
        SELECT * FROM EMP WHERE HIREDATE=TO_DATE('1 MAY,1981','DD MONTH,YYYY');
    
    --14)List the emps who joined in 2nd half of 1981. 
        SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY Q')IN('1981 3','1981 4');
    
    --15)List the emps who are working as clerks and exp is more than 8 Years. 
        SELECT * FROM EMP WHERE JOB='CLERK' AND MONTHS_BETWEEN(SYSDATE,HIREDATE)>96;
        

--------------------------------------------------------------------------------------------------------------------------

--Calculate days and time between two dates
    SELECT * FROM TS;
    --      no.of sec in a hour=3600, no.of sec in min=60, no.of sec in a day=82400
    SELECT (TO_CHAR(TS1,'HH24')*3600+TO_CHAR(TS1,'MI')*60 +TO_CHAR(TS1,'SS'))/82400 SECONDS FROM TS;
    SELECT (TO_CHAR(TS1,'HH24')/24) +(TO_CHAR(TS1,'MI' )/1440)+((TO_CHAR(TS1,'SS'))/82400) cal,TRUNC( st2) -TRUNC( ts1) YVU FROM TS;
    
                
-------------------------------------------------------------------------------------------------------------------------

    SELECT NEXT_DAY(LAST_DAY(SYSDATE)-7,'FRIDAY')FROM DUAL;     --LAST FRIDAY OF THE MONTH
    SELECT NEXT_DAY(TRUNC(SYSDATE,'MM')+7,'FRIDAY')FROM DUAL; --SECOND FRIDAY OF THE MONTH
    SELECT LTRIM(RTRIM('-THE KING IS BACK.-','.-'),'-')FROM DUAL;
    SELECT ROUND(100.726,-2)FROM DUAL;
    SELECT TRUNC(100.726,-2)FROM DUAL;
    SELECT LOWER(100+30.654)FROM DUAL;
    SELECT CONCAT(100+3.768,200-3.678)FROM DUAL;
    SELECT SUBSTR(100+34.67892,3)FROM DUAL;
    SELECT INSTR(1216+34.65,'50')FROM DUAL;
    SELECT CONCAT(100-2.3,'TESTING')FROM DUAL;
    SELECT RTRIM(1350+25.7,'75.7')FROM DUAL;
    SELECT RTRIM(1350+25.7,'75.7')+2 FROM DUAL;
    SELECT CONCAT(EMPNO,SAL)FROM EMP;
    SELECT SUBSTR(100+24.6745,3)+10 FROM DUAL;
    SELECT CONCAT(10+2,10-2)FROM DUAL;
    SELECT ENAME FROM EMP WHERE ENAME LIKE '_____%'; --NAME MINIMUM 5 LETTERS
    SELECT * FROM EMP WHERE HIREDATE LIKE '___12_81';
    
    
---------------------------------------------------------------------------------------------------------------------------
