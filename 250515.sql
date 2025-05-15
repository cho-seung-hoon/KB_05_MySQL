use sqldb;

-- P2
SELECT *
FROM usertbl
         INNER JOIN buytbl ON usertbl.userID = buytbl.userID;

SELECT *
FROM usertbl
         INNER JOIN buytbl ON usertbl.userID = buytbl.userID
where buytbl.userID = 'JYP';

-- P3
SELECT
    usertbl.userID,
    usertbl.name,
    buytbl.prodName,
    usertbl.addr,
    CONCAT(usertbl.mobile1, usertbl.mobile2) AS 연락처
FROM usertbl
         LEFT JOIN buytbl ON usertbl.userID = buytbl.userID
ORDER BY usertbl.userID ASC;

-- P4
SELECT *
FROM usertbl
WHERE mobile1 IS NOT NULL
  AND mobile2 IS NOT NULL;

SELECT *
FROM usertbl
WHERE mobile1 IS NULL
  AND mobile2 IS NULL;

SELECT stdtbl.stdName, stdtbl.addr, clubtbl.clubName, clubtbl.roomNo
FROM clubtbl, stdtbl, stdclubtbl;

SELECT
    stdtbl.stdName,
    stdtbl.addr,
    clubtbl.clubName,
    clubtbl.roomNo
FROM stdtbl
         JOIN stdclubtbl ON stdtbl.stdName = stdclubtbl.stdName
         JOIN clubtbl ON stdclubtbl.clubName = clubtbl.clubName;


SELECT
    clubtbl.clubName,
    clubtbl.roomNo,
    stdtbl.stdName,
    stdtbl.addr
FROM clubtbl
         JOIN stdclubtbl ON clubtbl.clubName = stdclubtbl.clubName
         JOIN stdtbl ON stdclubtbl.stdName = stdtbl.stdName;

SELECT
    emptbl.emp AS 부하직원,
    mgr.emp AS 직속상관,
    mgr.emptel AS 직속상관연락처
FROM emptbl
         JOIN emptbl AS mgr ON emptbl.manager = mgr.emp
WHERE emptbl.emp = '우대리';

USE employees;

SELECT
    employees.emp_no,
    employees.first_name,
    employees.last_name,
    titles.title
FROM employees
         JOIN titles ON employees.emp_no = titles.emp_no
WHERE titles.to_date = '9999-01-01';

SELECT
    employees.*,
    titles.title,
    salaries.salary
FROM employees
         JOIN titles
              ON employees.emp_no = titles.emp_no
         JOIN salaries
              ON employees.emp_no = salaries.emp_no;


SELECT
    employees.emp_no,
    employees.first_name,
    employees.last_name,
    departments.dept_name
FROM employees
         JOIN dept_emp
              ON employees.emp_no = dept_emp.emp_no
         JOIN departments
              ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no ASC;


SELECT
    departments.dept_no,
    departments.dept_name,
    COUNT(*)
FROM dept_emp
         JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY departments.dept_no, departments.dept_name
ORDER BY departments.dept_no ASC;

SELECT
    employees.emp_no,
    employees.first_name,
    employees.last_name,
    departments.dept_name,
    dept_emp.from_date,
    dept_emp.to_date
FROM employees
         JOIN dept_emp
              ON employees.emp_no = dept_emp.emp_no
         JOIN departments
              ON dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no = 10209
ORDER BY dept_emp.from_date ASC;






