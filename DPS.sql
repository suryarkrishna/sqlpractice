SELECT EMP.*, TO_CHAR(SAL, '9,999.99')
FROM EMP;

--TO INSERT DATE FROM FRONT END TO BACKEND, WE USE T0_DATE();
--TO DISPLAY DATE FROM BACK END TO FRONT END, WE USE TO_CHAR();

SELECT TO_DATE('11/21/23', 'MM/DD/YY') FROM DUAL;

SELECT TO_CHAR(TO_DATE('15-OCT-23','DD-MON-YY'), 'DAY') 
FROM DUAL;

SELECT TO_NUMBER('1,245.56','9,999.99') FROM DUAL;

SELECT GREATEST(1,4,5,23)
FROM DUAL;

SELECT LEAST(1,4,323,422)
FROM DUAL;

SELECT NVL(NULL, 23) FROM DUAL;

SELECT NVL(TO_CHAR(COMM), 'N/A'), COMM FROM EMP;

--SOUNDEX(): COMPARES DATA BASED ON PRONUNCIATION

SELECT COUNT(DISTINCT(COMM)) FROM EMP;

SELECT EMPNO, SAL FROM EMP;

SELECT SUM(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

 SELECT COUNT(*), DEPTNO
 FROM EMP
 GROUP BY DEPTNO;
 
 SELECT COUNT(*), TO_CHAR(HIREDATE, 'YYYY')
 FROM EMP
 GROUP BY TO_CHAR(HIREDATE, 'YYYY');

SELECT COUNT(*), MGR
FROM EMP
GROUP BY MGR
HAVING MGR IS NOT NULL;

--ORDER BY CLAUSE TAKE POSITION AS COLUMN AS WELL
--ORDER BY 3 IN THE SENSE , 3 COLUMN IN THE TABLE




SELECT * FROM USER_CONSTRAINTS;

CREATE TABLE TABLE15(
    ID NUMBER(2) CONSTRAINT ID15_PK PRIMARY KEY,
    NAME VARCHAR2(20)
    );
    
DESC TABLE15;

INSERT ALL
INTO TABLE15 VALUES(1,'SURYA')
INTO TABLE15 VALUES(2, 'SATYA')
INTO TABLE15 VALUES(3, 'SAI')
SELECT * FROM DUAL;

SELECT * FROM TABLE15;

ALTER TABLE TABLE15
ADD AGE NUMBER(2);

UPDATE TABLE15
SET AGE = 23;

ALTER TABLE TABLE15
MODIFY AGE NOT NULL;

ALTER TABLE TABLE15
ADD CONSTRAINT CHECK_AGE CHECK(AGE<=60);

ALTER TABLE TABLE15
DROP CONSTRAINT CHECK_AGE;

INSERT INTO TABLE15 VALUES (5, 'SAILESH', 76);

UPDATE TABLE15
SET AGE = 54
WHERE ID = 5;

CREATE TABLE TABLE16(
    ID NUMBER(2) PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    AGE NUMBER(2) CHECK(AGE<=60),
    DEPTNO NUMBER(2),
    SALARY NUMBER(7,2) DEFAULT 5000,
    PHONE NUMBER(10) CHECK(LENGTH(PHONE)=10)
    );
    
INSERT INTO TABLE16 (ID, NAME, AGE, DEPTNO, PHONE)
VALUES(3, 'SARA',23, 20, 7441121465); 

SELECT * FROM TABLE16;

UPDATE TABLE16
SET DEPTNO = 30
WHERE ID = 2;

ALTER TABLE TABLE16
ADD CONSTRAINT TABLE16_DEPTNO_FK FOREIGN KEY (DEPTNO) 
REFERENCES DEPT(DEPTNO);

SELECT * FROM DEPT;

ALTER TABLE TABLE16
DROP COLUMN DEPTNO;

DESC DEPT;

CREATE TABLE TABLE17(
    ID NUMBER(2) PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    AGE NUMBER(2) CHECK(AGE<=60),
    DEPTNO NUMBER(2) CONSTRAINT TABLE17_DEPTNO_FK 
    REFERENCES TABLE16(DEPTNO),
    SALARY NUMBER(7,2) DEFAULT 5000,
    PHONE NUMBER(10) CHECK(LENGTH(PHONE)=10)
    );

INSERT ALL
INTO TABLE17 (ID, NAME, AGE, DEPTNO, PHONE)
VALUES(1,'SURYA', 23, 10, 7331121465)
INTO TABLE17 (ID, NAME, AGE, DEPTNO, PHONE)
VALUES(2,'SATYA', 23, 20, 7331121466)
INTO TABLE17 (ID, NAME, AGE, DEPTNO, PHONE)
VALUES(3,'RAM', 23, 30, 7331121467)
INTO TABLE17 (ID, NAME, AGE, DEPTNO, PHONE)
VALUES(4,'KRISHNA', 23, 10, 7331121468)
SELECT * FROM DUAL;

SELECT * FROM TABLE17;
SELECT * FROM TABLE16;

SELECT * 
FROM TABLE16 INNER JOIN TABLE17
ON TABLE16.DEPTNO = TABLE17.DEPTNO;

CREATE TABLE TABLE18(
    ID NUMBER(2) PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    AGE NUMBER(2) CHECK(AGE<=60),
    DEPTNO NUMBER(2),
    SALARY NUMBER(7,2) DEFAULT 5000,
    PHONE NUMBER(10) CHECK(LENGTH(PHONE)=10),
    CONSTRAINT TABLE18_DEPTNO_FK FOREIGN KEY(DEPTNO)
    REFERENCES TABLE16(DEPTNO)
    );
    
DESC TABLE18;

INSERT ALL
INTO TABLE18 (ID, NAME, AGE, DEPTNO, PHONE)
VALUES(1,'RAJ', 24, 10, 7331121465)
INTO TABLE18 (ID, NAME, AGE, DEPTNO, PHONE)
VALUES(2,'RAHUL', 24, 20, 7331121466)
INTO TABLE18 (ID, NAME, AGE, DEPTNO, PHONE)
VALUES(3,'RAMESH', 24, 30, 7331121467)
INTO TABLE18 (ID, NAME, AGE, DEPTNO, PHONE)
VALUES(4,'RAJESH', 25, 20, 7331121468)
SELECT * FROM DUAL;

SELECT * FROM TABLE18;

SELECT * 
FROM TABLE18, TABLE16
WHERE TABLE18.DEPTNO = TABLE16.DEPTNO;

COMMIT;

DELETE FROM TABLE15
WHERE ID=3;

DROP TABLE TABLE15;
SELECT * FROM TABLE15;
DESC TABLE15;

SELECT * FROM TABLE15;

SELECT * FROM EMP 
WHERE SAL = (SELECT MAX(SAL) FROM EMP
WHERE SAL < (SELECT MAX(SAL) FROM EMP)); 

SELECT * FROM EMP
WHERE SAL > ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');

SELECT * FROM EMP 
WHERE (SAL,DEPTNO) IN(SELECT MAX(SAL), DEPTNO
FROM EMP GROUP BY DEPTNO);

SELECT ENAME, DEPTNO, MGR FROM EMP
WHERE (EMPNO, DEPTNO) 
IN (SELECT MGR, DEPTNO FROM EMP);

--DISPLAY WHO ARE GETTING MORE THAN THEIR DEPT AVG SAL
--CORELATED SUBQUERIES
SELECT E.EMPNO, E.ENAME, E.DEPTNO,E.SAL FROM EMP E
WHERE (SAL) > (SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = E.DEPTNO);

SELECT AVG(SAL),DEPTNO 
FROM EMP
GROUP BY DEPTNO;

--DISPLAY WORKING EMPLOYEE DEPT DETAILS
SELECT D.DEPTNO, D.DNAME, D.LOC 
FROM DEPT D WHERE NOT EXISTS (SELECT * FROM EMP
    WHERE DEPTNO = D.DEPTNO); 
    
--SCALAR SUB QUERIES

SELECT EMP.*, (SELECT SUM(SAL) FROM EMP)TOTALSAL
FROM EMP;

--DISPLAY NUM OF EMPS, NO OF DEPTS, NO OF GRADES
SELECT (SELECT COUNT(*) FROM EMP), (SELECT COUNT(*) FROM DEPT),
(SELECT COUNT(*) FROM SAL_GRADE) FROM DUAL;

--PSUEDO COLUMNS
SELECT UID FROM DUAL;

SELECT ENAME, SAL, NVL(COMM,0) FROM EMP;

SELECT ENAME, (SAL+NVL(COMM,0))*12 ANNUALSAL , NVL(COMM,0) FROM EMP; 

SELECT * FROM EMP;

SELECT EMPNO || '-' || ENAME AS EMPLOYEE,
'WORKS IN DEPARTMENT' AS WORKS,
DEPTNO
FROM EMP;

SELECT EMPNO, ENAME, SAL+NVL(COMM,0)
FROM EMP;

SELECT DISTINCT DEPTNO, JOB FROM EMP;

SELECT ENAME, (SAL+NVL(COMM,0))*12 ANNUAL_SAL , DEPTNO 
FROM EMP
ORDER BY ENAME ASC;

SELECT ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

SELECT DEPTNO, JOB, ENAME
 FROM EMP
 ORDER BY DEPTNO, JOB DESC;

SELECT EMP.*, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS EXP 
FROM EMP
ORDER BY EXP DESC;

SELECT DEPTNO, JOB, EMPNO, ENAME
FROM EMP
ORDER BY DEPTNO, JOB DESC;

SELECT DEPTNO, JOB FROM EMP;

SELECT ENAME, EMPNO,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,2) AS EXP 
FROM EMP
ORDER BY EXP DESC;

