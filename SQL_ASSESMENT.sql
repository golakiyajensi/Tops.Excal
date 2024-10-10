use jensi;
/****************************************QUESTION-1*******************************************************/
/****************************************QUESTION-1*******************************************************/
CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATE,
    DEPARTMENT VARCHAR(50)
);
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-06-11', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-06-11', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11', 'Admin');

select * from Worker;
/*1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. */
SELECT * FROM Worker ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

/*2.Write an SQL query to print details for Workers with the first names "Vipul" and "Satish" from the Worker table:*/
SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul', 'Satish');

/*3.Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'h' and contains six alphabets:*/
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_____h';

/*4.Write an SQL query to print details of the Workers whose SALARY lies between 1 and 100000:*/
SELECT * FROM Worker WHERE SALARY BETWEEN 1 AND 100000;

/*5.Write an SQL query to fetch duplicate records having matching data in some fields of a table:*/
SELECT FIRST_NAME, LAST_NAME, COUNT(*) FROM Worker
GROUP BY FIRST_NAME, LAST_NAME HAVING COUNT(*) > 1;

/*6.Write an SQL query to show the top 6 records of a table:*/
SELECT * FROM Worker LIMIT 6;

/*7.Write an SQL query to fetch the departments that have less than five people in them:*/
SELECT DEPARTMENT, COUNT(*) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(*) < 5;

/*8.Write an SQL query to show all departments along with the number of people in there:*/
SELECT DEPARTMENT, COUNT(*) AS NumberOfWorkers FROM Worker GROUP BY DEPARTMENT;

/*9.Write an SQL query to print the name of employees having the highest salary in each department:*/
SELECT DEPARTMENT, FIRST_NAME, LAST_NAME, SALARY FROM Worker W
WHERE SALARY = (SELECT MAX(SALARY) FROM Worker WHERE DEPARTMENT = W.DEPARTMENT);


/****************************************QUESTION-2*******************************************************/
/****************************************QUESTION-2*******************************************************/
CREATE TABLE student1 (
    StdID INT PRIMARY KEY,
    StdName VARCHAR(50),
    Sex VARCHAR(10),
    Percentage INT,
    Class VARCHAR(10),
    Sec CHAR(1),
    Stream VARCHAR(20),
    DOB DATE
);

INSERT INTO student1 (StdID, StdName, Sex, Percentage, Class, Sec, Stream, DOB) VALUES
(1001, 'Surekha Joshi', 'Female', 82, '12', 'A', 'Science', '1998-03-08'),
(1002, 'Maahi Agarwal', 'Female', 56, '11', 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, '11', 'C', 'Commerce', '1996-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, '11', 'C', 'Commerce', '1997-11-05'),
(1005, 'Dipesh Pulkit', 'Male', 78, '11', 'B', 'Science', '2003-09-14'),
(1006, 'Jahanvi Puri', 'Female', 75, '12', 'A', 'Science', '2008-11-09'),
(1007, 'Sanam Kumar', 'Male', 56, '11', 'F', 'Commerce', '1998-03-08'),
(1008, 'Sahil Saras', 'Male', 72, '11', 'B', 'Commerce', '1999-12-11'),
(1009, 'Akshra Agarwal', 'Female', 79, '12', 'C', 'Commerce', '1996-01-11'),
(1010, 'Stuti Mishra', 'Female', 43, '12', 'B', 'Commerce', '1998-03-19'),
(1011, 'Harsh Agarwal', 'Male', 49, '11', 'E', 'Science', '1998-06-28'),
(1012, 'Nikunj Agarwal', 'Male', 89, '12', 'A', 'Science', '1998-06-28'),
(1013, 'Akriti Saxena', 'Female', 39, '11', 'D', 'Science', '2008-09-11'),
(1014, 'Tani Rastogi', 'Female', 82, '12', 'A', 'Science', '2008-11-23');

/*1.To display all records from the student table:*/
SELECT * FROM student1;

/*2.To display any name and date of birth from the table:*/
SELECT StdName, DOB FROM student1;

/*3.To display all students where percentage is greater than or equal to 80:*/
SELECT * FROM student1 WHERE Percentage >= 80;

/*4.To display student name, stream, and percentage where percentage is more than 80:*/
SELECT StdName, Stream, Percentage FROM student1 WHERE Percentage > 80;

/*5.To display all records of science students whose percentage is more than 75:*/
SELECT * FROM student1 WHERE Stream = 'Science' AND Percentage > 75;

