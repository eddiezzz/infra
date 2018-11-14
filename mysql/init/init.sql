DROP USER IF EXISTS 'root'@'%';
DROP USER IF EXISTS 'root'@'localhost';
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '123456';
CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '123456';
GRANT SELECT,DELETE,UPDATE,INSERT,SHOW VIEW,EXECUTE,CREATE TEMPORARY TABLES,RELOAD,REPLICATION SLAVE,REPLICATION CLIENT ON *.* TO 'root'@'%';
GRANT SELECT,DELETE,UPDATE,INSERT,SHOW VIEW,EXECUTE,CREATE TEMPORARY TABLES,RELOAD,REPLICATION SLAVE,REPLICATION CLIENT ON *.* TO 'root'@'localhost';
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '123456';
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '123456';

FLUSH PRIVILEGES;
SELECT count(1) FROM mysql.user WHERE User='root';