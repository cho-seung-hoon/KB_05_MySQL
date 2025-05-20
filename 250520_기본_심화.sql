-- P2
USE sqldb;
CREATE TABLE tbl1
(
    a INT PRIMARY KEY,
    b INT,
    c INT
);
SHOW INDEX FROM tbl1;

-- P3
CREATE TABLE tbl2
(
    a INT PRIMARY KEY,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT
);
SHOW INDEX FROM tbl2;

-- P4
CREATE TABLE tbl3
(
    a INT UNIQUE,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT
);
SHOW INDEX FROM tbl3;

-- P5
CREATE TABLE tbl4
(
    a INT UNIQUE NOT NULL,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT
);
SHOW INDEX FROM tbl4;

-- P6
CREATE TABLE tbl5
(
    a INT UNIQUE NOT NULL,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT PRIMARY KEY
);
SHOW INDEX FROM tbl5;

-- P7
CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
CREATE TABLE usertbl
(
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr NCHAR(2) NOT NULL
);
SHOW INDEX FROM usertbl;

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울');

-- P8
ALTER TABLE usertbl DROP PRIMARY KEY;
ALTER TABLE usertbl
    ADD CONSTRAINT pk_name PRIMARY KEY(name);

SELECT * FROM usertbl;


-- -------심화-------
-- P2
USE sqldb;
SELECT * FROM usertbl;
SHOW INDEX FROM usertbl;
SHOW TABLE STATUS LIKE 'usertbl';

-- P3
CREATE INDEX idx_usertbl_addr ON usertbl(addr);
SHOW INDEX FROM usertbl;

-- P4
SHOW TABLE STATUS LIKE 'usertbl';
ANALYZE TABLE usertbl;
SHOW TABLE STATUS LIKE 'usertbl';

-- P5
CREATE UNIQUE INDEX idx_usertbl_birthYear ON usertbl(birthYear);
-- 중복값이 존재하여 에러
CREATE UNIQUE INDEX idx_usertbl_name ON usertbl(name);
SHOW INDEX FROM usertbl;

-- P6
DROP INDEX idx_usertbl_name ON usertbl;
CREATE UNIQUE INDEX idx_usertbl_name_birthYear ON usertbl(name, birthYear);
SHOW INDEX FROM usertbl;

-- P7
DROP INDEX idx_usertbl_addr ON usertbl;
DROP INDEX idx_usertbl_name_birthYear ON usertbl;

-- P9
Create database scoula_db;
create user 'scoula'@'%' identified by '1234';
grant all privileges on scoula_db.* TO 'scoula'@'%';
flush privileges;