-- Write an SQL query to find the UNIQUE records from the EMPLOYEE table.

-- Creating the EMPLOYEE table
CREATE TABLE EMPLOYEE (
EMPLOYEE_ID INT, 
NAME VARCHAR(20), 
SALARY FLOAT 
);

-- Inserting sample data into the Employee table

INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(102,'Pat',6000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(102,'Pat',6000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(103,'Den',11000);
SELECT * FROM EMPLOYEE;

-- SOLTUION: METHOD1: USING GROUP BY

SELECT EMPLOYEE_ID, NAME, SALARY FROM EMPLOYEE
GROUP BY
EMPLOYEE_ID, NAME, SALARY;

-- SOLTUION: METHOD2: USING ROW_NUMBER Analytic Function

SELECT EMPLOYEE_ID, NAME, SALARY 
  FROM (
SELECT EMPLOYEE_ID, NAME, SALARY, ROW_NUMBER() OVER (PARTITION BY EMPLOYEE_ID ORDER BY EMPLOYEE_ID) 
as row_num FROM EMPLOYEE ) temp
WHERE row_num = 1