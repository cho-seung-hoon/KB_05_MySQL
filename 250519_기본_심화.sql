-- P2
DROP DATABASE tabledb;
CREATE DATABASE tabledb;

USE tabledb;
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl(
    userID  CHAR(8) NOT NULL PRIMARY KEY,
    name    VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr    CHAR(2) NOT NULL,
    mobile1 CHAR(3) NULL,
    mobile2 CHAR(8) NULL,
    height  SMALLINT NULL,
    mDate   DATE NULL
);

-- P3
DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl(
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userid CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    groupName CHAR(4) NULL,
    price INT NOT NULL,
    amount SMALLINT NOT NULL,
    FOREIGN KEY(userid) REFERENCES usertbl(userID)
);


-- P4
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
-- INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
-- JYP라는 userID가 존재하지 않아 에러 발생

-- P5
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl (
    userID  CHAR(8) NOT NULL,
    name    VARCHAR(10) NOT NULL,
    birthYear   INT NOT NULL,
    CONSTRAINT PRIMARY KEY  PK_userTBL_userID(userID)
);

-- P6
DROP TABLE IF EXISTS prodtbl;
CREATE TABLE prodTbl (
    prodCode    CHAR(3) NOT NULL,
    prodID  CHAR(4) NOT NULL,
    prodDate    DATETIME NOT NULL,
    prodCur CHAR(10) NULL,
    CONSTRAINT PK_prodtbl_proCode_prodID
        PRIMARY KEY (prodCode, prodID)
);

-- P7
USE sqldb;
CREATE VIEW v_userbuytbl
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U
        INNER JOIN buytbl B
 ON U.userid = B.userid;

SELECT * FROM v_userbuytbl WHERE name = '김범수';



-- -----심화------
-- P2
USE tabledb;

DROP TABLE IF EXISTS usertbl;
CREATE TABLE userTBL
(
    userID    CHAR(8)     NOT NULL PRIMARY KEY,
    name      VARCHAR(10) NOT NULL,
    birthYear INT         NOT NULL
);

DROP TABLE IF EXISTS buytbl;
CREATE TABLE buyTBL
(
    num      INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID   CHAR(8)            NOT NULL,
    prodName CHAR(6)            NOT NULL,
    FOREIGN KEY (userID) REFERENCES userTBL (userID)
);

-- P3
DROP TABLE IF EXISTS buytbl;
DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl
(
    userID CHAR(8)     NOT NULL PRIMARY KEY,
    name   VARCHAR(10) NOT NULL,
    birthYear INT   NOT NULL,
    email  CHAR(30) NULL UNIQUE
);

-- P4
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
(
    userID    CHAR(8) PRIMARY KEY,
    name      VARCHAR(10),
    birthYear INT CHECK (birthYear >= 1900 AND birthYear <= 2023),
    mobile1   char(3) NOT NULL
);

-- P5
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
(
    userID    CHAR(8)     NOT NULL PRIMARY KEY,
    name      VARCHAR(10) NOT NULL DEFAULT '없음',
    birthYear INT         NOT NULL DEFAULT -1,
    addr      CHAR(2)     NOT NULL DEFAULT '서울',
    mobile1   CHAR(3)     NULL,
    mobile2   CHAR(8)     NULL,
    height    SMALLINT    NULL     DEFAULT 170,
    mDate     DATE        NULL
);

-- P6
ALTER TABLE usertbl
    DROP COLUMN mobile1;

ALTER TABLE usertbl
    CHANGE COLUMN name uName VARCHAR(10) NOT NULL;

ALTER TABLE usertbl
    DROP PRIMARY KEY;

-- P9
USE employees;
DROP VIEW IF EXISTS EMPLOYEES_INFO;
CREATE VIEW EMPLOYEES_INFO
AS
SELECT
    employees.emp_no,
    employees.birth_date,
    employees.first_name,
    employees.last_name,
    employees.gender,
    employees.hire_date,
    titles.title,
    titles.from_date as t_from,
    titles.to_date as t_to,
    salaries.salary,
    salaries.from_date as s_from,
    salaries.to_date as s_to
FROM
    employees, titles, salaries;

SELECT * FROM EMPLOYEES_INFO;

-- P10
SELECT * FROM EMPLOYEES_INFO
WHERE s_to = '9999-01-01';

-- P11
DROP VIEW IF EXISTS EMP_DEPT_INFO;
CREATE VIEW EMP_DEPT_INFO
AS
SELECT
    dept_emp.emp_no,
    dept_emp.dept_no,
    departments.dept_name,
    dept_emp.from_date,
    dept_emp.to_date
FROM    dept_emp, departments;

SELECT * FROM EMP_DEPT_INFO;

-- P12
SELECT * FROM EMP_DEPT_INFO
WHERE to_date = '9999-01-01';