SELECT EMPNO, ENAME, JOB, SAL MONSAL, 
NVL(COMM,0), SAL/30, NVL(COMM,0)/30, 
SAL*12, NVL(COMM,0)*12, (SAL+NVL(COMM,0))*12 GROSS_SAL
FROM EMP
ORDER BY JOB, GROSS_SAL, MONSAL DESC;

SELECT ENAME, EMPNO, JOB, DEPTNO
FROM EMP
WHERE JOB='CLERK';

SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 2000;


SELECT ENAME, EMPNO, SAL, MGR
FROM EMP
WHERE MGR IN (7902,7566,7788);
SELECT ENAME FROM EMP
WHERE LENGTH(ENAME) = 4;


SELECT * FROM EMP
WHERE MGR IS NULL;


SELECT * FROM EMP
WHERE JOB != 'MANAGER';

SELECT * FROM EMP 
WHERE MGR IS NOT NULL;

SELECT ENAME, EMPNO, JOB, SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 2000 AND JOB = 'CLERK';

SELECT * FROM EMP 
WHERE JOB IN ('MANAGER', 'SALESMAN') AND SAL>1500;


SELECT E.ENAME,D.DNAME 
FROM  EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO 
ORDER BY D.DEPTNO ASC;

SELECT * FROM EMP
WHERE DEPTNO IN (10,20) 
ORDER BY ENAME;


