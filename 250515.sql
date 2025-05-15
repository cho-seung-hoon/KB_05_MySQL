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
















