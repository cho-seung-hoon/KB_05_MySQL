use employees;

select * from employees.employees
order by birth_date;

Create database scoula_db;
create user 'scoula'@'%' identified by '1234';
grant all privileges on scoula_db.* TO 'scoula'@'%';
flush privileges;

use sqldb;
select * from buytbl;

start transaction;
delete from buytbl where num = 1;
delete from buytbl where num = 2;

select * from buytbl;

rollback;
select * from buytbl;

-- 모든 권한 부여
GRANT ALL PRIVILEGES ON scoula_db TO 'scoula'@'%';

-- 특정 권한만 부여
-- GRANT SELECT, INSERT, UPDATE ON scoula_db TO 'scoula'@'%';

-- 권한 적용
FLUSH PRIVILEGES;