SELECT * FROM EMP
WHERE ENAME LIKE '%TH%' OR ENAME LIKE '%TL%';


SELECT * FROM EMP
WHERE TO_CHAR(HIREDATE,'YYYY')=1983;

SELECT * FROM DEPT;

SELECT EMP.*, SAL*12 ANNUALSAL
FROM EMP
WHERE DEPTNO=20 AND SAL > NVL(COMM,0)
ORDER BY SAL DESC, ENAME;


SELECT ENAME WHO, 
'HELD POSITION OF ' || JOB || 'IN DEPT ' || DEPTNO AS WHAT,
'SINCE ' || HIREDATE AS WHEN
FROM EMP;

SELECT ENAME, DEPTNO, SAL*12 ANNUALSAL 
FROM EMP
WHERE JOB = '&&JOB';


SELECT SAL*12 ANNUALSAL, ENAME, JOB FROM EMP ORDER BY ANNUALSAL DESC;

SELECT CONCAT(LOWER(DNAME),LOWER(' HELLO')) FROM DEPT;

SELECT RPAD(ENAME, 25, ' ') FROM EMP;

SELECT DNAME, REGEXP_COUNT(DNAME,'S') FROM DEPT;

SELECT DNAME, LENGTH(DNAME)-LENGTH(REPLACE(DNAME,'S',''))
FROM DEPT;

SELECT * 
FROM EMP
WHERE TO_CHAR(HIREDATE,'MON') = 'MAY';

SELECT *
FROM EMP
WHERE ENAME LIKE 'S____';

SELECT * 
FROM EMP
WHERE ENAME LIKE 'C%' AND SAL > 2400 AND JOB LIKE 'M%';

SELECT * 
FROM EMP
WHERE JOB LIKE '_______' AND TO_CHAR(HIREDATE) ='1981' AND NVL(COMM,0) > 500;


SELECT * FROM EMP
WHERE ENAME LIKE '_%A%A%';


SELECT TO_CHAR(SAL,'9,999.99')
FROM EMP;


SELECT ENAME || TO_CHAR(HIREDATE,' MM, DDSP YYYY') FROM EMP;
	
SELECT ENAME, HIREDATE, HIREDATE+1 AS REVIEW_DATE FROM EMP;

SELECT TO_CHAR(TO_DATE('&DATE','DD.MM.YYYY'), 'DY') FROM DUAL;

SELECT SYSDATE - HIREDATE DAYS
FROM EMP;

SELECT ENAME, SAL+NVL(COMM,0) AS TOTALSAL, 
TO_CHAR(HIREDATE, 'DDTH') || ' OF' || TO_CHAR(HIREDATE,' MONTH YYYY')
FROM EMP
WHERE SAL > 2* NVL(COMM, 0);


SELECT EMP.*, TO_CHAR(HIREDATE, 'MON DD, YY')
FROM EMP;


SELECT ENAME || ' EARNS ' || SAL || ' PER MONTHS BUT WANTS ' || 2*SAL
FROM EMP;

SELECT EMP.*, (MONTHS_BETWEEN(SYSDATE, HIREDATE)/12)-1 AS EXP
FROM EMP
WHERE (MONTHS_BETWEEN(SYSDATE, HIREDATE)/12)-1 BETWEEN 2 AND 40;

SELECT SYSDATE TODAY, SYSDATE-1 YESTERDAY,SYSDATE+1 TOMORROW FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE+5/24, 'DD MON YYYY HH24:MI:SS AM.') 
FROM DUAL;

SELECT SYSTIMESTAMP FROM DUAL;

SELECT EMP.*, MONTHS_BETWEEN(SYSDATE, HIREDATE)/12 AS EXP
FROM EMP
WHERE SAL > 100;


SELECT ENAME,SAL, SAL+0.2*SAL INCREASED_SAL
FROM EMP
WHERE SAL > 3000;

SELECT *
FROM EMP
WHERE HIREDATE = TO_DATE('1 MAY, 1981', 'DD MON, YYYY');


SELECT * 
FROM EMP
WHERE HIREDATE BETWEEN '15-JUN-1981' AND '31-DEC-1981';

SELECT TO_CHAR(TO_DATE('01-JAN-23','DD-MON-YY'), 'Q') FROM EMP;


SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE, 'Q') IN (3,4) AND TO_CHAR(HIREDATE, 'YYYY')= 1981;

SELECT *
FROM EMP
WHERE JOB='CLERK' AND MONTHS_BETWEEN(SYSDATE, HIREDATE)/12 > 8;


SELECT RPAD(ENAME, 25, ' ') FROM EMP;


SELECT ENAME,INSTR(ENAME, 'A'), INSTR(ENAME,'C',1, 2) 
FROM EMP;

--INSTR(STRING,CHAR, POS, OCCURENCE)

SELECT LTRIM(ENAME,'A')
FROM EMP;

SELECT * FROM EMP
WHERE TO_CHAR(HIREDATE, 'YYYY') = 1983;


SELECT * FROM EMP
WHERE ENAME LIKE '%TH%' OR ENAME LIKE '%TL%';


SELECT INSTR('AKAKERAKAIKAFAKAIA','A',5,2) FROM DUAL;


SELECT SAL , HIREDATE
FROM EMP
WHERE MOD(SAL,2) =1 AND MOD(TO_CHAR(HIREDATE,'DD'),2) =1;

SELECT * FROM EMP;

SELECT MOD(3,2) FROM DUAL;

SELECT MOD(TO_CHAR(SYSDATE-1,'DD'),2) FROM DUAL;


SELECT NEXT_DAY(HIREDATE,'FRI') FROM EMP;


SELECT HIREDATE, HIREDATE+TO_CHAR(HIREDATE,'DD') FROM EMP;
SELECT NEXT_DAY(SYSDATE,'TUE') FROM DUAL;

SELECT ENAME, SAL, 
CASE 
    WHEN SAL > 1500 THEN 'MORE THAN 1500'
    WHEN SAL = 1500 THEN '1500'
    WHEN SAL < 1500 THEN 'LESS THAN 1500'
END AS TARGET
FROM EMP;

SELECT ENAME, HIREDATE, 
CASE
	WHEN TO_CHAR(HIREDATE,'DD') <=15  THEN NEXT_DAY(LAST_DAY(HIREDATE)-7, 'FRI')
	WHEN TO_CHAR(HIREDATE,'DD') > 15  THEN NEXT_DAY(LAST_DAY(HIREDATE)+1,'FRI')
END AS PAYDATE
FROM EMP;


SELECT ENAME, DEPTNO, SAL, 
CASE 
	WHEN DEPTNO=10 THEN SAL+SAL*0.05 
	WHEN DEPTNO=11 THEN SAL+SAL*0.07
    ELSE SAL
END AS ADJUSTED_SAL
FROM EMP;

SELECT EMP.*, 
CASE JOB
WHEN 'CLERK' THEN 'MANAGER'
WHEN 'MANAGER' THEN 'SR.MANAGER'
WHEN 'SALESMAN' THEN 'SR.SALESMAN'
ELSE JOB
END AS NEW_JOB
FROM EMP;


SELECT EMP.*,
CASE 
WHEN SAL BETWEEN 1000 AND 1250 THEN SAL+500
WHEN SAL BETWEEN 1251 AND 2500 THEN SAL+600
WHEN SAL BETWEEN 2500 AND 4999 THEN SAL+1000
ELSE SAL
END AS INCRE
FROM EMP;

SELECT * FROM EMP
WHERE JOB = 'MANAGER' AND DEPTNO = 
(SELECT DEPTNO FROM DEPT
WHERE DNAME='ACCOUNTING');

SELECT * 
FROM EMP
WHERE JOB='SALESMAN' AND COMM IS NOT NULL;


SELECT *
FROM EMP WHERE JOB IN ('MANAGER', 'ANALYST') AND DEPTNO IN ( SELECT DEPTNO
FROM DEPT 
WHERE DNAME IN ('ACCOUNTING', 'RESEARCH'))
ORDER BY SAL DESC;



-------------------------------------------------------
--understanding correlated queries

1) Display highest paid employee details for each grade by deptno.

select *
from emp , salgrade 
where emp.sal between salgrade.losal and salgrade.hisal 
and (sal,grade) in (select max(sal), grade from emp , salgrade 
where emp.sal between salgrade.losal and salgrade.hisal group by deptno , grade)
order by deptno, grade;

--or

SELECT ENAME, DEPTNO, SAL, GRADE 
FROM EMP E, SAL_GRADE S
WHERE (SAL, GRADE, DEPTNO) IN 
(SELECT MAX(SAL), GRADE, DEPTNO
FROM EMP E1, SAL_GRADE S1
WHERE E1.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY GRADE,DEPTNO)
ORDER BY DEPTNO;

--OR

SELECT EMPNO, ENAME, SAL, GRADE, DEPTNO
FROM EMP E, SAL_GRADE S
WHERE SAL IN (SELECT MAX(SAL) FROM EMP E1, SAL_GRADE S1
WHERE SAL BETWEEN S1.LOSAL AND S1.HISAL AND S1.GRADE = S.GRADE AND E1.DEPTNO = E.DEPTNO)
ORDER BY DEPTNO;



2) Display Senior most employee of each location.



SELECT E.ENAME, D.LOC, TRUNC(MONTHS_BETWEEN(SYSDATE,E.HIREDATE)/12,4) AS EXP
FROM EMP E, DEPT D
WHERE (MONTHS_BETWEEN(SYSDATE,E.HIREDATE), D.LOC) IN 
(SELECT MAX(MONTHS_BETWEEN(SYSDATE,E1.HIREDATE)), D1.LOC
FROM EMP E1, DEPT D1
WHERE E1.DEPTNO = D1.DEPTNO
GROUP BY D1.LOC);

--(or)

SELECT ENAME, LOC, HIREDATE 
FROM EMP, DEPT
WHERE (HIREDATE, LOC) IN (SELECT MIN(HIREDATE), LOC 
FROM EMP, DEPT
where emp.deptno = dept.deptno
GROUP BY LOC);



3) Display Senior most employee working as Manager for each Deptno.

SELECT E.ENAME, D.DEPTNO, TRUNC(MONTHS_BETWEEN(SYSDATE,E.HIREDATE)/12,4) AS EXP
FROM EMP E, DEPT D
WHERE (MONTHS_BETWEEN(SYSDATE,E.HIREDATE), D.DEPTNO) IN 
(SELECT MAX(MONTHS_BETWEEN(SYSDATE,E1.HIREDATE)), D1.DEPTNO
FROM EMP E1, DEPT D1
WHERE E1.DEPTNO = D1.DEPTNO AND JOB='MANAGER'
GROUP BY D1.DEPTNO);

--OR

SELECT E.ENAME, E.DEPTNO, E.HIREDATE FROM EMP E
WHERE (E.HIREDATE) IN 
(SELECT MIN(E1.HIREDATE) FROM EMP E1
WHERE E1.DEPTNO = E.DEPTNO  AND JOB='MANAGER' );



4) Display lowest paid employee for each Job by Deptno


SELECT * FROM EMP 
WHERE (SAL, JOB, DEPTNO) IN (SELECT MIN(SAL), JOB, DEPTNO
FROM EMP
GROUP BY JOB,DEPTNO)
ORDER BY DEPTNO;




5) Display employees who are earning morethan average salary of their own Job and Deptno combination.

SELECT E1.*
FROM EMP E1
WHERE E1.SAL > (SELECT AVG(SAL) FROM EMP E2
WHERE E2.JOB = E1.JOB) AND E1.SAL > (SELECT AVG(SAL) FROM EMP E3
WHERE E3.DEPTNO = E1.DEPTNO);



6) Display year wise highest paid employees.

SELECT * 
FROM EMP E1
WHERE SAL IN ( SELECT MAX(SAL)
FROM EMP E2
WHERE TO_CHAR(HIREDATE,'YYYY') = TO_CHAR(E1.HIREDATE, 'YYYY')
) ORDER BY HIREDATE;


7) Display year wise highest paid employees BY DEPTNO.

SELECT *
FROM EMP E
WHERE SAL IN (SELECT MAX(SAL) FROM EMP E1
WHERE E1.DEPTNO = E.DEPTNO AND 
TO_CHAR(E1.HIREDATE,'YYYY') = TO_CHAR(E.HIREDATE,'YYYY'))
ORDER BY DEPTNO; 


8) Display year wise highest paid employees BY LOCATION.

SELECT E.EMPNO, E.ENAME, E.HIREDATE, E.DEPTNO, D.LOC
FROM EMP E,DEPT D
WHERE SAL IN (SELECT MAX(SAL) FROM EMP E1, DEPT D1
WHERE D1.LOC = D.LOC AND E1.DEPTNO = D1.DEPTNO AND
TO_CHAR(E1.HIREDATE,'YYYY') = TO_CHAR(E.HIREDATE,'YYYY'))
ORDER BY LOC; 


9) Display MGR wise highest paid employees.


SELECT * 
FROM EMP E
WHERE (SAL) IN (SELECT MAX(SAL)
FROM EMP E1
WHERE E1.MGR = E.MGR)
ORDER BY MGR;


10) Display first employee joined for each manager.

SELECT * 
FROM EMP E 
WHERE (HIREDATE) IN (SELECT MIN(HIREDATE)
FROM EMP E1
WHERE E1.MGR = E.MGR)
ORDER BY MGR;




------------------------
select sal from emp
order by sal desc
fetch next 1 row only;
-------------------------------------





















